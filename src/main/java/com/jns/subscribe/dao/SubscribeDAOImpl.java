package com.jns.subscribe.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jns.subscribe.vo.SubscribeVO;

@Repository
public class SubscribeDAOImpl implements SubscribeDAO {

	public SqlSessionTemplate sqlSession;
	
	@Override
	public List<SubscribeVO> mySubList(SubscribeVO svo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mySubList");
	}

	@Override
	public List<SubscribeVO> chefSubCount(SubscribeVO svo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chefSubCount");
	}

	@Override
	public int subInsert(SubscribeVO svo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("subInsert");
	}

	@Override
	public int subDelete(SubscribeVO svo) {
		// TODO Auto-generated method stub
		return sqlSession.update("subDelete");
	}

	@Override
	public List<SubscribeVO> subRank(SubscribeVO svo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("subRank");
	}

	@Override
	public List<SubscribeVO> subCheck(SubscribeVO svo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("subCheck");
	}

}
