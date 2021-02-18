package com.jns.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jns.product.service.ProductService;
import com.jns.product.vo.ProductVO;

@Controller
public class ProductController {
	
private ProductService service;
	
	@Autowired(required=false)
	public ProductController(ProductService service) {
		this.service = service;
	}
	
	//상품 검색 페이지로 이동
	@RequestMapping("searchPage.do")
	public String search() {
		return "product/searchProduct";
	}
	
	@RequestMapping(value="search.do",method=RequestMethod.GET, produces="application/json; charset=UTF-8")
	@ResponseBody
	public String getApi(@RequestParam(defaultValue="") String keyword) {
		return service.naverSearchApi(keyword);
	}
	
	
	//관심상품 페이지로 이동
	@RequestMapping("likeProduct.do")
	public String likePage() {
		return "product/likeProduct";
	}
	
	//관심상품 정보 db저장하기
	@RequestMapping(value="likeProduct.do", method=RequestMethod.POST)
	public String likeList(@RequestBody ProductVO pvo) {
		
		System.out.println(pvo.getProductId());
		System.out.println(pvo.getTitle());
		System.out.println(pvo.getImage());
		System.out.println(pvo.getLink());
		System.out.println(pvo.getLprice());
		System.out.println(pvo.getHprice());
		return null;
	}
	
		
	
}
