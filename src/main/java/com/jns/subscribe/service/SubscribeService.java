package com.jns.subscribe.service;

import java.util.List;

import com.jns.subscribe.vo.SubscribeVO;

public interface SubscribeService {

	// 내 구독 리스트
	public List<SubscribeVO> mySubList(SubscribeVO svo);
	
	// 구독자수 확인하기
	public List<SubscribeVO> chefSubCount(SubscribeVO svo);
	
	// 구독하기
	public int subInsert(SubscribeVO svo);
	
	// 구독취소
	public int subDelete(SubscribeVO svo);
	
	// 구독자 랭킹
	public List<SubscribeVO> subRank(SubscribeVO svo);
	
	// 구독 확인
	public List<SubscribeVO> subCheck(SubscribeVO svo);	
	
}
