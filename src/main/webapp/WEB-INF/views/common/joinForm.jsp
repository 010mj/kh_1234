<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ModelAndView에서 저장한 데이터 호출 -->
<title><c:out value="${title}"/></title>
</head>
	<body>
	<form method="post" action="/member/joinProc">
		<div>
			<label for="userID">아이디</label>
			<input type="text" id="userID" name="userID" value=""/>
			<button type="button" id="btnIdCheck">아이디 중복확인</button>
		</div>
		<div>
			<label for="userID">이메일</label>
			<input type="text" id="email" name="email" value=""/>
			<button type="button" id="btnEmailCheck">이메일 중복확인</button>
		</div>
		<div>
			<label for="username">이름<label>
			<input type="text" id="username" name="username" value=""/>
		</div>
		<div>
			<label for="password">비밀번호<label>
			<input type="password" id="password" name="password" value=""/>
		</div>
		<div>
			<label for="password2">비밀번호 확인<label>
			<input type="password" id="password2" name="password2" value=""/>
		</div>
		<button type="button" id="btnJoin">가입</button>
	</form>
		<script>
			let idCheck = false;
			let idDup = false;
			let emailCheck = false;
			let emailDup = false;
			let username = false;
			let password = false;
			let password2 = false;
			const btnIdCheck =document.querySelector('#btnIdCheck');
			const btnEmailCheck =document.querySelector('#btnEmailCheck');
			const btnJoin =document.querySelector('#btnJoin');
			//아이디 중복 체크
			btnIdCheck.addEventListener('click', function(e){
				idCheck = false;
				idDup= false;
				const userID= document.querySelector('#userID').value?.trim();
				fetch('/member/checkUserID/' + userID)	
					.then((response)=> response.json())
					.then((data)=> {
						const isExist = data.isExist;
						idCheck = true;
						idDup = isExist;
					});
			if(idCheck){
				alert('이미 존재하는 아이디 입니다.');
				document.querySelector('#userID').focus();
			}else{alert('사용가능한 아이디입니다.');}
			});	
			btnEmailCheck.addEventListener('click', function(e){
				emailCheck = false;
				emailDup= false;
				const email= document.querySelector('#email').value?.trim();
				fetch('/member/checkEmail/' + email)	
					.then((response)=> response.json())
					.then((data)=> {
						const isExist = data.isExist;
						emailCheck = true;
						emailDup = isExist;
					});		
			if(emailCheck){
				alert('이미 존재하는 이메일 입니다.');
				document.querySelector('#email').focus();
			}else{alert('사용가능한 이메일입니다.');}	
			});	
			
			btnJoin.addEventListener('click', function(e){

				const username= document.querySelector('#username').value?.trim();
				const password= document.querySelector('#password').value?.trim();
				const password2= document.querySelector('#password2').value?.trim();		
				console.log(password);
				console.log(password2);
			if(username.length<2){
				document.querySelector('#username'),focus();
				alert('이름을 2글자 이상으로 설정하세요.');
				return;
			}
			if(password.length<4){
				document.querySelector('#password').focus();
				alert('비밀번호을 4글자 이상으로 설정하세요.');
	
				return;
			}
			if(password !== password2){
				document.querySelector('#password2').focus();
				alert('비밀번호가 같지 않습니다.');
				return;
			}	
			if(password.length>=4 && password2.length >=4 && password === password2 && idCheck && !idDup && emailCheck && !emailDup){
				alert('가입처리');
				console.log('가입처리');
				//도메인/member/joinProc2
				//get : url?key=value&key=value
				//json post:
				//{
					//key:value
					//key:value
				// }
				const data = {
					method:'post',
					headers:{
						'Content-Type':'application/json'
					},
					body : JSON.stringify({
						userID:document.querySelector('#userID').value?.trim(),
						password:document.querySelector('#password').value?.trim(),
						password2:document.querySelector('#password2').value?.trim(),
						email:document.querySelector('#email').value?.trim(),
						username:document.querySelector('#username').value?.trim()
					}),
				}
				fetch('/member/joinProc2',data)
				.then((response)=> response.json())
				.then((data)=>{
					console.log(data);
					const{result,message} = data;
					aleat(message);
					if(result) window.location.href = '/member/login';
				});
			} else {
				alert('회원가입 양식을 확인하세요');
				return;
			}
			});
			
		</script>
	</body>
</html>