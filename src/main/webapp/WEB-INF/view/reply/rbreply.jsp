<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/jsp/header.jsp"%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">

	$(function(){
		
		/* rcontent 길이 제한 */
		$("#rcontent").keyup(function(){
			cut_200(this);
		});
		
		/* 기본 댓글 목록 불러오기 */
		listAll(rbno)
		
		/* 댓글 내용 저장 이벤트 */
		$(document).on("click", "#replyInsert", function(){
			//작성자 이름에 대한 입력여부 검사
			if(!chkSubmit($("#rwriter"),"이름을")) return;
			else if(!chkSubmit($("#rcontent"),"내용을")) return;
			else{
				var insertUrl = "/kosmoJns/reply/replyInsert.do";
				console.log("insertUrl >>> : " + insertUrl);
				var method = "POST";
				var dataParam = {
						"rbno": $("#rbno").val(),
						"rwriter": $("#rwriter").val(),
						"rcontent": $("#rcontent").val(),
						"mno": $("#mno").val()
				};
				console.log("dataParam >>> : " + dataParam);
				/* 글 저장을 위한 POST 방삭의 Ajax 연동 처리 */
				$.ajax({
					url : insertUrl,
					type : method,
					data:dataParam,
					success: whenSuccess,
					error: whenError					
				});
				
				function whenSuccess(resultData){
					if(resultData=="GOOD"){
						alert("댓글 등록이 완료되었습니다.");
						dataReset();
						listAll(rbno);
					}
				}
				function whenError(){
					alert("시스템 오류입니다. 관리자에게 문의하세요.");
				}
			}
		});
		
		/* 수정 버튼 클릭 시 수정 폼 출력 */
		$(document).on("click", ".update_form", function(){
			$(".reset_btn").click();
			var conText = $(this).parents("li").children().eq(1).html();
			console.log("conText >>> : " + conText);
			$(this).parents("li").find("input[type='button']").hide();
			$(this).parents("li").children().eq(0).html();
			var conArea = $(this).parents("li").children().eq(1);
			
			conArea.html("");
			var data="<textarea name='content' id='content'>" + conText + "</textarea>";
			data += "<input type='button' class='update_btn' value='수정완료'>";
			data += "<input type='button' class='reset_btn' value='수정취소'>";
			conArea.html(data);
		});
		
		/* 초기화 버튼 */
		$(document).on("click", ".reset_btn", function(){
			var conText = $(this).parents("li").find("textarea").html();
			$(this).parents("li").find("input[type='button']").show();
			var conArea = $(this).parents("li").children().eq(1);
			conArea.html(conText);
		});
		
		/* 글 수정을 위한 Ajax 연동 처리 */
		$(document).on("click", ".update_btn", function(){
			var rno = $(this).parents("li").attr("data-num");
			var rcontent = $("#content").val();
			if(!chkSubmit($("#content"),"댓글 내용을")) return;
			else{
				var updateUrl = "/kosmoJns/reply/replyUpdate.do";
				console.log("updateUrl >>> : " + updateUrl);
				var method = "POST";
				var dataParam = {
						"rno": rno,
						"rcontent": rcontent,						
				}
				console.log("dataParam >>> : " + dataParam);
				
				$.ajax({
					url: updateUrl,
					type: method,
					data: dataParam,
					success: whenSuccess,
					errer: whenError
				});
				
				function whenSuccess(resultData){
					if(resultData=="GOOD"){
						alert("댓글 등록이 완료되었습니다.");
						dataReset();
						listAll(rbno);
					}
				}
				function whenError(){
					alert("시스템 오류입니다. 관리자에게 문의하세요.");
				}		
			}
		});
		
		/* 글 삭제를 위한 Ajax 연동 처리 */
		$(document).on("click", ".delete_btn", function(){
			var rno = $(this).parents("li").attr("data-num");
			var target = $(this).parents(".comment_item");
			console.log("rno >>> : " + rno);
			console.log("target >>> : " + target);
			
			if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
				
				var deleteUrl = "/kosmoJns/reply/replyDelete.do";
				var method = "POST";
				var dataParam = {
						"rno": rno
				};
				
				$.ajax({
					url: deleteUrl,
					type: method,
					data: dataParam,
					success: whenSuccess,
					error: whenError
				});
				
				function whenSuccess(resData){
					console.log("resData >>> : " + resData);
					alert("댓글이 삭제되었습니다.");
					if ("GOOD" == resData){
						target.remove();
					}	
				}
				
				function whenError(e){
					alert("댓글을 삭제할 수 없습니다." + e.responseText);
				}
			}
		});
	});


	// 리스트 요청 함수
	function listAll(){
		$("#comment_list").html("");
		console.log("rbreply.jsp >> listAll()");
		var listAllURL = "/kosmoJns/reply/rblistAll.do";
		var method = "POST";
		var rbno = $("#rbno").val();
		var dataParam = {
				"rbno": rbno
		};
		console.log("dataParam >>> : " + dataParam);
		
		$.ajax({
			url: listAllURL,
			type: method,
			data: dataParam,
			success: whenSuccess,
			error: whenError
		});
		
		function whenSuccess(resData){
			console.log("whenSuccess rbreply listAll resData >>> : " + resData);
			
			if(isEmpty(resData)){
				return false;
			}
			
			let v = resData.split("&");
			for(let i = 0; i< v.length; i++){
				console.log(v[i]);
				let vv = v[i].split(",");
				let j = 0;
				for(; j < vv.length-1; j++){
					//console.log("vv[0] >>> : " + vv[0]);
					//console.log("vv[1] >>> : " + vv[1]);
					//console.log("vv[2] >>> : " + vv[2]);
					//console.log("vv[3] >>> : " + vv[3]);
					//console.log("vv[4] >>> : " + vv[4]);
				}
				addNewItem(vv[0], vv[1], vv[2], vv[3], vv[4]);
			}
			
		}
		function whenError(e){
			alert("오류 >>> : " + e.responseText);
		}
	}


	/* 새로운 글을 화면에 추가하기 위한 함수 */
	function addNewItem(rno, rwriter, rcontent, rinsertdate, rupdatedate){	
		var sessionWriter = "<%=mnick%>";
		
		//데이터 체크
		if(isEmpty(rno)) return false;
			
		// 새로운 글이 추가될 li 태그 객체
		var new_li = $("<li>");
		new_li.attr("data-num", rno);
		new_li.addClass("comment_item");
		
		// 작성자 정보가 지정될 <p> 태그
		var writer_p = $("<p>");
		writer_p.addClass("writer");
		
		// 작성자 정보와 이름
		var name_span = $("<span>");
		name_span.addClass("name");
		name_span.html(rwriter + "님");
		
		// 작성일지
		var date_span = $("<span style='font-size: 10px;'>");
		date_span.html(" 등록일:" + rinsertdate + "/ 수정일:" + rupdatedate + " ");
		
		// 수정하기 버튼
		var up_input = $("<input>");
		up_input.attr({"type" : "button", "value" : "수정하기", "v-if": "rwriter==sessionWriter"});
		up_input.addClass("update_form");
		
		// 삭제하기 버튼
		var del_input = $("<input>");
		del_input.attr({"type" : "button", "value" : "삭제하기"});
		del_input.addClass("delete_btn");
		
		// 내용
		var content_p = $("<p>");
		content_p.addClass("con");
		content_p.html(rcontent);
		
		// 조립하기 (로그인 유저의 닉네임일 경우 수정/삭제 버튼 생성)
		if(rwriter == sessionWriter){
			writer_p.append(name_span).append(date_span).append(up_input).append(del_input)
			new_li.append(writer_p).append(content_p);
			$("#comment_list").append(new_li);
		}else{
			writer_p.append(name_span).append(date_span)
			new_li.append(writer_p).append(content_p);
			$("#comment_list").append(new_li);
		}

		
	}
	
	// 초기화 함수 
	function dataReset(){
		var len = 0;
		$("#rno").val("");
		$("#rcontent").val("");
		$(".bytes").text(len);
	}
	
	// chkSubmit(유효성 검사 대상, 메시지 내용)
	function chkSubmit(v_item, v_msg){
		if(v_item.val().replace(/\s/g,"")==""){
			alert(v_msg+" 확인해 주세요.");
			v_item.val("");
			v_item.focus();
			return false;
		}else{
			return true;
		}
	}
	
	//데이터 체크
	function isEmpty(val){
		if(typeof val == "undefined" || val == null || val == ""){
			return true;
		}else{
			return false;
		}
	}
	
	//한글 포함 문자열 길이
	function getTextLength(s){
		var len = 0;
		for(var i=0; i < s.length; i++){
			if(escape(s.charAt(i)).length == 6){
				len++;
			}
			len++;
		}
		return len;
	}
	function cut_200(obj){
		var t = $(obj).val();
		var l = t.length;
		while(getTextLength(t) > 200){
			l--;
			t= t.substring(0, l);
		}
		$(obj).val(t);
		$('.bytes').text(getTextLength(t));
	}
	
