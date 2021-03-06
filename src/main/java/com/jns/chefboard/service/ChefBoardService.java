package com.jns.chefboard.service;

import java.util.List;

import com.jns.chefboard.vo.ChefBoardVO;
import com.jns.recipeboard.vo.RecipeBoardVO;

public interface ChefBoardService {

	public List<ChefBoardVO> chefBoardSelect(ChefBoardVO cbvo);
	public int boardInsert(ChefBoardVO cbvo);
	public int boardUpdate(ChefBoardVO cbvo);
	public int boardDelete(ChefBoardVO cbvo);
	
	// 조회, 추천
	public int chefBoardViewsPP(ChefBoardVO cbvo);
	public int chefBoardHitsPP(ChefBoardVO cbvo);
	
	// 페이징
	public List<ChefBoardVO> chefBoardSelectAllPage(ChefBoardVO cbvo);
}
