package com.sweetHome.ctl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Element;

import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

@Controller
public class ApiController {

    @RequestMapping("/testapi")
    public String testApi() {
        return "testapi";
    }

    @RequestMapping("/api/test")
    @ResponseBody
    public List<Map<String, String>> testApiRequest() throws Exception {
        String apiUrl = "http://api.sexoffender.go.kr/openapi/SOCitysStats/";
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        connection.setRequestProperty("Content-Type", "application/xml");

        InputStream responseStream = connection.getInputStream();
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        Document doc = builder.parse(responseStream);

        doc.getDocumentElement().normalize();
        NodeList nList = doc.getElementsByTagName("City");

        List<Map<String, String>> cityList = new ArrayList<>();

        for (int temp = 0; temp < nList.getLength(); temp++) {
            Element element = (Element) nList.item(temp);
            String cityName = element.getElementsByTagName("city-name").item(0).getTextContent();
            String cityCount = element.getElementsByTagName("city-count").item(0).getTextContent();

            Map<String, String> cityData = new HashMap<>();
            cityData.put("city-name", cityName);
            cityData.put("city-count", cityCount);

            cityList.add(cityData);
        }

        return cityList;
    }
}
