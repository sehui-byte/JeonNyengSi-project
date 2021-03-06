<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최근 본 상품</title>
<script
	src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js' />
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<style>
</style>
</head>
<body>

	<script>
	
	
		/*
			구매하기 버튼 클릭했을 때, 해당 상품의 필요한 데이터 쿠키 배열로 저장
		*/
		// 구매하기 클릭시 최근 본 상품에 추가
		/*  $("#purchaseBtn").click(function(){
			 alert("상품 구매버튼 클릭");
			clickpurchase(recentPro);
		}); */
		//var recentPro = title + '^^' + image + '^^' + link;
		function clickpurchase(recentPro){	
			// 최근 본 상품 화면에 추가
			alert("상품 구매 버튼 클릭!");
			console.log("recentPro >> " + recentPro);
			showRecent();
			
			var info = recentPro.split("^^"); // [title, image, link]
			var title = info[0];
			var productImage = info[1];
			var productLink = info[2];
			//console.log(title);
			//console.log(productImage);
			//console.log(productLink);
			
			var cookievalue = productImage+'&&'+productLink;
			console.log(cookievalue);
			
			// 1. 해당 상품에 대한 쿠키값 저장
			setRecentCookie(title, cookievalue, 1);
			//productId=productImage&&productLink
			
			// 2. 쿠키값 배열로 저장 : 최대 5개
			setCookieArray(title);
			
			// 3. 쿠키 배열로 데이터 가져오기
			getCookieArray(cookieArr);
			return true;
		}
		
		
		function showRecent(){		
			var a = document.getElementById("recent_text");
	    	a.innerHTML = '<div class="card-header"><strong>최근 본 상품</strong></div>';
		}
		
				
		// 쿠키 생성 함수
		// cookieName : "recent", cookieValue : recentPro , 유효시간 : 1시간
		function setRecentCookie(cookieName, cookieValue, days) {
		    var expire = new Date();
		    expire.setDate(days); //1일
		    //expire.setTime(date.getTime() + 1*60*60*1000); // 1hr
		    document.cookie = cookieName + '=' + cookieValue + ";";
		}
		
		// 쿠키 값 가져오기
		function getRecentCookie(cookieName) {
	     	var name = cookieName + "=";
			var decodedCookie = decodeURIComponent(document.cookie);
			var ca = decodedCookie.split(';');
			for(var i = 0; i <ca.length; i++) {
				var c = ca[i];
			    while (c.charAt(0) == ' ') {
			    	c = c.substring(1);
			    }
			    if (c.indexOf(name) == 0) {
			    	return c.substring(name.length, c.length);
			    }
			}
			return "";
		}


		
		
		// 쿠키 배열로 저장하기 : 최대 5개
		var cookieArr = [,];
		var cookieArr_name = [];
		var cookieArr_value = [];
		function setCookieArray(cookieName){ // title1
		 	var cookieValue = getRecentCookie(cookieName); // productImage1&&productLink1
		 	console.log(cookieValue);
		 	
		 	// 배열 맨 앞에 요소 추가, 배열의 크기 리턴
	        cookieArr_name.unshift(cookieName);		// [title5, title4, ..., title1]
		 	cookieArr_value.unshift(cookieValue);	// [productImage5&&productLink5, ...]
	        // 중복된 쿠키 제거 (뒷쪽에 있는 쿠키 삭제됨)
	        // 1) 쿠키명
	        var recentArr_name = cookieArr_name.filter(function(item, pos, self) {
				return self.indexOf(item) == pos;
	        });
	        // 2) 쿠키값
	        var recentArr_value = cookieArr_value.filter(function(item, pos, self) {
				return self.indexOf(item) == pos;
	        });
	        console.log("최근본상품 쿠키명 배열 : " + recentArr_name);	        
	        console.log("최근본상품 쿠키값 배열 : " + recentArr_value);
	        
	        
	         
	        // 쿠키 개수 제한 : 5개
	        // 1) 쿠키명
	        if(recentArr_name.length > 5){
	        	recentArr_name.pop(); // 배열의 마지막 요소를 제거, 제거한 요소 리턴
	        	// 배열에서 제거한 쿠키명
	        	var delCookie_name = recentArr_name.pop();
	        	console.log("개수제한으로 제거된 쿠키명 : " + delCookie_name);
	        	// 배열에서 제거된 쿠기 삭제
	        	deleteCookie(delCookie_name);
	        }
	        // 2) 쿠키값
	        if(recentArr_value.length > 5){
	        	recentArr_value.pop(); // 배열의 마지막 요소를 제거, 제거한 요소 리턴
	        	// 배열에서 제거한 쿠키값 
	        	var delCookie_value = recentArr.pop();
	        	console.log("개수제한으로 제거된 쿠키값 : " + recentArr_value);
	        }
	        
	        console.log("최근본상품 쿠키명 배열 : " + recentArr_name);	        
	        console.log("최근본상품 쿠키값 배열 : " + recentArr_value);	
	        
	        
	        cookieArr[0] = recentArr_name;
	        cookieArr[1] = recentArr_value;
 	        
	        return cookieArr;
	        // [{title5, ..., title1},{productImage5&&productLink5, ..., productImage1&&productLink1}]
		}
		
		
		// 쿠키 삭제
		function deleteCookie(delCookie_name){
			var expire = new Date();
			expire.setTime(date.getTime() - 1);
			document.cookie = cookieName + '=' + "";
		}
		
		
		/*
			쿠키 이용해서 데이터 가져오기
		*/
		
		// 쿠키에서 배열로 저장된 데이터(이미지, 링크) 가져와서 화면에 보여주기
		function getCookieArray(cookieArr){ // [{title5, ..., title1},{productImage5&&productLink5, ..., productImage1&&productLink1}]
			
			var cookieNameArr = cookieArr[0];	// [title5, ..., title1]
			var cookieValueArr = cookieArr[1];	// [productImage5&&productLink5, ..., productImage1&&productLink1]
		
			// validation
			if(cookieNameArr.length == cookieValueArr.length){
				
				var arrLength = cookieNameArr.length;
				console.log("쿠키명&쿠키값 개수 : " + arrLength);
				
				// 쿠키값에 저장된 데이터 가지고 와서 브라우저에 출력하기
				for(var i=0; i < arrLength; i++){
					
					var title = cookieNameArr[i]; // title
					title = title.replace(/<b>/gi,'');
					title = title.replace(/<\/b>/gi,'');
					//console.log(title);
					
					var product = cookieValueArr[i]; // productImage&&productLink
					var info = product.split("&&"); // [productImage, productLink]
					var image = info[0]	// productImage5
					var link = info[1]	// productLink5
					//console.log(product);
					//console.log(info);
					//console.log(image);
					//console.log(link);
					
					
					var recentProduct = '<a href="'+link+'" target="_blank"><img src="'+image+'" class="rounded_2" title="'+title+'" style="width: 150px; height: 150px;"></a>';
						        	
		        	var id = "product"+(i+1);
		            var a = document.getElementById(id);
		            if (a != null){
		            	a.innerHTML = recentProduct;
		            }
				}
			}else{
				console.log("[오류] [쿠키명, 쿠키값 개수 안 맞음]");
				console.log("[쿠키명 : "+cookieNameArr.length+"]");
				console.log("[쿠키값 : "+cookieValueArr.length+"]");
			}
			
		}
	
		
	</script>
	
	<!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>

</body>
</html>