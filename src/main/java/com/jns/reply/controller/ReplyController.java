package com.jns.reply.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jns.chabun.service.ChabunService;
import com.jns.common.ChabunUtil;
import com.jns.common.Paging;
import com.jns.reply.service.ReplyService;
import com.jns.reply.vo.ReplyVO;

@Controller
public class ReplyController {
	Logger logger = Logger.getLogger(ReplyController.class);
	
	private ReplyService replyService;
	private ChabunService chabunService;
	
	
	// 기본 생성자 주입
	@Autowired(required=false)
	public ReplyController(ReplyService replyService, ChabunService chabunService) {
		this.replyService = replyService;
		this.chabunService = chabunService;
	}
	
	/********************************************************************************************
	* 공지, Q&A 댓글 호출 
	********************************************************************************************/
	@RequestMapping(value="reply/reply")
	public String replyReady() {
		logger.info("ReplyC >> replyReady 호출 성공 ");
		
		return "reply/reply";
	}
	
	/********************************************************************************************
	* 일반, 세프 댓글 호출
	********************************************************************************************/
	@RequestMapping(value="reply/rbreply")
	public String rbreplyReady() {
		logger.info("ReplyC >> rbreplyReady 호출 성공 ");
		
		return "reply/rbreply";
	}
	
	/********************************************************************************************
	* 공지, Q&A 댓글 목록 
	********************************************************************************************/
	@ResponseBody
	@RequestMapping(value="/reply/blistAll", method=RequestMethod.POST)
	public String breplylist(ReplyVO rvo){
		logger.info("ReplyC >> breplylist 호출 성공");
		logger.info("bno >>> : " + rvo.getBno());
		
		rvo.setBno(rvo.getBno());
		
		List<ReplyVO> breplyList = replyService.breplyList(rvo);
		System.out.println("ReplyC >> list >> breplyList.size() >>> : " + breplyList.size());
		
		String ss = "";
		String listStr = "";
		for(int i=0; i < breplyList.size(); i++) {
			ReplyVO _rvo = breplyList.get(i);
			String s0 = _rvo.getRno();
			String s1 = _rvo.getRwriter();
			String s2 = _rvo.getRcontent();
			String s3 = _rvo.getRinsertdate();
			String s4 = _rvo.getRupdatedate();
			ss = s0 + "," + s1 + "," + s2 + "," + s3 + "," + s4;
			listStr += ss + "&";
		}
		//System.out.println("ReplyC >> listStr >>> : " + listStr);
		return listStr;
	}
	
	/********************************************************************************************
	* 일반, 세프 게시판 댓글 목록 
	********************************************************************************************/
	@ResponseBody
	@RequestMapping(value="/reply/rblistAll")
	public String rbreplylist(ReplyVO rvo){
		logger.info("ReplyC >> rbreplylist 호출 성공");
		logger.info("bno >>> : " + rvo.getRbno());
		
		rvo.setRbno(rvo.getRbno());
		
		List<ReplyVO> rbreplyList = replyService.rbreplyList(rvo);
		System.out.println("ReplyC >> list >> rbreplyList.size() >>> : " + rbreplyList.size());		
		
		String ss = "";
		String listStr = "";
		for(int i=0; i < rbreplyList.size(); i++) {
			ReplyVO _rvo = rbreplyList.get(i);
			String s0 = _rvo.getRno();
			String s1 = _rvo.getRwriter();
			String s2 = _rvo.getRcontent();
			String s3 = _rvo.getRinsertdate();
			String s4 = _rvo.getRupdatedate();
			ss = s0 + "," + s1 + "," + s2 + "," + s3 + "," + s4;
			listStr += ss + "&";
		}
		//System.out.println("ReplyC >> listStr >>> : " + listStr);
		return listStr;

	}
	
	/********************************************************************************************
	* 댓글 글쓰기
	********************************************************************************************/
	@ResponseBody
	@RequestMapping(value="reply/replyInsert", method=RequestMethod.POST)
	public String replyInsert(ReplyVO rvo){
		logger.info("ReplyC >> replyInsert 호출 성공");
		logger.info("ReplyC >> replyInsert >> bno >>> : " + rvo.getBno());
		logger.info("ReplyC >> replyInsert >> rbno >>> : " + rvo.getRbno());
		logger.info("ReplyC >> replyInsert >> rwriter >>> : " + rvo.getRwriter());		
		
		// 채번 setting
		String rno = ChabunUtil.getReplyChabun("D", chabunService.getReplyChabun().getRno());
		logger.info("ReplyC >> replyInsert >> rno >>> : " + rno);
		rvo.setRno(rno);
		
		int result = replyService.replyInsert(rvo);
		logger.info("ReplyC >> replyInsert >> result >>> : " + result);
		
		if (1 == result) { return "GOOD"; }
		else{ return "BAD"; }
	}
	
	
	/********************************************************************************************
	* 댓글 수정
	********************************************************************************************/
	@ResponseBody
	@RequestMapping(value="reply/replyUpdate", method=RequestMethod.POST)
	public String replyUpdate(ReplyVO rvo) {
		logger.info("ReplyC >> replyUpdate 호출 성공");
		logger.info("ReplyC >> replyUpdate rcontent >>> : " + rvo.getRcontent());
		logger.info("ReplyC >> replyUpdate rno >>> : " + rvo.getRno());
		
		rvo.setRno(rvo.getRno());
		rvo.setRcontent(rvo.getRcontent());
		
		int result = replyService.replyUpdate(rvo);
		logger.info("ReplyC >> replyUpdate >> result >>> : " + result);
		
		if (1 == result) { return "GOOD"; }
		else{ return "BAD"; }
	}

	/********************************************************************************************
	* 댓글 삭제 
	********************************************************************************************/
	@ResponseBody
	@RequestMapping(value="/reply/replyDelete", method=RequestMethod.POST)
	public String rboardDelete(ReplyVO rvo) {
		logger.info("ReplyC >> replyDelete 호출 성공");
		logger.info("ReplyC >> replyDelete result >>> : " + rvo.getRno());
		
		int result = replyService.replyDelete(rvo);
		logger.info("ReplyC >> replyDelete >> result >>> : " + result);
		
		if (1 == result) { return "GOOD"; }
		else{ return "BAD"; }
	}
	
	
	/********************************************************************************************
	* 댓글 전체조회
	********************************************************************************************/
	@RequestMapping(value="/reply/replyListAll", method=RequestMethod.GET)
	public String replyListAll(ReplyVO rvo, Model model, HttpServletRequest request) {
		logger.info("ReplyC >> replyListAll 호출 성공");
		
		
		// 페이징		
		int totalCnt = 0;
		String cPage = request.getParameter("curPage");
		String pageCtrl = request.getParameter("pageCtrl");
		
		Paging.setPage(rvo, cPage, pageCtrl); //페이징할 정보를 Paging클래스에 보내줍니다
		
		List<ReplyVO> listR = replyService.replyListAll(rvo);
		
		if( listR.size() != 0) {
			totalCnt = listR.get(0).getTotalCount(); // 쿼리 조회한 리스트의 인덱스에 담긴 totalCount값
			rvo.setTotalCount(totalCnt);			 // vo에 담기
		}	
		
		model.addAttribute("listR", listR);
		model.addAttribute("p_rvo", rvo);
		
		return "reply/replyListAll";
	}
	
}
