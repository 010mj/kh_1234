<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ModelAndView에서 저장한 데이터 호출 -->
<title>로그인 페이지</title>
</head>
<body>
	<form id = "loginForm" method="post" action="/member/loginProc">
		<div>
		<label for = "userID">아이디</label>
		<input type="text" id = "userID" name="userID" placeholder="아이디를 입력하세요" value="<c:out value='${userID}'/>" />
		</div>
		<div>
		<label for = "password">패스워드</label>
		<input type="text" id = "password" name="password" placeholder="패스워드를 입력하세요" value="<c:out value='${password}'/>" />
		</div>
		<button type="submit">로그인</button>
	</form>
	<a href="/member/join">회원가입</a>
	<a href="/member/findID">아이디찾기</a>
	<a href="/member/findPW">비밀번호 찾기</a>
	<script>
		//아이디 입력여부 체크
		//비번 입력여부 체크
		//1,2 항목 만족시 form submit
		document.getElementByID("loginForm").addEventListener('submit',function(e){
			e.preventDefault();
	      const userID = 
		document.querySelctor("#userID").value?.trim();
	      const password = 
		document.querySelctor("#password").value?.trim();
				if(userID.length<3){
					alert('아이디는 3자이상 입력하시오');
				}
				if(password.length<3){
					alert('비밀번호는 3자이상 입력하시오');
				}
				this.submit();
				});
		
		const id="<c:out value ='${userID}'/>";
		const password="<c:out value ='${password}'/>";
		if(id && pw) alert('계정을 확인하세요');
		</script>
		</body>
</html>