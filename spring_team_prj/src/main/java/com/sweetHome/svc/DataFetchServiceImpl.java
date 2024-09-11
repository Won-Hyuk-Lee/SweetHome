package com.sweetHome.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import com.sweetHome.mapper.RecommendMapper;
import com.sweetHome.vo.DistrictVO;
import com.sweetHome.vo.RealEstateData;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.StringReader;
import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

@Service
public class DataFetchServiceImpl implements DataFetchService {

    private final RecommendMapper recommendMapper;
    private static final String API_KEY = "79586e424d6c77683535765561584d";
    private static final String API_URL = "http://openapi.seoul.go.kr:8088/" + API_KEY + "/xml/tbLnOpendataRtmsV/{start}/{end}/{year}";
    private static final int CHUNK_SIZE = 1000;

    private final RestTemplate restTemplate = new RestTemplate();

    @Autowired
    public DataFetchServiceImpl(RecommendMapper recommendMapper) {
        this.recommendMapper = recommendMapper;
    }

    @Override
    public List<DistrictVO> getAllDistrictsFromDB() {
        List<DistrictVO> districts = recommendMapper.getAllDistricts();
        return districts != null ? districts : new ArrayList<>();
    }

    @Override
    public DistrictVO getDistrictFromDB(String districtCode) {
        return recommendMapper.getDistrictByCode(districtCode);
    }

    @Override
    public Map<String, Double> getCrimeTotalByDistrict() {
        List<Map<String, Object>> crimeList = recommendMapper.getCrimeTotalByDistrict();
        return convertListToMap(crimeList, "districtCode", "crimeTotal", String.class, Double.class);
    }

    @Override
    public Map<String, Double> getCCTVDensityByDistrict() {
        List<Map<String, Object>> cctvList = recommendMapper.getCCTVDensityByDistrict();
        return convertListToMap(cctvList, "districtCode", "cctvDensity", String.class, Double.class);
    }

    @Override
    public Map<String, Double> getPopulationByDistrict() {
        List<Map<String, Object>> populationList = recommendMapper.getPopulationByDistrict();
        return convertListToMap(populationList, "districtCode", "population", String.class, Double.class);
    }

    @Override
    public Map<String, String> getDistrictCodeToNameMap() {
        List<DistrictVO> districts = getAllDistrictsFromDB();
        Map<String, String> codeToNameMap = new HashMap<>();
        for (DistrictVO district : districts) {
            codeToNameMap.put(district.getDistrictCode(), district.getDistrictName());
        }
        return codeToNameMap;
    }

    private <K, V> Map<K, V> convertListToMap(List<Map<String, Object>> list, String keyField, String valueField,
                                              Class<K> keyClass, Class<V> valueClass) {
        Map<K, V> resultMap = new HashMap<>();
        if (list != null) {
            for (Map<String, Object> map : list) {
                K key = keyClass.cast(map.get(keyField));
                Object value = map.get(valueField);
                if (key != null && value != null) {
                    resultMap.put(key, valueClass.cast(value));
                }
            }
        }
        return resultMap;
    }

    @Override
    public List<RealEstateData> fetchRealEstateData() {
        return fetchAllRealEstateData();
    }

    @Override
    public Map<String, Double> getRealEstateAveragePrices() {
        List<RealEstateData> allData = fetchAllRealEstateData();
        return calculateAveragePricePerDistrict(allData);
    }

    private List<RealEstateData> fetchAllRealEstateData() {
        List<CompletableFuture<List<RealEstateData>>> futures = new ArrayList<>();
        int currentYear = Calendar.getInstance().get(Calendar.YEAR);

        for (int year = currentYear - 2; year <= currentYear; year++) {
            int totalCount = getTotalCount(year);
            int iterations = (totalCount + CHUNK_SIZE - 1) / CHUNK_SIZE;

            for (int i = 0; i < iterations; i++) {
                int start = i * CHUNK_SIZE + 1;
                int end = Math.min((i + 1) * CHUNK_SIZE, totalCount);
                int finalYear = year;
                futures.add(CompletableFuture.supplyAsync(() -> fetchDataChunk(start, end, finalYear)));
            }
        }

        return futures.stream()
                .map(CompletableFuture::join)
                .flatMap(List::stream)
                .collect(Collectors.toList());
    }

    private int getTotalCount(int year) {
        String url = API_URL.replace("{start}", "1")
                             .replace("{end}", "1")
                             .replace("{year}", String.valueOf(year));
        String xmlResponse = restTemplate.getForObject(url, String.class);
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(new org.xml.sax.InputSource(new StringReader(xmlResponse)));
            NodeList nodeList = doc.getElementsByTagName("list_total_count");
            if (nodeList.getLength() > 0) {
                return Integer.parseInt(nodeList.item(0).getTextContent());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    private List<RealEstateData> fetchDataChunk(int start, int end, int year) {
        String url = API_URL.replace("{start}", String.valueOf(start))
                             .replace("{end}", String.valueOf(end))
                             .replace("{year}", String.valueOf(year));
        String xmlResponse = restTemplate.getForObject(url, String.class);
        return parseXmlResponse(xmlResponse);
    }

    private List<RealEstateData> parseXmlResponse(String xmlResponse) {
        List<RealEstateData> dataList = new ArrayList<>();
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document doc = builder.parse(new org.xml.sax.InputSource(new StringReader(xmlResponse)));
            NodeList nodeList = doc.getElementsByTagName("row");
            for (int i = 0; i < nodeList.getLength(); i++) {
                Element element = (Element) nodeList.item(i);
                RealEstateData data = new RealEstateData();
                data.setDistrict(getElementTextContent(element, "CGG_NM"));
                data.setPrice(Double.parseDouble(getElementTextContent(element, "THING_AMT")));
                data.setArea(Double.parseDouble(getElementTextContent(element, "ARCH_AREA")));
                dataList.add(data);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dataList;
    }

    private String getElementTextContent(Element element, String tagName) {
        NodeList nodeList = element.getElementsByTagName(tagName);
        if (nodeList.getLength() > 0) {
            return nodeList.item(0).getTextContent();
        }
        return "";
    }

    private Map<String, Double> calculateAveragePricePerDistrict(List<RealEstateData> allData) {
        Map<String, List<RealEstateData>> groupedByDistrict = allData.stream()
                .collect(Collectors.groupingBy(RealEstateData::getDistrict));

        return groupedByDistrict.entrySet().stream()
                .collect(Collectors.toMap(
                        Map.Entry::getKey,
                        entry -> calculateAveragePrice(entry.getValue())
                ));
    }

    private double calculateAveragePrice(List<RealEstateData> districtData) {
        return districtData.stream()
                .mapToDouble(data -> data.getPrice() / data.getArea())
                .average()
                .orElse(0.0);
    }
}