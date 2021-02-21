package com.jns.chabun.dao;

import com.jns.board.vo.BoardVO;
import com.jns.chef.vo.ChefVO;
import com.jns.chefboard.vo.ChefBoardVO;
import com.jns.member.vo.MemberVO;
import com.jns.recipeboard.vo.RecipeBoardVO;
import com.jns.reply.vo.ReplyVO;


public interface ChabunDAO {

	public MemberVO getMemberChabun();

	public BoardVO getNoticeChabun();

	public BoardVO getQnABoardChabun();

	public ChefBoardVO getBoardChabun();
	
	public ReplyVO getReplyChabun();

	public RecipeBoardVO getRecipeBoardChabun();
	
	public ChefVO getChefChabun();
		
}
