package com.sweetHome.svc;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.stream.Collectors;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.sweetHome.mapper.RecommendMapper;
import com.sweetHome.vo.DistrictVO;
import com.sweetHome.vo.RealEstateData;

/**
 * 데이터 조회 서비스 구현 클래스
 * 
 * 이 클래스는 DataFetchService 인터페이스를 구현하여 실제 데이터 조회 로직을 제공합니다. 데이터베이스 조회, API 호출,
 * 데이터 변환 등의 작업을 수행합니다.
 */
@Service
public class DataFetchServiceImpl implements DataFetchService {

	private final RecommendMapper recommendMapper;

	// API 관련 상수
	private static final String API_KEY = "79586e424d6c77683535765561584d";
	private static final String API_URL = "http://openapi.seoul.go.kr:8088/" + API_KEY
			+ "/xml/tbLnOpendataRtmsV/{start}/{end}/2024";
	private static final int CHUNK_SIZE = 1000;

	private final RestTemplate restTemplate = new RestTemplate();

	@Autowired
	public DataFetchServiceImpl(RecommendMapper recommendMapper) {
		this.recommendMapper = recommendMapper;
	}

	/**
	 * 데이터베이스에서 모든 자치구 정보를 조회합니다.
	 * 
	 * @return 자치구 정보 리스트. 데이터가 없으면 빈 리스트를 반환합니다.
	 */
	@Override
	public List<DistrictVO> getAllDistrictsFromDB() {
		List<DistrictVO> districts = recommendMapper.getAllDistricts();
		return districts != null ? districts : new ArrayList<>();
	}

	/**
	 * 특정 자치구 코드에 해당하는 자치구 정보를 데이터베이스에서 조회합니다.
	 * 
	 * @param districtCode 조회할 자치구 코드
	 * @return 해당 자치구의 정보
	 */
	@Override
	public DistrictVO getDistrictFromDB(String districtCode) {
		return recommendMapper.getDistrictByCode(districtCode);
	}

	/**
	 * 각 자치구별 총 범죄 건수를 조회합니다.
	 * 
	 * @return 자치구 코드를 키로, 총 범죄 건수를 값으로 하는 맵
	 */
	@Override
	public Map<String, Double> getCrimeTotalByDistrict() {
		List<Map<String, Object>> crimeList = recommendMapper.getCrimeTotalByDistrict();
		return convertListToMap(crimeList, "districtCode", "crimeTotal", String.class, Double.class);
	}

	/**
	 * 각 자치구별 CCTV 밀도를 조회합니다.
	 * 
	 * @return 자치구 코드를 키로, CCTV 밀도를 값으로 하는 맵
	 */
	@Override
	public Map<String, Double> getCCTVDensityByDistrict() {
		List<Map<String, Object>> cctvList = recommendMapper.getCCTVDensityByDistrict();
		return convertListToMap(cctvList, "districtCode", "cctvDensity", String.class, Double.class);
	}

	/**
	 * 각 자치구별 인구수를 조회합니다.
	 * 
	 * @return 자치구 코드를 키로, 인구수를 값으로 하는 맵
	 */
	@Override
	public Map<String, Double> getPopulationByDistrict() {
		List<Map<String, Object>> populationList = recommendMapper.getPopulationByDistrict();
		return convertListToMap(populationList, "districtCode", "population", String.class, Double.class);
	}

	/**
	 * 자치구 코드와 이름의 매핑을 생성합니다.
	 * 
	 * @return 자치구 코드를 키로, 자치구 이름을 값으로 하는 맵
	 */
	@Override
	public Map<String, String> getDistrictCodeToNameMap() {
		List<DistrictVO> districts = getAllDistrictsFromDB();
		Map<String, String> codeToNameMap = new HashMap<>();
		for (DistrictVO district : districts) {
			codeToNameMap.put(district.getDistrictCode(), district.getDistrictName());
		}
		return codeToNameMap;
	}

	/**
	 * 자치구 이름과 코드의 매핑을 생성합니다.
	 * 
	 * @return 자치구 이름을 키로, 자치구 코드를 값으로 하는 맵
	 */
	@Override
	public Map<String, String> getDistrictNameToCodeMap() {
		List<DistrictVO> districts = getAllDistrictsFromDB();
		Map<String, String> nameToCodeMap = new HashMap<>();
		for (DistrictVO district : districts) {
			nameToCodeMap.put(district.getDistrictName(), district.getDistrictCode());
		}
		return nameToCodeMap;
	}

