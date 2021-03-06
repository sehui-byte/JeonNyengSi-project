<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>
<%@ page import="com.jns.chefboard.vo.ChefBoardVO" %> 
<%@ page import="java.util.List" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세프레시피 상세보기</title>
<style type="text/css">
	/*google 웹폰트 */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap');
	
	div, h1, h2, h3, h4, h5, h6, p {
	   font-family: 'Noto Serif KR', serif;
	}
	
	/*콘텐츠 가운데 정렬*/
	#wrapper {
	max-width: 1020px;
	margin: 0 auto;
	margin-top: 50px;
	}

	.tt{
		text-align: center;
		vertical-align: middle;
	}
	
	.tb{
		vertical-align: bottom;
	}
	
	.btn-orange { 
		background-color: #F9A781; 
		font-weight: bold;
	}
</style>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Object obj = request.getAttribute("listS");
	List<ChefBoardVO> list = (List)obj;
	ChefBoardVO cbvo = null;
	if(list.size() == 1){
		cbvo = list.get(0);
	};
%>
<script type="text/javascript">

	$(document).ready(function(){
		
		var sessionMno = "<%=mno%>";
		var sessionWriter = "<%=mnick%>";
		var boardMno = $("#mno").val();
		
		var vm = new Vue({
			el: "#selectForm",
			data: {  
				hitsPoint:"<%=cbvo.getHits()%>",
				plus:"1"
			},
			methods: {
				hitPlus:function(){
						var favStatus = $("#favRecipeUser").val();
						if (favStatus == '추천하기'){
							if (sessionMno != null && sessionMno.length != 0){
								this.hitsPoint = parseInt(this.hitsPoint) + parseInt(this.plus);
							}
						}else{
							this.hitsPoint = parseInt(this.hitsPoint) - parseInt(this.plus);
						}

					}

				}
		});
		
	
		// 로그인 유저와 작성자가 일치할 경우 수정/삭제 버튼 생성
		if ( sessionMno == boardMno){
			$('#U').attr('disabled', false);
			$('#D').attr('disabled', false);
		}
		
		// 조회수 증가
		var viewsUrl = "/kosmoJns/chefboard/chefBoardViewsPP.do";
		var viewsType = "GET";
		var viewsData = {"rbno": $("#rbno").val()};
		$.ajax({
			url: viewsUrl,
			type: viewsType,
			data: viewsData,
			success: viewsSuccess,
			error: viewsError
		});

		function viewsSuccess(resultData){
			if(resultData=="GOOD"){
				console.log("조회 수 +1 증가 완료");
			}
		}
		function viewsError(){
			alert("시스템 오류입니다. 관리자에게 문의하세요.");
		}
		
		// 구독 여부 체크
		checkSubscribe();		
		
		
		// 추천 ====== 즐겨찾기랑 통합 >> 삭제 예정, 일단은 버튼만 삭제
	/*
		$(document).on("click", "#hits", function(){
			var hitsUrl = "/kosmoJns/chefboard/chefBoardHitsPP.do";
			var hitsType = "GET";
			var hitsData = {"rbno": $("#rbno").val()};
			$.ajax({
				url: hitsUrl,
				type: hitsType,
				data: hitsData,
				success: hitsSuccess,
				error: hitsError
			});

			function hitsSuccess(resultData){
				if(resultData=="GOOD"){
					console.log("추천 수 +1 증가 완료");
				}
			}
			function hitsError(){
				alert("시스템 오류입니다. 관리자에게 문의하세요.");
			}
		});
	*/
		// 수정
		$(document).on("click", "#U", function(){
			$("#b_data").attr({"method":"POST"
									   ,"action":"/kosmoJns/chefboard/updateform.do"}).submit();
		});
		
		
		// 삭제
		$(document).on("click", "#D", function(){
			$("#b_data").attr({"method":"POST"
									   ,"action":"/kosmoJns/chefboard/boarddelete.do"}).submit();
		});
		
		
		// 취소
		$(document).on("click", "#C", function(){
			location.href="/kosmoJns/chefboard/boardselectallpage.do";
		});
		
		// 구독
		$(document).on("click", "#Subs", function(){
			
			// 로그인 확인
			if(sessionMno == ""){
				alert("로그인 후 구독할 수 있습니다.");
				return false;
			}
			
			var insertUrl = "/kosmoJns/subscribe/subinsert.do";
			console.log("insertUrl >>> : " + insertUrl);
			var method = "POST";
			var dataParam = {
					"mno": sessionMno,
					"ino": $("#ino").val()
			};
			console.log("dataParam >>> : " + dataParam);
			/* Ajax 연동 처리 */
			$.ajax({
				url : insertUrl,
				type : method,
				data:dataParam,
				success: whenSuccess,
				error: whenError					
			});
			
			function whenSuccess(resultData){
				if(resultData=="GOOD"){
					alert("구독 완료!");
					checkSubscribe();
				}
			}
			function whenError(){
				alert("시스템 오류입니다. 관리자에게 문의하세요.");
			}
		});
		
		//========================즐겨찾기&추천 노출은 추천으로===============================
		
					var mno = "<%= mno %>";
					var rbno = $("#rbno").val();
					var recipeType = "user";
					var url = "/kosmoJns/favorites/favRecipeCheck.do";
					var data = {
							"mno" : mno,
							"rbno" : rbno,
							"recipeType" : recipeType};
					$.ajax({
						url : url,
						method : "GET",
						data : data,
						success : whenSuccess,
						error : whenError
					});
					
					function whenSuccess(data){
						if (data == "CHECK"){
							$("#favRecipeUser").val("추천 취소하기");
						}else{
							$("#favRecipeUser").val("추천하기");
						}
					}

					function whenError(data){
						alert("실패");
					}
				
				$("#favRecipeUser").on("click", function(){
					var mno = "<%= mno %>";
					if (mno == null || mno.length == 0){
						alert("비회원을 추천을 할 수 없습니다. 회원 가입 후에 이용해주시기 바랍니다.");
						return;
					}
					var rbno = $("#rbno").val();
					var recipeType = "user";
					var data = {
							"mno" : mno,
							"rbno" : rbno,
							"recipeType" : recipeType};

					var url = "/kosmoJns/favorites/favRecipe.do";

					$.ajax({
						url : url,
						method : "GET",
						data : data,
						success : whenSuccess,
						error : whenError
					});
					
					function whenSuccess(data){
						if (data == "OK"){
							$("#favRecipeUser").val("추천 취소하기");
							sendMessage("recommend");
							alert("해당 레시피를 추천했습니다. 추천 레시피는 나의 추천 레시피에서 확인하실 수 있습니다");
							
						}else if(data == "DeleteOK"){
							sendMessage("norecommend");
							$("#favRecipeUser").val("추천하기");
							alert("해당 레시피  추천을 취소하였습니다.");
						}else{
							alert("서버에 문제가 발생하였습니다. 잠시 후에 다시 시도해주십시오.");
						}
						
					}

					function whenError(data){
						alert("서비스에 문제가 발생하였습니다. 담당자에게 문의하시기 바랍니다.");
					}
				})
				
		function checkSubscribe(){
			var subCheckUrl = "/kosmoJns/subscribe/subCheck.do";
			var subCheckType = "GET";
			var subCheckData = {
					"rbno": "<%=request.getParameter("rbno")%>",
					"mno": sessionMno
			};
			$.ajax({
				url: subCheckUrl,
				type: subCheckType,
				data: subCheckData,
				success: subCheckSuccess,
				error: subCheckError
			});

			function subCheckSuccess(resultData){
				if(resultData=="ALREADY"){
					console.log("이미 구독중");
					$('#Subs').attr('style', 'background-color:#F9A781;');
					$('#Subs').attr('value', '구독중');
					$('#Subs').attr('disabled', true);
					
				}else{
					console.log("아직 구독하지 않음");
				}
			}
			function subCheckError(){
				alert("[구독] 시스템 오류입니다. 관리자에게 문의하세요.");
			}
		}
	});
	
