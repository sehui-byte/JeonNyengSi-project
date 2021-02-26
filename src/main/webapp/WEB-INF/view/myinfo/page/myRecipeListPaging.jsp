<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collection" %>

<%
	/**********************************
	�����ؾ� �� ����
	***********************************/
	String url = null;
	String str = null;
	String ctrl = null;
	String mno = null;
	
	url = request.getParameter("url");
	System.out.println("url >>> : " + url);
	str = request.getParameter("str");
	System.out.println("str >>> : " + str);
	ctrl=request.getParameter("pageSize");
	System.out.println("ctrl >>> : " + ctrl);
	mno=request.getParameter("mno");
	System.out.println("mno >>> : " + mno);
	
	if(str != null){
		str = str + "&";
	}
%>
<%
	/**********************************
	������ �׺���̼� ���� ����
	***********************************/
	// ���������� ������ �Խù��� ��
	int pageSize = 0;

	// �׷��� ũ��
	int groupSize = 0;
	
	// ��ü �Խù��� ����
	int totalCount = 0;
	
	// ���� ������
	int curPage = 0;
	
	// ��ü �������� ����
	int pageCount = 0;
	
	if(request.getParameter("pageSize") != null){
		pageSize = Integer.parseInt(request.getParameter("pageSize"));
		System.out.println("pageSize >>> : " + pageSize);
	}
	if(request.getParameter("groupSize") != null){
		groupSize = Integer.parseInt(request.getParameter("groupSize"));
		System.out.println("groupSize >>> : " + groupSize);
	}
	if(request.getParameter("curPage") != null){
		curPage = Integer.parseInt(request.getParameter("curPage"));
		System.out.println("curPage >>> : " + curPage);
	}
	if(request.getParameter("totalCount") != null){
		totalCount = Integer.parseInt(request.getParameter("totalCount"));
		System.out.println("totalCount >>> : " + totalCount);
	}
	
	// ��ü�Խù����� ������ũ�⸦ ������ ��ü ������ ������ �����.
	// �Ҽ����� ���� ������ ������ ������ �Ѱ���.
	pageCount = (int)Math.ceil(totalCount / (pageSize+0.0));
	System.out.println("pageCount >>> : " + pageCount);
	// ����׷� ����
	int curGroup = (curPage-1) / groupSize;
	System.out.println("curGroup >>> : " + curGroup);
	int linkPage = curGroup * groupSize;	
	System.out.println("linkPage >>> : " + linkPage);
%>
<p align="right">
<%
	//ù���� �׷��� �ƴ� ���
	if(curGroup > 0){		
%>
	<a href="<%=url%>?<%=str%>curpage=1&mno=<%= mno %>">����</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?<%=str%>curpage=<%=linkPage%>&mno=<%= mno %>">��</a>&nbsp;&nbsp;&nbsp;
<%
	}else{
%>	
	����&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;
<% 
	}

	//���� ��ũ�� ���� ������Ŵ
	linkPage++;
	int loopCount = groupSize;
	// �׷���������� ������ ��ũ����.
	while((loopCount >0) && (linkPage <= pageCount)){
		if(linkPage == curPage){
%>	
			<%=linkPage%>
<% 
		}else{
%>
			[<a href="<%=url%>?curPage=<%=linkPage%>&pageCtrl=<%=ctrl%>&mno=<%= mno %>"><%=linkPage%></a>]&nbsp;
<% 
		}
		
		linkPage++;
		loopCount--;
	}
	
	// �����׷��� �ִ� ���
	if(linkPage <= pageCount)
	{
%>
	<a href="<%=url%>?curPage=<%=linkPage%>&pageCtrl=<%=ctrl%>&mno=<%= mno %>">��</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?curPage=<%=pageCount%>&pageCtrl=<%=ctrl%>&mno=<%= mno %>">����</a>&nbsp;&nbsp;&nbsp;
<%
	}
	else
	{
%>
	��&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;&nbsp;
<%
	}
%>
</p>