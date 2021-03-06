<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최저가 변동 알림</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	/*google 웹폰트 */
	@import
		url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap')
		;
		/*font 적용*/
	div, h1, h2, h3, h4, h5, h6, p {
		font-family: 'Noto Serif KR', serif;
	}

	h1 {
	  margin: 7px;
	}
	
	body {
	  background-color: #F9A781;
	}
		
	.container { 
	  color: black;
	  background-color: #ffffff;
	  padding: 20px;
	  height: 290px;
	}
	
	img {
	  display: block;
	  margin: 0px auto;
	  border-radius: 20px;
	}
	
	.poptitle {
	  border: 1px solid #000000;
	}
		
	.footer {
		position: fixed;
		bottom: 7px;
		right: 12px;
		font-size: 11px;
		color: #ffffff;
		margin: 2px;
	}
	
	button {
	  border-radius: 2px;
	  border: 1px solid white;
	  background-color: #F9A781;
	  color: white;
	  padding: 1px;
	  font-size: 11px;
	}
	
</style>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		String info = request.getParameter("info");
		System.out.println("info >> " + info);
		String[] popinfo = info.split("==");
		String title = popinfo[0];
		System.out.println("title >> " + title);
		String image = popinfo[1];
		System.out.println("image >> " + image);
	%>


	<div>
		<i class="bi bi-alarm"></i>
		<h1 align="center">관심 상품 최저가 알림</h1>
	</div>
	
	<div class="container">
	  <img src="<%= image %>" width="305" height="218">
	  <p class="text-area" align="center">
	  	<span>관심 상품  </span>
	  	<span class="poptitle"><%= title %></span>
	  	<span>의 최저가를 지금 만나보세요 !</span>
	  </p>
	</div>
	
	<div class="footer">
		<span>오늘 하루 보지 않기  </span><button id="nomoretoday" onclick="onedayPopup();">X</button>
		<span>창 닫기  </span><button id="close" onclick="window.close();">X</button>
	</div>
	
	
	
	<script>
	
		// 쿠키 생성 함수
		function setCookie(name, value, expiredays) {
		    var date = new Date();
		    date.setDate(date.getDate() + expiredays);
		    document.cookie = escape(name) + "=" + escape(value) + "; path=/; expires=" + date.toUTCString();
		}
		
		// 팝업창 '오늘 하루 보지 않기' 쿠키 설정
		function onedayPopup(){
			setCookie("close", "close", 1);
			window.close();
		}
	
	
	</script>

</body>
</html>