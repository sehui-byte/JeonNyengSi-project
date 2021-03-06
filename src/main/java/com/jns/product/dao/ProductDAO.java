package com.jns.product.dao;

import java.util.List;

import com.jns.product.vo.ProductVO;

public interface ProductDAO {

	public List<ProductVO> LikeProductSelectAll(ProductVO pvo);
	public int likeProductInsert(ProductVO pvo);
	public int likeProductDelete(ProductVO pvo);
	public List<ProductVO> likpProductIdSelectAll(ProductVO pvo);
	public List<ProductVO> getlikeProInfoSelectAll(ProductVO pvo);
	public List<ProductVO> likeProductpaging(ProductVO pvo);
}