	/**
	 * 리스트 형태의 맵 데이터를 단일 맵으로 변환합니다.
	 * 
	 * @param list       변환할 리스트
	 * @param keyField   키로 사용할 필드 이름
	 * @param valueField 값으로 사용할 필드 이름
	 * @param keyClass   키의 클래스
	 * @param valueClass 값의 클래스
	 * @return 변환된 맵
	 */
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

	/**
	 * 부동산 데이터를 API로부터 조회합니다.
	 * 
	 * @return 조회된 부동산 데이터 리스트
	 */
	@Override
	public List<RealEstateData> fetchRealEstateData() {
		return fetchAllRealEstateData();
	}

	/**
	 * 모든 부동산 데이터를 비동기적으로 조회합니다.
	 * 
	 * @return 조회된 모든 부동산 데이터 리스트
	 */
	private List<RealEstateData> fetchAllRealEstateData() {
		List<CompletableFuture<List<RealEstateData>>> futures = new ArrayList<>();

		int totalCount = getTotalCount(2024);
		int iterations = (totalCount + CHUNK_SIZE - 1) / CHUNK_SIZE;

		for (int i = 0; i < iterations; i++) {
			int start = i * CHUNK_SIZE + 1;
			int end = Math.min((i + 1) * CHUNK_SIZE, totalCount);
			futures.add(CompletableFuture.supplyAsync(() -> fetchDataChunk(start, end)));
		}

		return futures.stream().map(CompletableFuture::join).flatMap(List::stream).collect(Collectors.toList());
	}

	/**
	 * API로부터 총 데이터 개수를 조회합니다.
	 * 
	 * @param year 조회할 연도
	 * @return 총 데이터 개수
	 */
	private int getTotalCount(int year) {
		String url = API_URL.replace("{start}", "1").replace("{end}", "1");
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

	/**
	 * API로부터 특정 범위의 데이터를 조회합니다.
	 * 
	 * @param start 시작 인덱스
	 * @param end   종료 인덱스
	 * @return 조회된 부동산 데이터 리스트
	 */
	private List<RealEstateData> fetchDataChunk(int start, int end) {
		String url = API_URL.replace("{start}", String.valueOf(start)).replace("{end}", String.valueOf(end));
		String xmlResponse = restTemplate.getForObject(url, String.class);
		return parseXmlResponse(xmlResponse);
	}

	/**
	 * XML 응답을 파싱하여 부동산 데이터 리스트로 변환합니다.
	 * 
	 * @param xmlResponse XML 형식의 응답 문자열
	 * @return 파싱된 부동산 데이터 리스트
	 */
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
				data.setPricePerArea(data.getPrice() / data.getArea());
				dataList.add(data);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataList;
	}

	/**
	 * XML 요소에서 특정 태그의 텍스트 내용을 추출합니다.
	 * 
	 * @param element XML 요소
	 * @param tagName 추출할 태그 이름
	 * @return 추출된 텍스트 내용
	 */
	private String getElementTextContent(Element element, String tagName) {
		NodeList nodeList = element.getElementsByTagName(tagName);
		if (nodeList.getLength() > 0) {
			return nodeList.item(0).getTextContent();
		}
		return "";
	}

	/**
	 * 각 자치구별 평균 부동산 가격을 계산합니다.
	 * 
	 * @return 자치구 코드를 키로, 평균 부동산 가격을 값으로 하는 맵
	 */
	@Override
	public Map<String, Double> getRealEstateAveragePrices() {
		List<RealEstateData> allData = fetchRealEstateData();
		Map<String, Double> averagePrices = calculateAveragePricePerDistrict(allData);
		Map<String, String> nameToCodeMap = getDistrictNameToCodeMap();

		return averagePrices.entrySet().stream().filter(entry -> nameToCodeMap.containsKey(entry.getKey()))
				.collect(Collectors.toMap(entry -> nameToCodeMap.get(entry.getKey()), Map.Entry::getValue));
	}

	/**
	 * 부동산 데이터로부터 각 자치구별 평균 가격을 계산합니다.
	 * 
	 * @param allData 모든 부동산 데이터
	 * @return 자치구 이름을 키로, 평균 가격을 값으로 하는 맵
	 */
	private Map<String, Double> calculateAveragePricePerDistrict(List<RealEstateData> allData) {
		return allData.stream().collect(Collectors.groupingBy(RealEstateData::getDistrict,
				Collectors.averagingDouble(RealEstateData::getPricePerArea)));
	}
}