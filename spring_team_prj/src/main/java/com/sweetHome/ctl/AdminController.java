package com.sweetHome.ctl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sweetHome.common.PagingUtil;
import com.sweetHome.svc.AdminService;
import com.sweetHome.svc.BoardService;
import com.sweetHome.vo.BoardVO;


@RequestMapping(value = "/admin")
@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value = "/all_board_list")
	public String ctlBoardList(Model model) {
		
		List<BoardVO> list = adminService.svcAllBoardList();
		model.addAttribute("KEY_BOARDLIST", list);
		return "jsp/admin";
	}
	
	@RequestMapping(value ="board_delete")
	public String ctlBoardDelete(@RequestParam("boardSeq") int boardSeq) {
		adminService.svcBoardDelete(boardSeq);
		return "redirect:/admin/all_board_list";
	}
}
