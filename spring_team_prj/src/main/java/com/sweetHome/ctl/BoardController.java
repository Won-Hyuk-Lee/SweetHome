package com.sweetHome.ctl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sweetHome.svc.BoardService;
import com.sweetHome.vo.BoardImagesVO;
import com.sweetHome.vo.BoardVO;


@RequestMapping(value = "/board")
@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/board_list", method=RequestMethod.GET)
	public String ctlBoardList(@RequestParam("communitySeq") int communitySeq, Model model){
		List<BoardVO> boardList = boardService.svcBoardList(communitySeq);
		model.addAttribute("KEY_BOARDLIST", boardList);
		return "jsp/board";
	} // (�Խñ� ��ü ��ȸ)
	
	@RequestMapping(value = "/board_detail", method=RequestMethod.GET)
	public String ctlBoardDetail(@RequestParam("boardSeq") int boardSeq, Model model) {
		BoardVO bvo = boardService.svcBoardDetail(boardSeq);
		model.addAttribute("KEY_BOARDVO", bvo);
		
		return "jsp/board_detail";
	} //(�Խñ� �� ������ȸ)
	

	
	
	@RequestMapping(value = "/board_insert", method=RequestMethod.POST)
	public String ctlBoardInsert(@RequestParam("boardImages") List<MultipartFile> files, @ModelAttribute BoardVO bvo) {
		List<BoardImagesVO> flist = new ArrayList<BoardImagesVO>();
		System.out.println(files.toString()+"======================================");
			if(files.isEmpty() == true) {
				for(MultipartFile file : files) {
					BoardImagesVO fvo = new BoardImagesVO();
					String uploadFolder = "C:\\KOSTA\\S3917_J11\\workspace_sts3\\uploads";
					String uniqueName	= UUID.randomUUID().toString().split("-")[0];
					String fileRealName = file.getOriginalFilename();
					String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
					String filePath = uploadFolder + "\\" + uniqueName + fileExtension;

					fvo.setOname(file.getOriginalFilename());
					fvo.setFsize(file.getSize());
					fvo.setSname(uniqueName);
					fvo.setFpath(filePath);
					System.out.println(fvo.toString());

					try {
						file.transferTo(new File(filePath));
						flist.add(fvo);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		boardService.svcBoardInsert(bvo, flist);
		return "redirect:/board/board_list";
	} // (�Խñ� +�̹��� �߰�)
	
	
	
	
//	ctlBoardUpdate (�Խñ� ����)
//	ctlBoardDelete (�Խñ� ����)
	
	@RequestMapping(value="board_recommend", method=RequestMethod.POST)
	public void ctlBoardRecommend(@RequestParam("boardSeq") int boardSeq, @RequestParam("userSeq") int userSeq) {
		boardService.svcBoardRecommend(boardSeq, userSeq);
	} //(�Խñ� ��õ)
//	ctlBoardSearch (�Խñ� ���� �˻�)
//	ctlBoardSearch (�Խñ� ���� �˻�)
//	ctlBoardSearch (�Խñ� ����+���� �˻�)
//	ctlBoardSearch (Ư�� ���� �Խñ� �˻�)
}
