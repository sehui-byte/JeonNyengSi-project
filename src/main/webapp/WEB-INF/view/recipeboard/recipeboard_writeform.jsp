<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>레시피 게시판 글쓰기</title>
		<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
		<script type="text/javascript">
			$(document).ready(()=>
			{
				$("#writeBtn").click(()=>
				{
					if(validation())
					{
						$("#rbwriteForm").attr("action", "rbwrite.do");
						$("#rbwriteForm").submit();
					}
					else
					{
						console.log("else");
					}
					
				});
				
				function validation()
				{
					var mno = $("#mno").val(); //로그인한 회원번호(작성자)
					var rcp_nm = $("#rcp_nm").val(); //메뉴명
					var rcp_way2 = $("#rcp_way2").val(); //조리방법
					var rcp_pat2 = $("#rcp_pat2").val(); //요리종류
					var hash_tag = $("#hash_tag").val(); //해쉬태그
					var main_img = $("#main_img").val(); //레시피 메인 이미지
					var rcp_parts_dtls = $("#rcp_parts_dtls").val(); //재료정보
					
					console.log("mno >>> : " + mno);
					console.log("rcp_nm >>> : " + rcp_nm);
					console.log("rcp_way2 >>> : " + rcp_way2);
					console.log("rcp_pat2 >>> : " + rcp_pat2);
					console.log("hash_tag >>> : " + hash_tag);
					console.log("main_img >>> : " + main_img);
					console.log("rcp_parts_dtls >>> : " + rcp_parts_dtls);
					
					if(!mno) //"", null, undefined, 0, NaN 값일 경우
					{
						alert("회원번호가 유효하지 않습니다.");
						console.log("mno >>> : " + mno);
					}
					else if(!rcp_nm)
					{
						alert("메뉴명이 유효하지 않습니다.");
						console.log("rcp_nm >>> : " + rcp_nm);
					}
					else if(!rcp_way2)
					{
						alert("조리방법이 유효하지 않습니다.");
						console.log("rcp_way2 >>> : " + rcp_way2);
					}
					else if(!rcp_pat2)
					{
						alert("요리종류가 유효하지 않습니다.");
						console.log("rcp_pat2 >>> : " + rcp_pat2);
					}
					else if(!hash_tag)
					{
						alert("해쉬태그가 유효하지 않습니다.");
						console.log("hash_tag >>> : " + hash_tag);
					}
					else if(!main_img)
					{
						alert("레시피 메인 이미지가 유효하지 않습니다.");
						console.log("main_img >>> : " + main_img);
					}
					else if(!rcp_parts_dtls)
					{
						alert("재료정보가 유효하지 않습니다.");
						console.log("rcp_parts_dtls >>> : " + rcp_parts_dtls);
					}
					else
					{
						return true;
					}
					
					return false;
				};	
				
			});
		</script>
	</head>
	
	<body>
		<form id="rbwriteForm" name="rbwriteForm" enctype="multipart/form-data" method="POST">
			<input type="button" id="writeBtn" value="작성">
			<input type="hidden" name="mno" value="<%=mno%>">
			<table border="1" style="margin: auto;">
				<tr>
					<td colspan="2"><p style="text-align: center;">글쓰기</p></td>
				</tr>
				<tr>
					<td>메뉴명</td>
					<td><input id="rcp_nm" name="rcp_nm" type="text" placeholder="메뉴명"></td>
				</tr>
				<tr>
					<td>조리방법</td>
					<td><input id="rcp_way2" name="rcp_way2" type="text" placeholder="조리방법"></td>
				</tr>
				<tr>
					<td>요리종류</td>
					<td><input id="rcp_pat2" name="rcp_pat2" type="text" placeholder="조리방법"></td>
				</tr>
				<tr>
					<td>해쉬태그</td>
					<td>#<input id="hash_tag" name="hash_tag" type="text" placeholder="해쉬태그"></td>
				</tr>
				<tr>
					<td>레시피 메인 이미지</td>
					<td><input id="main_img" name="file00" type="file"></td>
				</tr>
				<tr>
					<td>재료정보</td>
					<td><input id="rcp_parts_dtls" name="rcp_parts_dtls" type="text" placeholder=",로 구분 예)양파 1/6개, 달걀 1개, 소금  1작은술"></td>
				</tr>
				<tr>
					<td>만드는법 01</td>
					<td><input id="manual01" name="manual01" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_01</td>
					<td><input id="manual_img01" name="file01" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 02</td>
					<td><input id="manual02" name="manual02" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_02</td>
					<td><input id="manual_img02" name="file02" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 03</td>
					<td><input id="manual03" name="manual03" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_03</td>
					<td><input id="manual_img03" name="file03" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 04</td>
					<td><input id="manual04" name="manual04" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_04</td>
					<td><input id="manual_img04" name="file04" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 05</td>
					<td><input id="manual05" name="manual05" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_05</td>
					<td><input id="manual_img05" name="file05" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 06</td>
					<td><input id="manual06" name="manual06" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_06</td>
					<td><input id="manual_img06" name="file06" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 07</td>
					<td><input id="manual07" name="manual07" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_07</td>
					<td><input id="manual_img07" name="file07" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 08</td>
					<td><input id="manual08" name="manual08" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_08</td>
					<td><input id="manual_img08" name="file08" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 09</td>
					<td><input id="manual09" name="manual09" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_09</td>
					<td><input id="manual_img09" name="file09" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 10</td>
					<td><input id="manual10" name="manual10" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_10</td>
					<td><input id="manual_img10" name="file10" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 11</td>
					<td><input id="manual11" name="manual11" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_11</td>
					<td><input id="manual_img11" name="file11" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 12</td>
					<td><input id="manual12" name="manual12" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_12</td>
					<td><input id="manual_img12" name="file12" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 13</td>
					<td><input id="manual13" name="manual13" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_13</td>
					<td><input id="manual_img13" name="file13" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 14</td>
					<td><input id="manual14" name="manual14" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_14</td>
					<td><input id="manual_img14" name="file14" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 15</td>
					<td><input id="manual15" name="manual15" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_15</td>
					<td><input id="manual_img15" name="file15" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 16</td>
					<td><input id="manual16" name="manual16" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_16</td>
					<td><input id="manual_img16" name="file16" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 17</td>
					<td><input id="manual17" name="manual17" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_17</td>
					<td><input id="manual_img17" name="file17" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 18</td>
					<td><input id="manual18" name="manual18" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_18</td>
					<td><input id="manual_img18" name="file18" type="file"></td>
				</tr>
				<tr>
					<td>만드는법 19</td>
					<td><input id="manual19" name="manual19" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_19</td>
					<td><input id="manual_img19" name="file19" type="file"></td>
				</tr>
				<tr>
					<td>만드는법20</td>
					<td><input id="manual20" name="manual20" type="text"></td>
				</tr>
				<tr>
					<td>만드는법 참고 이미지_20</td>
					<td><input id="manual_img20" name="file20" type="file"></td>
				</tr>
			</table>
		</form>
	</body>
</html>





















