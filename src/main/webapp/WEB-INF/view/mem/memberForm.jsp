<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>JNS MEMBER : ������ ����� ����  ȸ�� ���� </title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--  ����̽��� ����ȭ�� ũ��� ��� -->
<meta name ="viewport" content="width=device-width, initial-scale=1.0
		maxinum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<style type="text/css">
	div{
			margin: 50px 0px 0px 100px;
	}
	.mem{text-align=center;}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- 
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script type="text/javascript" src="https://unpkg.com/vue@2.6.12/dist/vue.js"></script>
-->

<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<!-- ���� �ּҷ� -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
		
		
		//��ư Ŭ���� ȸ������ ó�� 
		$(document).on("click","#membtn",function(){
			console.log("membtn >>> : ");
			
			$('#MemberForm').attr('action','memInsert.jsw');
			$('#MemberForm').attr('method','POST');
			$('#MemberForm').attr('enctype','multipart/form-data');
			$('#MemberForm').submit();
		});
		
		
		// ���̵� üũ 
		function CheckID(){
			console.log("idCheck �Լ� ����");
			alert(" idCheck �Լ� ����");
			var idVal = document.getElementById("mid").value
	 
			window.open("/testfinal/mem/CheckID.jsp?mid="+idVal, "" 
					    ,"left=500 top=400, width=300,height=300", false);
		}
		
		/*
		// ���̵� �ߺ�üũ 
		$(document).on("click","#midbtn",function(){
			console.log("idbtn >>> : ");
			alert("idcheck >>> ");
			
			Let CheckIDURL = "CheckID.jsw";
			Let method = "POST";
			Let midVal = $('#mid').val();
			
			Let dataParam = {"mid" : midVal};
			
			$.ajax({
				url:CheckIDURL,
				type:method,
				data:dataParam,
				success:whenSuccess,
				error:whenError
			});
			
			function whenSuccess(resData){
				alert(resData);
				val sVal = resData;
				if('ID_GOOD'==sVal){
					alert("��� ������ ���̵� �Դϴ�.");
				}else{
					alert("�̹� ������� ���̵� �Դϴ�.");
					$("#mid").val('');
					$("#mid").focus();
				}
			}
			function whenError(){
				
			}
		});

		*/



	});
	

</script>
</head>
<body>
<div>
<form name="MemberForm" id="MemberForm">
	<h2><font size="4" style="color:Blue;">������ ����� ���� ȸ������ </font></h2>
	<hr>
	<table border="1">
	<tr>
		<td colspan="2" align="center">
			<font size="4" style="color:Blue;">��.��.��</font>
			<img src="/testfinal/img/ban.gif" width="25" height="25" alt="image">
		</td>
	</tr>
	<tr>
		<td class="mem">ȸ����ȣ</td>
		<td><input type="text" name="mno" id="mno" style="width:150px" readonly/></td>
	</tr>
	<tr>
		<td class="mem">���̵�</td>
		<td><input type="text" name="mid" id="mid" placeholder="���̵��ߺ�üũ"  style="width:150px"/>
			<button type="button" id="midbtn">���̵��ߺ�üũ</button>
		</td>
	</tr>
	<tr>
		<td class="mem">��й�ȣ</td>
		<td><input type="text" name="mpw" id="mpw" style="width:150px" /><br/>
	<!-- 
			<input type="text" name="mpw_r" id="mpw_r" />
			<input type="button" value="��й�ȣȮ��" onclick="mpwCheck()" /><br/>
	 --> 
		</td>
	</tr>
	<tr>
		<td class="mem">�̸�</td>
		<td><input type="text" name="mname" id="mname" style="width:150px"/></td>
	</tr>
	<tr>
		<td class="mem">�г���</td>
		<td><input type="text" name="mnick" id="mnick" style="width:150px"/></td>
	</tr>
	<tr>
		<td class="mem">��ȭ��ȣ</td>	
		<td>
			<select name="mhp" id="mhp">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="017">017</option>
			</select>
			<input type="text" name="mhp1" id="mhp1" size="2"/>
			<input type="text" name="mhp2" id="mhp2" size="2"/>	
		</td>
	</tr>
	<tr>
		<td class="mem">�̸���</td>
		<td>		
			<input type="text" name="memail" id=memail style="width:100px" />
			@ <input type="text" name="memail1" id=memail1 style="width:100px" placeholder="�����Է�" />
			<select name="memail2" id="memail2" style="width:100px;margin-right:10px">
	        	 <option value="1" selected>�����Է�</option>
	       		 <option value="naver.com">naver.com</option>	       	   
	      		 <option value="gmail.com">gmail.com</option>
	      		 <option value="daum.net">daum.net</option>	       	   
	         </select>
		</td>
	</tr>
	 <tr>
	 	<td class="mem">�ּ�</td>
	 	<td>
	 		<input type="text" name="mzipcode" id="mzipcode" placeholder="�����ȣ" style="width:50px">
	 		<input type="button" name="zipcode" id="zipcode" value="�����ȣ ã��"><br>	 	
	 		<input type="text" name="maddr" id="maddr" placeholder="���θ��ּ�" style="width:250px"><br>	 	
	 		<input type="text" name="maddrdetail" id="maddrdetail" placeholder="���θ��ּ� ���ּ�" style="width:250px"><br>	 	
	 		
	 	</td>
	 </tr>	
	<tr>
		<td class="mem">�����ʻ���</td>
		<td><input type="file" name="mphoto"  /></td>
	</tr>
	<tr> 
		<td colspan="2">
			<button type="button" id="membtn">�����ϱ�</button>
			<button type="reset">�ٽ� �Է��ϱ�</button>
	</table>
</form>
</div>
</body>
</html>