</script>
<title>REPLY</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String rbno = request.getParameter("rbno");
	System.out.println("reply >> rbno >>> : " + rbno);
	
%>
<div id="replyContainer">
	<ul id="comment_list">
		<!-- 여기에 동적 생성 요소가 들어가게 됩니다. -->
	</ul>
	<div id="comment_write">
		<!-- ========== 댓글 입력 폼 ==========-->
		<form id="comment_form">
		<table>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="rwriter" id="rwriter" value="<%=mnick%>">
					<input type="hidden" name="rbno" id="rbno" value="<%=rbno%>">
					<input type="hidden" name="mno" id="mno" value="<%=mno%>">
					<input type="button" id="replyInsert" value="저장하기" onclick="sendMessage()";>
				</td>
			</tr>
			<tr>
				<td>댓글 내용</td>
				<td>
				<textarea name="rcontent" id="rcontent" rows="5" cols="50" style="resize:none"></textarea>
				<div style="font-size: 12px;"><span class="bytes">0</span>bytes</div>
				</td>
			</tr>
		</table>
		</form>
	</div>
</div>
<script>
function sendMessage() {
	//웹소켓으로 메세지 전달(프로토콜 : "댓글 작성자 id, 글작성 id, reply")
	var mid = '<%=mid%>';//댓글 작성자 아이디
	var msg = ''; 
	msg += mid;//댓글 작성자 id
	msg += ',';
	///////////test값 -> 글작성자 id로 수정해야함////////
	msg += 'user0001'; //글 작성자 id 넣어야 된다 (현재 글 작성자 없어서 test값 넣어둠)
	msg += ',';
	msg += 'reply';
	sock.send(msg);//웹소켓 서버로 프로토콜 보낸다
	
}
</script>
</body>
</html>