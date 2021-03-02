<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jns.board.vo.BoardVO" %>
<%@ page import="java.util.List" %>
<%@page import="com.jns.common.FileLoadUtil"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NOTICE SELECT</title>
<style type="text/css">

	/* 03/01 재민: 페이지 디자인 완료 */
	.mem{
		text-align: center;
		vertical-align: middle;
	}

	.btn-orange { 
		background-color: #F9A781; 
		font-weight: bold;
	}
	
	.scrolldiv {   
        height:500px;
        overflow:scroll;
    }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
				
		// U 
		$(document).on("click", "#U", function(){
			$("#NoticeUpdateForm").attr({
				"method":"POST",
				"action":"noticeUpdateForm.do",
				"enctype": "multipart/form-data"
			}).submit();
		});
		
		// D
		$(document).on("click", "#D", function(){
			$("#NoticeUpdateForm").attr({
				"method":"POST",
				"action":"noticeDelete.do"
			}).submit();
		});
		
		// C
		$(document).on("click", "#C", function(){
			location.href="noticeSelectAllPage.do";
		});
		
	});
</script>
</head>
<body>
<div id ="wrapper">
	<div>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listS");
	List<BoardVO> list = (List)obj;
	BoardVO nvo = null;
	
	if(list.size() == 1){
		nvo = list.get(0);
	};
%>

	<form name="NoticeUpdateForm" id="NoticeUpdateForm">
	<span style="font-size: 14px">Notice</span>
	<table class="table">
		<thead>
			<tr>
				<td colspan="2"><h2><%=nvo.getBtitle()%></h2></td>
			</tr>
			<tr>
				<td colspan="2" style="vertical-align: middle;"><%=nvo.getMnick()%>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="hidden" id="mnick" name="mnick" value="<%=nvo.getMnick()%>">
				<input type="hidden" id="bno" name="bno" value="<%=nvo.getBno()%>">		
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<span style="font-size: 14px">조회: <%=nvo.getBviews() %> 추천: <%=nvo.getBhits() %></span>	
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td colspan="2">
					<div class="scrolldiv"><%= nvo.getBcontent() %></div>
				</td>
			</tr>
			<tr>
				<td class="mem" width="20%">첨부파일</td>
				<td><img src="<%=new FileLoadUtil().getFileSrc("noticeboard", nvo.getBfile()) %>" border="1" width="40" height="50" alt="image">
			</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<span style="font-size: 12px;">등록: <%=nvo.getBinsertdate()%> 수정: <%=nvo.getBupdatedate()%></span>
				</td>
			</tr>				
			<tr>
				<td colspan="7" align="right">
					<input type="button" class="btn btn-orange" value="수정하기" id="U">
					<input type="button" class="btn btn-orange" value="삭제하기" id="D">
					<input type="button" class="btn btn-orange" value="돌아가기" id="C">
				</td>
			</tr>
	</tbody>
	</table>
	</form>
	</div>
		<c:import url="/reply/reply.do">
		</c:import>
</div>
</body>
</html>