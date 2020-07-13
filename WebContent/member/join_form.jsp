<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC_Board</title>
<script type="text/javascript">
// 	// 4 ~ 12 자리 영문,숫자 조합의 ID 값을 전달받아 유효성 검사
// 	function checkId() {
// 		// 정규표현식을 사용하여 검사할 규칙 설정(다음 두 가지 문법 중 하나 택)
// // 		var regex = new RegExp("정규표현식문자열"); // 또는
// // 		var regex = 정규표현식문자열;

// 		// ID 에 대한 정규표현식 설정
// 		// => 첫글자 영문자, 두번째부터 영문자,숫자 조합 3 ~ 11자리(총합 12자리)
// 		var regex = /^[A-Za-z][A-Za-z0-9]{3,11}$/g;
		
// 		// 자바스크립트에서 정규표현식 판별을 위해서는 다음과 같은 문법 사용 
// 		// 정규표현식문자열.exec(검사데이터) => 판별 결과가 true 또는 false 로 리턴됨
// 		if(regex.exec(document.joinForm.id.value)) {
// 			// 유효성 검사 결과가 true 일 경우
// 			alert('사용 가능한 ID');
// 			return true;
// 		} else {
// 			alert('4~12 자리 영문,숫자 조합 필수!');
// 			return false;
// 		}
// 	}
	
// 	function checkPasswd() {
// 		var passwd = document.joinForm.passwd.value;
		
// 		// 패스워드 체크
// 		// 1. 길이 체크 : 영문, 숫자, 특수문자(!@#$%) 조합 4~12 자리
// 		// 2. 대문자 포함 체크 
// 		// 3. 소문자 포함 체크
// 		// 4. 숫자 포함 체크 
// 		// 5. 특수문자 포함 체크
// 		var lengthRegex = /[A-Za-z0-9!@#$%]{4,12}/;
// 		var upperCaseRegex = /[A-Z]/;
// 		var lowerCaseRegex = /[a-z]/;
// 		var digitRegex = /[0-9]/;
// 		var specRegex = /[!@#$%]/;
		
// 		// 1 ~ 5번까지의 모든 조건이 만족하면 통과, 아니면 실패
// 		if(lengthRegex.exec(passwd) && 
// 				upperCaseRegex.exec(passwd) && 
// 				lowerCaseRegex.exec(passwd) && 
// 				digitRegex.exec(passwd) && 
// 				specRegex.exec(passwd)) {
// 			// 유효성 검사 결과가 true 일 경우
// 			alert('사용 가능한 패스워드');
// 			return true;
// 		} else {
// 			alert('4~12 자리 영문 대문자,소문자,숫자,특수문자 조합 필수!');
// 			return false;
// 		}
		
// 	}
	
// 	// 아이디와 패스워드를 모두 체크하여 정상이면 true 리턴, 아니면 false 리턴
// 	function check() {
// 		if(checkId() && checkPasswd()) {
// 			return true;
// 		} else {
// 			return false;
// 		}
		
// 	}
	
	// ============================================================
	// submit 전 최종 상태 체크를 위한 전역변수 설정
	var checkIdResult = false, checkPasswdResult = false;
		
	// 4 ~ 12 자리 영문,숫자 조합의 ID 폼을 전달받아 입력받은 ID 유효성 검사
	function checkId(idForm) {
		var id = idForm.value; // id 가져오기
		// ID 입력 항목에 대한 해당 태그 element 가져오기(checkIdResult)
		var element = document.getElementById('checkIdResult');

		// ID 에 대한 정규표현식 설정
		// => 첫글자 영문자, 두번째부터 영문자,숫자 조합 3 ~ 11자리(총합 12자리)
		var regex = /^[A-Za-z][A-Za-z0-9]{3,11}$/g;
		
		// 자바스크립트에서 정규표현식 판별을 위해서는 다음과 같은 문법 사용 
		// 정규표현식문자열.exec(검사데이터) => 판별 결과가 true 또는 false 로 리턴됨
		if(regex.exec(id)) {
			// 유효성 검사 결과가 true 일 경우
			element.innerHTML = "사용 가능"; 
			checkIdResult = true;
		} else {
			element.innerHTML = "사용 불가";
			checkIdResult = false;
		}
	}
	
	// 4 ~ 12 자리 영문,숫자 조합의 패스워드 폼을 전달받아 입력받은 패스워드 유효성 검사
	function checkPasswd(passwdForm) {
		var passwd = passwdForm.value; // 패스워드 가져오기
		// ID 입력 항목에 대한 해당 태그 element 가져오기(checkPasswdResult)
		var element = document.getElementById('checkPasswdResult');
		
		// 패스워드 체크
		// 1. 길이 체크 : 영문, 숫자, 특수문자(!@#$%) 조합 4~12 자리
		// 2. 대문자 포함 체크 
		// 3. 소문자 포함 체크
		// 4. 숫자 포함 체크 
		// 5. 특수문자 포함 체크
		var lengthRegex = /[A-Za-z0-9!@#$%]{4,12}/;
		var upperCaseRegex = /[A-Z]/;
		var lowerCaseRegex = /[a-z]/;
		var digitRegex = /[0-9]/;
		var specRegex = /[!@#$%]/;
		
		// 1 ~ 5번까지의 모든 조건이 만족하면 통과, 아니면 실패
		if(lengthRegex.exec(passwd) && 
				upperCaseRegex.exec(passwd) && 
				lowerCaseRegex.exec(passwd) && 
				digitRegex.exec(passwd) && 
				specRegex.exec(passwd)) {
			// 유효성 검사 결과가 true 일 경우
			element.innerHTML = "사용 가능";
			checkPasswdResult = true;
		} else {
			element.innerHTML = "사용 불가";
			checkPasswdResult = false;
		}
		
	}
	
	// 아이디와 패스워드를 모두 체크하여 정상이면 true 리턴, 아니면 false 리턴
	function check() {
		if(checkIdResult && checkPasswdResult) {
			return true;
		} else {
			alert('아이디 또는 패스워드 규칙 확인 필수!');
			return false;
		}
		
	}


</script>
<style type="text/css">
	h1 {
		text-align: center;	
	}
	
	table {
		border: 1px solid black;
		width : 400px;
		margin: auto;
		text-align: left;
	}
	
</style>
</head>
<body>
	<h1>회원가입</h1>
	<form action="MemberJoinPro.me" method="post" name="joinForm" 
			onsubmit="return check()">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"  required="required" size="15"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>
					<input type="text" name="id" required="required" size="15" 
							placeholder="4-12자리 영문,숫자 조합" onkeyup="checkId(this)">
					<div id="checkIdResult"><!-- 자바스크립트에서 메세지 표시할 공간 --></div>
				</td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td>
					<input type="password" name="passwd" required="required" size="15"
							placeholder="4-12자리 영문,숫자,특수문자 조합" onkeyup="checkPasswd(this)">
					<div id="checkPasswdResult"><!-- 자바스크립트에서 메세지 표시할 공간 --></div>
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" required="required" size="15"></td>
			</tr>
			<tr>
				<td>E-Mail</td>
				<td><input type="text" name="email" required="required" size="15"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" value="남" checked="checked" size="15">남&nbsp;&nbsp;
					<input type="radio" name="gender" value="여" size="15">여
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원가입">
					<input type="button" value="돌아가기" onclick="history.back()">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>


















