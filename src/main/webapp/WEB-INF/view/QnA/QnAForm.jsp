<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>QnA : �����Խ��� : �۾���</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$(document).on("click", "sbtn", function(){
			console.log("sbtn >>> : ");
			$("#QnAForm").attr({
				'action':'QnAInsert.do',
				'method':'POST',
				'enctype':'multipart/form-data'
			}).submit();
		});
	});
</script>
</head>
<body>
<form name="QnAForm" id="QnAForm">
<table border="1" align="center">
	<tr>
		<td colspan="2" align="center">���� �۾���</td>
	</tr>
	<tr>
		<td align="center">�۹�ȣ</td>
		<td><input type="text" name="sno" id="sno" size="20" readonly></td>
	</tr>
	<tr>
		<td align="center">������</td>
		<td><input type="text" name="stitle" id="stitle" size="53"></td>
	</tr>
	<tr>
		<td align="center">�۳���</td>
		<td>
		<textarea name="scontent" id="scontent" cols="50" rows="10">
		</textarea>
		</td>
	</tr>
	<tr>
		<td align="center">�� �ۼ���</td>
		<td><input type="text" name="swriter" id="swriter" size="20"></td>
	</tr>
	<tr>
		<td align="center">÷������</td>
		<td>
		<input type="file" name="sfile" id="sfile">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right">
		<input type="button" value="�۾���" id="sbtn">
		</td>
	</tr>
</table>
</form>
</body>
</html>