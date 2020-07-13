<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC_Board</title>
<style type="text/css">
	h1 {
		text-align: center;	
	}
	
	table {
		border: 1px solid black;
		width : 300px;
		margin: auto;
		text-align: center;
	}
</style>
</head>
<body>
	<h1>로그인</h1>
	<form action="MemberLoginPro.me" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" required="required" size="15"></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="passwd" required="required" size="15"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="로그인">
					<input type="button" value="회원가입" onclick="location.href='MemberJoinForm.me'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>