</script>
</head>
<body>
<div id ="wrapper">
	<div id="selectForm">
	<form name="b_data" id="b_data">
		<span style="font-size: 14px">Chef Board</span>
		<table class="table">
			<thead>
				<tr>
					<td colspan="2"><h2><%=cbvo.getRcp_nm()%></h2></td>
				</tr>
				<tr>
					<td colspan="2" style="vertical-align: middle;"><%=cbvo.getMnick()%>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="hidden" id="mnick" name="mnick" value="<%=cbvo.getMnick()%>">
					<input type="hidden" id="ino" name="ino" value="<%=cbvo.getIno()%>">
					<input type="hidden" id="rbno" name="rbno" value="<%=cbvo.getRbno()%>">
					<input type="hidden" id="mno" name="mno" value="<%=cbvo.getMno()%>">
					<input type="button" class="btn btn-warning btn-sm" id="Subs" value="구독하기">				
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<span style="font-size: 14px">조회: <%=cbvo.getViews() + 1 %> 추천: {{hitsPoint}}</span>
				</tr>
			</thead>
			<tbody>
			<tr>
				<td class="tt"><span style="font-size: 14px">조리방법</span></td>
				<td><span style="font-size: 14px"><%=cbvo.getRcp_way2()%></span></td>
			</tr>
			<tr>
				<td class="tt"><span style="font-size: 14px">요리종류</span></td>
				<td><span style="font-size: 14px"><%=cbvo.getRcp_pat2()%></span></td>
			</tr>
			<tr>
				<td class="tt" width="20%"><span style="font-size: 14px">해시태그</span></td>
				<td><span style="font-size: 14px"><%=cbvo.getHash_tag() == null ? "--" : "#" + cbvo.getHash_tag()%></span></td>
			</tr>
			<tr>
				<td class="tt">메인 이미지</td>
				<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getMain_img())%>"></td>
			</tr>
			<tr>
				<td class="tt">재료정보</td>
				<td><%=cbvo.getRcp_parts_dtls()%></td>
			</tr>
			
			<%
				if(cbvo.getManual01() != null && cbvo.getManual01().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 1</td>
						<td><%=cbvo.getManual01()%></td>
					</tr>
			<%
					if(cbvo.getManual_img01() != null && cbvo.getManual_img01().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법1_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img01())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual02() != null && cbvo.getManual02().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 2</td>
						<td><%=cbvo.getManual02()%></td>
					</tr>
			<%
					if(cbvo.getManual_img02() != null && cbvo.getManual_img02().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법2_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img02())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual03() != null && cbvo.getManual03().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 3</td>
						<td><%=cbvo.getManual03()%></td>
					</tr>
			<%
					if(cbvo.getManual_img03() != null && cbvo.getManual_img03().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법3_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img03())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual04() != null && cbvo.getManual04().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 4</td>
						<td><%=cbvo.getManual04()%></td>
					</tr>
			<%
					if(cbvo.getManual_img04() != null && cbvo.getManual_img04().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법4_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img04())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual05() != null && cbvo.getManual05().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 5</td>
						<td><%=cbvo.getManual05()%></td>
					</tr>
			<%
					if(cbvo.getManual_img05() != null && cbvo.getManual_img05().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법5_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img05())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual06() != null && cbvo.getManual06().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 6</td>
						<td><%=cbvo.getManual06()%></td>
					</tr>
			<%
					if(cbvo.getManual_img06() != null && cbvo.getManual_img06().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법6_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img06())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual07() != null && cbvo.getManual07().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 7</td>
						<td><%=cbvo.getManual07()%></td>
					</tr>
			<%
					if(cbvo.getManual_img07() != null && cbvo.getManual_img07().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법7_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img07())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual08() != null && cbvo.getManual08().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 8</td>
						<td><%=cbvo.getManual08()%></td>
					</tr>
			<%
					if(cbvo.getManual_img08() != null && cbvo.getManual_img08().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법8_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img08())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual09() != null && cbvo.getManual09().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 9</td>
						<td><%=cbvo.getManual09()%></td>
					</tr>
			<%
					if(cbvo.getManual_img09() != null && cbvo.getManual_img09().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법9_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img09())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual10() != null && cbvo.getManual10().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 10</td>
						<td><%=cbvo.getManual10()%></td>
					</tr>
			<%
					if(cbvo.getManual_img10() != null && cbvo.getManual_img10().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법10_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img10())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual11() != null && cbvo.getManual11().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 11</td>
						<td><%=cbvo.getManual11()%></td>
					</tr>
			<%
					if(cbvo.getManual_img11() != null && cbvo.getManual_img11().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법11_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img11())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual12() != null && cbvo.getManual12().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 12</td>
						<td><%=cbvo.getManual12()%></td>
					</tr>
			<%
					if(cbvo.getManual_img12() != null && cbvo.getManual_img12().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법12_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img12())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual13() != null && cbvo.getManual13().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 13</td>
						<td><%=cbvo.getManual13()%></td>
					</tr>
			<%
					if(cbvo.getManual_img13() != null && cbvo.getManual_img13().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법13_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img13())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual14() != null && cbvo.getManual14().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 14</td>
						<td><%=cbvo.getManual14()%></td>
					</tr>
			<%
					if(cbvo.getManual_img14() != null && cbvo.getManual_img14().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법14_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img14())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual15() != null && cbvo.getManual15().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법15</td>
						<td><%=cbvo.getManual15()%></td>
					</tr>
			<%
					if(cbvo.getManual_img15() != null && cbvo.getManual_img15().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법15_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img15())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual16() != null && cbvo.getManual16().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 16</td>
						<td><%=cbvo.getManual16()%></td>
					</tr>
			<%
					if(cbvo.getManual_img16() != null && cbvo.getManual_img16().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법16_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img16())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual17() != null && cbvo.getManual17().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 17</td>
						<td><%=cbvo.getManual17()%></td>
					</tr>
			<%
					if(cbvo.getManual_img17() != null && cbvo.getManual_img17().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법17_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img17())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual18() != null && cbvo.getManual18().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 18</td>
						<td><%=cbvo.getManual18()%></td>
					</tr>
			<%
					if(cbvo.getManual_img18() != null && cbvo.getManual_img18().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법18_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img18())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual19() != null && cbvo.getManual19().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법19</td>
						<td><%=cbvo.getManual19()%></td>
					</tr>
			<%
					if(cbvo.getManual_img19() != null && cbvo.getManual_img19().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법19_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img19())%>"></td>
						</tr>
			<%		}
				}
			%>
			
			<%
				if(cbvo.getManual20() != null && cbvo.getManual20().length() > 0)
				{
			%>
					<tr>
						<td class="tt">만드는법 20</td>
						<td><%=cbvo.getManual20()%></td>
					</tr>
			<%
					if(cbvo.getManual_img20() != null && cbvo.getManual_img20().length() > 0)
					{
			%>
						<tr>
							<td class="tt">만드는법20_이미지</td>
							<td><img src="../<%=new FileLoadUtil().getFileSrc("chefboard", cbvo.getManual_img20())%>"></td>
						</tr>
			<%		}
				}
			%>		
			<tr>
				<td colspan="2" align="right">
					<span style="font-size: 12px;">등록: <%=cbvo.getRb_insertdate()%> 수정: <%=cbvo.getRb_updatedate()%></span>
				</td>
			</tr>			
			<tr>
				<td colspan="2" align="right">
					<input type="button" class="btn btn-orange" id="U" disabled="disabled" value="수정">
					<input type="button" class="btn btn-orange" id="D" disabled="disabled" value="삭제">
					<input type="button" class="btn btn-orange" name="favRecipeUser" id="favRecipeUser" v-on:click="hitPlus()" value="추천하기">
					<input type="button" class="btn btn-orange" id="C" value="목록">
				</td>
			</tr>
			</tbody>
		</table>
	</form>
	</div>
		<c:import url="/reply/rbreply.do">
			<c:param name="BoardWriterMno" value="<%=cbvo.getMno()%>"></c:param>
		</c:import>

</div>
<%@ include file="/WEB-INF/include/jsp/footer.jsp"%>
</body>
</html>