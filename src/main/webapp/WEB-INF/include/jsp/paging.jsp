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
	
	url = request.getParameter("url");
	System.out.println("url >>> : " + url);
	str = request.getParameter("str");
	System.out.println("str >>> : " + str);
	ctrl=request.getParameter("pageSize");
	System.out.println("ctrl >>> : " + ctrl);
	
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
<ul class="pagination justify-content-center">
<%
	//ù���� �׷��� �ƴ� ���
	if(curGroup > 0){		
%>
	<li class="page-item"><a class="page-link" href="<%=url%>?<%=str%>curpage=1">����</a></li>
	<li class="page-item"><a class="page-link" href="<%=url%>?<%=str%>curpage=<%=linkPage%>">��</a></li>
<%
	}else{
%>	
	<li class="page-item disabled">
		<a class="page-link" href="#" tabindex="-1" aria-disabled="true">����</a>
	</li>
	<li class="page-item disabled">
		<a class="page-link" href="#" tabindex="-1" aria-disabled="true">��</a>
	</li>
<% 
	}

	//���� ��ũ�� ���� ������Ŵ
	linkPage++;
	
	int loopCount = groupSize;
	// �׷���������� ������ ��ũ����.
	while((loopCount >0) && (linkPage <= pageCount)){
		if(linkPage == curPage){
%>	
			<li class="page-item active" aria-current="page">
				<a class="page-link" href="#"><%=linkPage%></a>
			</li>
<% 
		}else{
%>
			<li class="page-item"><a class="page-link" href="<%=url%>?curPage=<%=linkPage%>&pageCtrl=<%=ctrl%>"><%=linkPage%></a></li>
<% 
		}
		
		linkPage++;
		loopCount--;
	}
	
	// �����׷��� �ִ� ���
	if(linkPage <= pageCount)
	{
%>
	<li class="page-item"><a class="page-link" href="<%=url%>?curPage=<%=linkPage%>&pageCtrl=<%=ctrl%>">��</a></li>
	<li class="page-item"><a class="page-link" href="<%=url%>?curPage=<%=pageCount%>&pageCtrl=<%=ctrl%>">����</a></li>
<%
	}
	else
	{
%>
	<li class="page-item disabled">
		<a class="page-link" href="#" tabindex="-1" aria-disabled="true">��</a>
	</li>
	<li class="page-item disabled">
		<a class="page-link" href="#" tabindex="-1" aria-disabled="true">����</a>		
	</li>
<%
	}
%>
</ul>

