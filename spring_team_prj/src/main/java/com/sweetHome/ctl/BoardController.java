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

import com.sweetHome.svc.BoardService;
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
	} // (게시글 전체 조회)
	
	@RequestMapping(value = "/board_detail", method=RequestMethod.GET)
	public String ctlBoardDetail(@RequestParam("boardSeq") int boardSeq, Model model) {
		BoardVO bvo = boardService.svcBoardDetail(boardSeq);
		model.addAttribute("KEY_BOARDVO", bvo);
		
		return "jsp/board_detail";
	} //(게시글 상세 정보조회)
	
	@RequestMapping(value="/board_insert", method=RequestMethod.POST)
	public String ctlBoardInsert(@ModelAttribute BoardVO bvo) {
		boardService.svcBoardInsert(bvo);
		
		return "redirect:/board/board_list?communitySeq="+bvo.getCommunitySeq();
	}

//	@RequestMapping(value = "/board_insert", method=RequestMethod.POST)
//	public String ctlBoardInsert(@RequestParam("boardImages") List<MultipartFile> files, @ModelAttribute BoardVO bvo) {
//		System.out.println(files.size()+bvo.toString());
//		List<BoardImagesVO> flist = new ArrayList<BoardImagesVO>();
//		System.out.println(files.toString()+"======================================");
//			if(files.isEmpty() == true) {
//				for(MultipartFile file : files) {
//					BoardImagesVO fvo = new BoardImagesVO();
//					String uploadFolder = "C:\\KOSTA\\S3917_J11\\workspace_sts3\\uploads";
//					String uniqueName	= UUID.randomUUID().toString().split("-")[0];
//					String fileRealName = file.getOriginalFilename();
//					String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
//					String filePath = uploadFolder + "\\" + uniqueName + fileExtension;
//
//					fvo.setOname(file.getOriginalFilename());
//					fvo.setFsize(file.getSize());
//					fvo.setSname(uniqueName);
//					fvo.setFpath(filePath);
//					System.out.println(fvo.toString());
//
//					try {
//						file.transferTo(new File(filePath));
//						flist.add(fvo);
//					} catch (IllegalStateException e) {
//						e.printStackTrace();
//					} catch (IOException e) {
//						e.printStackTrace();
//					}
//				}
//			}
//		boardService.svcBoardInsert(bvo, flist);
//		return "redirect:/board/board_list";
//	} // (게시글 +이미지 추가)
	
	@RequestMapping(value="board_update_move", method=RequestMethod.GET)
	public String ctlBoardUpdateMove(@RequestParam("boardSeq") int boardSeq, Model model) {
		BoardVO bvo = boardService.svcBoardDetail(boardSeq);
		model.addAttribute("KEY_UPDATE_DATA", bvo);
		
		return "jsp/board_update";
	}
	
	@RequestMapping(value="board_update", method=RequestMethod.POST)
	public String ctlBoardUpdate(@ModelAttribute BoardVO bvo){
		boardService.svcBoardUpdate(bvo);
		
		return "redirect:/board/board_detail?boardSeq="+bvo.getBoardSeq();
	} //(게시글 수정)

	@RequestMapping(value="/board_delete", method=RequestMethod.GET)
	public String ctlBoardDelete(@ModelAttribute BoardVO bvo) {
		boardService.svcBoardDelete(bvo);
		
		return "redirect:/board/board_list?communitySeq="+bvo.getCommunitySeq();
	} //(게시글 삭제)
	
	
	@RequestMapping(value="board_recommend_insert", method=RequestMethod.POST)
	@ResponseBody
	public String ctlBoardRecommend(@RequestBody BoardVO bvo) {
		System.out.println(bvo.getBoardSeq()+bvo.getUserSeq()+"----------------------------------------------------");
		int check = boardService.svcBoardRecommendInsert(bvo);
		return Integer.toString(check);
	} //(게시글 추천)
//	ctlBoardSearch (게시글 제목 검색)
//	ctlBoardSearch (게시글 내용 검색)
//	ctlBoardSearch (게시글 제목+내용 검색)
//	ctlBoardSearch (특정 유저 게시글 검색)
}
