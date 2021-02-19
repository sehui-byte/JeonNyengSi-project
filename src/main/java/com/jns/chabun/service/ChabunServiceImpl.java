package com.jns.chabun.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.chabun.dao.ChabunDAO;
import com.jns.chefboard.vo.ChefBoardVO;
import com.jns.member.vo.MemberVO;

import com.jns.board.vo.BoardVO;


import com.jns.notice.vo.NoticeVO;
import com.jns.qna.vo.QnAVO;

import com.jns.reply.vo.ReplyVO;


@Service
@Transactional
public class ChabunServiceImpl implements ChabunService {

	private Logger logger = Logger.getLogger(ChabunServiceImpl.class);

	private ChabunDAO chabunDAO;

	@Autowired(required = false)
	public ChabunServiceImpl(ChabunDAO chabunDAO) {
		this.chabunDAO = chabunDAO;
	}

	@Override
	public MemberVO getMemberChabun() {
		// TODO Auto-generated method stub
		logger.info("채번호출 ");
		return chabunDAO.getMemberChabun();
	}

	@Override

	public BoardVO getNoticeChabun() {
=======

	public NoticeVO getNoticeChabun() {

		// TODO Auto-generated method stub
		return chabunDAO.getNoticeChabun();
	}

	@Override
	public BoardVO getQnABoardChabun() {
		// TODO Auto-generated method stub
		return chabunDAO.getQnABoardChabun();
	}


	public ChefBoardVO getBoardChabun() {
		// TODO Auto-generated method stub
		logger.info("ChefBoard 채번호출 ");
		return chabunDAO.getBoardChabun();
	}

	@Override
	public ReplyVO getReplyChabun() {
		// TODO Auto-generated method stub
		logger.info("Reply 채번호출 ");
		return chabunDAO.getReplyChabun();
	}

	

}
