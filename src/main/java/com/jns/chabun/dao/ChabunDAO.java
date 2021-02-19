package com.jns.chabun.dao;

import com.jns.chefboard.vo.ChefBoardVO;
import com.jns.member.vo.MemberVO;

import com.jns.notice.vo.NoticeVO;
import com.jns.qna.vo.QnAVO;

import com.jns.reply.vo.ReplyVO;


public interface ChabunDAO {

	public MemberVO getMemberChabun();


	public NoticeVO getNoticeChabun();

	public QnAVO getQnABoardChabun();

	public ChefBoardVO getBoardChabun();
	public ReplyVO getReplyChabun();

}