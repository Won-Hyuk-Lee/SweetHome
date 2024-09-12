package com.sweetHome.ctl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sweetHome.svc.RecommendService;

/**
 * 지도 관련 컨트롤러
 * 
 * 이 컨트롤러는 지도 뷰 표시와 추천 서비스 요청을 처리합니다.
 */
@Controller
@RequestMapping("/map")
public class MapController {

	/**
	 * 추천 서비스 인터페이스
	 */
	@Autowired
	private RecommendService recommendService;

	/**
	 * 지도 뷰를 표시합니다.
	 * 
	 * @param district 표시할 지역 (자치구)
	 * @param model    Spring MVC 모델
	 * @return 지도 뷰의 이름
	 */
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String showMap(@RequestParam("district") String district, Model model) {
		model.addAttribute("district", district);
		return "map";
	}

	/**
	 * 추천 서비스를 실행하고 결과를 반환합니다.
	 * 
	 * @param district             기준 지역 (자치구)
	 * @param latitude             위도
	 * @param longitude            경도
	 * @param distanceImportance   거리 중요도
	 * @param safetyImportance     안전 중요도
	 * @param realEstateImportance 부동산 가격 중요도
	 * @return 추천된 지역 목록
	 */
	@RequestMapping(value = "/recommend", method = RequestMethod.POST)
	@ResponseBody
	public List<String> getRecommendations(@RequestParam String district, @RequestParam double latitude,
			@RequestParam double longitude, @RequestParam int distanceImportance, @RequestParam int safetyImportance,
			@RequestParam int realEstateImportance) {
		return recommendService.getRecommendations(district, latitude, longitude, distanceImportance, safetyImportance,
				realEstateImportance);
	}
}