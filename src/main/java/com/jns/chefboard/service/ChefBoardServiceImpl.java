package com.jns.chefboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jns.chefboard.dao.ChefBoardDAO;
import com.jns.chefboard.vo.ChefBoardVO;

@Service
@Transactional
public class ChefBoardServiceImpl implements ChefBoardService {

	private ChefBoardDAO chefBoardDAO;
	
	//기본생성자 주입
	@Autowired(required=false)
	public ChefBoardServiceImpl(ChefBoardDAO chefBoardDAO) {
		this.chefBoardDAO = chefBoardDAO;
	}
	
	
	@Override
	public List<ChefBoardVO> boardList(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int boardInsert(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return chefBoardDAO.boardInsert(cbvo);
	}

	@Override
	public ChefBoardVO boardDetail(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int boardUpdate(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardDelete(ChefBoardVO cbvo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
