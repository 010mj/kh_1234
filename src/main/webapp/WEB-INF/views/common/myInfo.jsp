<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ModelAndView에서 저장한 데이터 호출 -->
<title>${title}</title>
</head>
<body>
	
	
	<form id="infoForm" method="post" action="/member/updateInfo">
			<div>
		<label for = "userID">아이디</label>
		<input type="text" id = "userID" name="userID" " value='<c:out:value:"${userInfo.getUserID()}" />' readonly/>
			</div>
			<div>
		<label for = "password">패스워드</label>
		<input type="password" id = "password" name="password"  value='' />
			</div>
			<div>
		<label for = "password2">패스워드확인</label>
		<input type="password" id = "password2" name="password2"  value='' />
			</div>
			<div>
		<label for = "username">이름</label>
		<input type="text" id = "username" name="username"  value='<c:out:value:"${userInfo.getUsername()}" />' />
			</div>
			<div>
		<label for = "email">email</label>
		<input type="text" id = "email" name="email"  value='<c:out:value:"${userInfo.getEmail()}" />' />
		<button type="button" id="btnConfirm">확인</button>
			</div>
	</form>
	<script>
		document.querySelector('#btnConfirm').addEventListener('click',function(e){
			e.preventDefault();
			const userID = document.querySelector('#userID').value?.trim();
			const email = document.querySelector('#email').value?.trim();
			const username = document.querySelector('#username').value?.trim();
			const password = document.querySelector('#password').value?.trim();
			const password2 = document.querySelector('#password2').value?.trim();
		});
		   
			const email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
			if(!email_regex.test(email)){ 
				alert('이메일 형식을 확인하세요');
				return false; 
			}else{
				return true;
			}
			if(userID===''){
				alert('아이디가 없습니다');
				window.location.href='/';
				return false;
			}
			if(username.length < 2){
				alert('이름은 2글자 이상 입력하세요');
				return false;
			}
			if(password=== '' && password2!==''){
				alert('비밀번호 변경을 원할경우 비밀번호와 비밀번호 확인을 모두 입력하세요');
				return false;
			}
			if(password!=='' && password2!== '' &password!== password2){
				alert('비밀번호와 비밀번호 확인란이 다릅니다');
				return false;
			}
			document.querySelector('#infoForm').submit();
		}
	</script>
	
	
</body>
</html>