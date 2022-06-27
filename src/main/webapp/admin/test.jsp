<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
function registValidate(form){
 	var id_val = document.getElementById("id_validate");
 	var p_check = document.getElementById("pass_check");
 	if(form.user_id.value == "") {
		alert("아이디를 입력하세요.");
    	form.user_id.focus();
    	return false;
	} else {
		if (id_val.innerHTML != "사용가능합니다.") {
		alert("아이디를 확인하세요.");
		form.user_id.focus();
		return false;
		} 
	}
 	if(form.pass1.value == "") {
 		alert("비밀번호를 입력하세요.");
    	form.pass1.focus();
    	return false;
 	} else {
 		if(p_check.innerHTML != "사용가능합니다.") {
 			alert("비밀번호를 확인하세요.");
 			form.pass1.focus();
        	return false;
 		}
 	}
 	if(form.pass2.value == "") {
 		alert("비밀번호를 확인하세요.");
 		form.pass2.focus();
 		return false;
 	}
	// submit 후 비밀번호 확인 시 다르면 경고창 띄우기
	if(form.pass1.value != form.pass2.value) {
 		alert("비밀번호를 다시 확인하세요.");
    	form.pass2.focus();
    	return false;
 	} 
 	if(form.name.value == "") {
 		alert("이름을 입력하세요.");
    	form.name.focus();
    	return false;
 	}
 	if(form.birthday.value == "") {
 		alert("생년월일을 입력하세요.");
    	form.birthday.focus();
    	return false;
 	}   	
 	if(form.zipcode.value == "") {
 		alert("우편번호를 입력하세요.");
    	form.zipcode.focus();
    	return false;
 	}
 	if(form.address1.value == "") {
 		alert("주소를 입력하세요.");
    	form.address1.focus();
    	return false;
 	}
 	if(form.address2.value == "") {
 		alert("세부주소를 입력하세요.");
 		form.address2.focus();
 	}
 	if(form.email1.value == "" || form.email2.value == "") {
 		alert("이메일을 입력하세요.");
    	form.email1.focus();
    	return false;
 	}
 	/* 
 	if(form.email1.value == "") {
 		alert("이메일을 입력하세요.");
    	form.email1.focus();
    	return false;
 	}
 	if(form.email2.value == "") {
 		alert("이메일을 입력하세요.");
    	form.email2.focus();
    	return false;
 	} 
 	*/
 	if(form.mobile1.value == "" || form.mobile2.value == "" || form.mobile3.value == "") {
 		alert("휴대번호를 입력하세요.");
    	form.mobile1.focus();
    	return false;
 	}
	/* alert("폼값이 전송되기 전 유효성 체크를 해주세요."); */

}

</script>
</head>
<body>

</body>
</html>