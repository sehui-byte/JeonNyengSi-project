<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List" %>
<%@ page import="com.jns.board.vo.BoardVO"%>
<%@page import="com.jns.common.FileLoadUtil"%>
<!DOCTYPE html>
<html>
<head>
<%  
      Object obj2 = request.getAttribute("p_nvo");
      BoardVO nvoP =(BoardVO) obj2; 
      
      int Size = nvoP.getPageSize();
      int pageSize = nvoP.getPageSize();
      int groupSize = nvoP.getGroupSize();
      int curPage = nvoP.getCurPage();
      int totalCount = nvoP.getTotalCount();
      
      
      if(request.getParameter("curPage") != null){
         curPage = Integer.parseInt(request.getParameter("curPage"));
      }
%>
<meta charset="EUC-KR">
<title>�������� ��� �Խ���</title>
<style type="text/css">
	.tt{
		text-align: center;
		font-weight: bole;
	}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		//�˻���ư
		$(document).on("click", "#searchBtn", function(){
			console.log("searchBtn >>> : ");
			$("#NoticeList").attr({"method":"GET"
								 ,"action":"noticeSelectAllPage.do"}).submit();
		});
		
		// �Է�
		$(document).on("click", "#I", function(){
			location.href="noticeForm.do";
		});	
		
		$(document).on("click", "#A", function(){
			location.href="noticeSelectAllPage.do";
		});
		
		$(document).on("click", "#S", function(){
			alert("S >>>");
			$("#NoticeList").attr({
				"method":"GET",
				"action":"noticeSelect.do"}).submit();	
		});
			
		$(document).on("click", "#searchBtn", function(){
			console.log("searchBtn >>> : ");
			$("#NoticeList").attr({
				"method":"GET",
				"action":"noticeSelectAllPage.do"}).submit();
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
	System.out.println("noticeSelectAllPage.jsp nCnt >>> : " + nCnt);
%>
<form name="NoticeList" id="NoticeList">
<table border="1" align="center">
	<thead>
	<tr>
		<td colspan="10" align="center"><h2>�������� ��� �Խ���</h2></td>
	</tr>
	<tr>
		<td colspan="10" align="left">
			<select id="keyfilter" name="keyfilter">
				<option value="key1">����</option>
				<option value="key2">����</option>
				<option value="key3">������+�۳���</option>
				<option value="key4">�ۼ���</option>
				<option value="key5">�۹�ȣ</option>
			</select>
			<input type="text" id="keyword" name="keyword" placeholder="�˻��� �Է�"><br>
			<input type="text" id="startdate" name="startdate" size="12" placeholder="������">
			~<input type="text" id="enddate" name="enddate" size="12" placeholder="������">
			<button type="button" id="searchBtn">�˻�</button>
		</td>
	</tr>
	<tr>
		<td class="tt"><input type="checkbox" name="chkAll" id="chkAll"></td>
		<td class="tt">�۹�ȣ</td>
		<td class="tt">������</td>
		<td class="tt">������</td>
		<td class="tt">�۳���</td>
		<td class="tt">�ۼ���</td>
		<td class="tt">����</td>
		<td class="tt">�Է³�¥</td>
		<td class="tt">��ȸ��</td>
		<td class="tt">���ƿ� ��</td>
	</tr>
	</thead>
<%
	if (nCnt > 0) {
		for(int i=0; i<nCnt; i++){
			BoardVO nvo = list.get(i);
%>
<tbody>
<tr>	
		<td>
			<input type="checkbox" name="bno" id="chkInMnum"
					value=<%= nvo.getBno() %> onclick="checkOnly(this)">
		</td>	
		<td class="tt"><%=nvo.getBno()%></td>
		<td class="tt"><%=nvo.getBtype() %></td>
		<td class="tt"><%=nvo.getBtitle() %></td>
		<td class="tt"><%=nvo.getBcontent() %></td>
		<td class="tt"><%=nvo.getMnick() %></td>
		<td class="tt"><img src="<%=new FileLoadUtil().getFileSrc("noticeboard", nvo.getBfile())%>"></td>
		<td class="tt"><%=nvo.getBinsertdate() %></td>
		<td class="tt"><%=nvo.getBviews() %></td>
		<td class="tt"><%=nvo.getBhits() %></td>
</tr>
<%
		} // end of for
	}else{
%>
	<tbody>
	<tr>
		<td colspan="10" align="center">��ϵ� �Խù��� �������� �ʽ��ϴ�.</td>
	</tr>	
<%		
		
	} // end of if
%>
	<tr>
		<td colspan="10" align="right">
			<input type="button" value="�۾���" id="I">
			<input type="button" value="�ۺ���" id="S">
			<input type="button" value="��ü���" id="A">
		</td>
	</tr>
	</tbody>
</table>
<br>
	<div class="paging" style="position: absolute; left: 700px; top: 700px;">
		<jsp:include page="paging.jsp" flush="true">
		<jsp:param name="url" value="noticeSelectAllPage.do"/>
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