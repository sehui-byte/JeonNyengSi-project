<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<%@ page import="com.jns.chef.vo.ChefVO" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>세프 등록(MLEVEL이 'C'인 회원만 가능)</h3>
<input type="text" id="mno" name="mno" value="<%=mno%>" placeholder="회원번호">
<input type="button" id="I" value="등록">

<br>
<hr>

<h3>세프 전체 조회</h3>

<br>
<hr>

<h3>세프 삭제</h3>

</body>
</html>