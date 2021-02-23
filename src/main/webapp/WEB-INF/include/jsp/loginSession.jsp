<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/jspinclude.jsp"%>

<%
Authentication auth = SecurityContextHolder.getContext().getAuthentication();
Object principal = auth.getPrincipal();
String mnick = "";
String mno = "";
String mid = "";

if (principal != null && principal instanceof MemberVO) {
	mnick = ((MemberVO) principal).getMnick();
	mno = ((MemberVO) principal).getMno();
	mid = ((MemberVO) principal).getMid();

	// 로그인시 session key값 생성
	if (session.getAttribute(mid) != null){
		String loginSession = (String) session.getAttribute("mid");
	}else{
		session.setAttribute("mid", mid);
		String loginSession = (String) session.getAttribute("mid");
	}
}
%>

	<span>main header</span>
	<div class="loginInfo" style='text-align: right;'>
		<s:authorize access="isAnonymous()">
			<a href="/kosmoJns/login.do">로그인</a>
		</s:authorize>
		<s:authorize access="isAuthenticated()">
			<%=mnick%>님 반갑습니다.<br />
			<form id="logoutForm">
				<input type="button" id="logoutbtn" name="logoutbtn" value="로그아웃하기" />
				<s:csrfInput />
			</form>
			<br>
		</s:authorize>
		<s:authorize access="hasRole('ROLE_A')">
			<a href="/kosmoJns/admin/main.do">admin 접속</a>
			<br>
		</s:authorize>
		<s:authorize access="hasRole('ROLE_U')">
			<a href="/kosmoJns/myinfo.do">일반 회원 페이지로</a>
		</s:authorize>
	</div>
