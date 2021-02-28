<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %> 
<%@ page import="com.jns.board.vo.BoardVO" %>
<%@page import="com.jns.common.FileLoadUtil"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp" %>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%
	Object obj2 = request.getAttribute("p_bvo");
	BoardVO bvoP =(BoardVO) obj2; 
	
	int Size = bvoP.getPageSize();
	int pageSize = bvoP.getPageSize();
	int groupSize = bvoP.getGroupSize();
	int curPage = bvoP.getCurPage();
	int totalCount = bvoP.getTotalCount();
	
	
	if(request.getParameter("curPage") != null){
	   curPage = Integer.parseInt(request.getParameter("curPage"));
	}
%>
<meta charset="UTF-8">
<title>QnA 게시판</title>
<style type="text/css">
	.tt{
		text-align: center;
		font-weight: bole;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		//검색버튼
		$(document).on("click", "#searchBtn", function(){
			console.log("searchBtn >>> : ");
			$("#boardList").attr({"method":"GET"
								 ,"action":"qnaSelectAllPage.do"}).submit();
		});
		
		// 입력
		$(document).on("click", "#I", function(){
			location.href="qnaForm.do";
		});	
		
		$(document).on("click", "#S", function(){
			$("#QnAList").attr({
				"method":"GET",
				"action":"qnaSelect.do"}).submit();			
		}); 
		
		$(document).on("click", "#A", function(){
			location.href="qnaSelectAllPage.do";
		});
		
		$(document).on("click", "#searchBtn", function(){
			console.log("searchBtn >>> : ");
			$("#QnAList").attr({
				"method":"GET",
				"action":"qnaSelectAllPage.do"
			}).submit();
		});
	});
</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8");%> 
<%
	Object obj = request.getAttribute("listPage");
	List<BoardVO> list = (List)obj;
	
	int nCnt = list.size();
	System.out.println("qnaSelectAllPage.jsp nCnt >>> : " + nCnt);
%>
<form name="QnAList" id="QnAList">
<table border="1" align="center">
	<thead>
	<tr>
		<td colspan="10" align="center"><h2>QnA 게시판</h2></td>
	</tr>
	<tr>
		<td colspan="10" align="left">
			<select id="keyfilter" name="keyfilter">
				<option value="key1">제목</option>
				<option value="key2">내용</option>
				<option value="key3">제목+내용</option>
				<option value="key4">작성자</option>
				<option value="key5">글번호</option>
			</select>
			<input type="text" id="keyword" name="keyword" placeholder="검색어 입력"><br>
			<input type="text" id="startdate" name="startdate" size="12" placeholder="시작일">
			~<input type="text" id="enddate" name="enddate" size="12" placeholder="종료일">
			<button type="button" id="searchBtn">검색</button>
		</td>
	</tr>
	<tr>
		<td class="tt"><input type="checkbox" name="chkAll" id="chkAll"></td>
		<td class="tt">글번호</td>
		<td class="tt">글유형</td>
		<td class="tt">글제목</td>
		<td class="tt">글내용</td>
		<td class="tt">작성자</td>
		<td class="tt">사진</td>
		<td class="tt">입력날짜</td>
		<td class="tt">조회수</td>
		<td class="tt">좋아요 수</td>
	</tr>
	</thead>
<%
	if (nCnt > 0) {
		for(int i=0; i<nCnt; i++){
			BoardVO bvo = list.get(i);
%>
<tbody>
<tr>	
	<td>
		<input type="checkbox" name="bno" id="chkInMnum"
				value=<%= bvo.getBno() %> onclick="checkOnly(this)">
	</td>	
		<td class="tt"><%=bvo.getBno()%></td>
		<td class="tt"><%=bvo.getBtype() %></td>
		<td class="tt"><%=bvo.getBtitle() %></td>
		<td class="tt"><%=bvo.getBcontent() %></td>
		<td class="tt"><%=bvo.getMnick() %></td>
		<td class="tt"><img src="<%=new FileLoadUtil().getFileSrc("qnaboard", bvo.getBfile())%>"></td>
		<td class="tt"><%=bvo.getBinsertdate() %></td>
		<td class="tt"><%=bvo.getBviews() %></td>
		<td class="tt"><%=bvo.getBhits() %></td>
</tr>
<%
		} // end of for
	}else{
%>
	<tbody>
	<tr>
		<td colspan="10" align="center">등록된 게시물이 존재하지 않습니다.</td>
	</tr>	
<%		
		
	} // end of if
%>
	<tr>
		<td colspan="10" align="right">
			<input type="button" value="글쓰기" id="I">
			<input type="button" value="글보기" id="S">
			<input type="button" value="전체목록" id="A">
		</td>
	</tr>
	</tbody>
</table>
<br>
	<div class="paging" style="position: absolute; left: 900px; top: 600px;">
		<jsp:include page="paging.jsp" flush="true">
		<jsp:param name="url" value="qnaSelectAllPage.do"/>
		<jsp:param name="str" value=""/>
		<jsp:param name="pageSize" value="<%=pageSize%>"/>
		<jsp:param name="groupSize" value="<%=groupSize%>"/>
		<jsp:param name="curPage" value="<%=curPage%>"/>
		<jsp:param name="totalCount" value="<%=totalCount%>"/>
	</jsp:include>
	</div>
</form>
</body>
</html>