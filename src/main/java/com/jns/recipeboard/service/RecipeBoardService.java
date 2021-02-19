package com.jns.recipeboard.service;

import java.util.List;

import com.jns.recipeboard.vo.RecipeBoardVO;

public interface RecipeBoardService 
{
	public List<RecipeBoardVO> recipeBoardSelectAll();
	public RecipeBoardVO recipeBoardSelect(RecipeBoardVO rbvo);
	public boolean recipeBoardInsert(RecipeBoardVO rbvo);
	public boolean recipeBoardUpdate(RecipeBoardVO rbvo);
	public boolean recipeBoardDelete(RecipeBoardVO rbvo);
}