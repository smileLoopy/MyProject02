<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Register - SB Admin</title>
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<script>
	// JS 유효성 검사 1.
	
	/*       function registValidate(form){
	 //firstname 검증
	 if(!form.inputFirstName.value){
	 alert("Enter your firstname");
	 form.inputFirstName.focus();
	 return false;
	 }
	 //lastname 검증
	 if(!form.inputLastName.value){
	 alert("Enter your lastname");
	 form.inputLastName.focus();
	 return false;
	 }
	 //id 검증
	 if(!form.inputId.value){
	 alert("Enter your ID");
	 form.inputId.focus();
	 return false;
	 }
	 //pass 검증
	 if(!form.inputPassword.value){
	 alert("Enter your Password");
	 return false;
	 }
	 if(form.inputPassword.value != form.inputPasswordConfirm.value){
	 alert("Passwords must match");
	 return false;
	
	 /*  from.inputPassword.focus();
	 form.inputPassword.value="";
	 form.inputPasswordConfirm.value=""; */

	/* 	    }
	
	 }    */

	// JS 유효성 검사2
	//정규표현식 선언 (아이디, 비밀번호 체크)
	//아이디: 4~12자의 영문 대소문자와 숫자로만 입력
	//비밀번호: 4~12자의 영문 대소문자와 숫자로만 입력
	//firstname & lastname: 한글이나 영문 대소문자로만 입력
	//inputFirstName
	//inputLastName
	//inputId
	//inputPassword
	//inputPasswordConfirm
	
	//공백체크
	/* function checkExistData(value, dataName) {

		if (value == "") {
			alert(dataName + " 입력해주세요!");
			return false;
		}
		return true;
	} */

	//Firstname 체크
/*  	function checkFirstName(fr) {

		//form을 한번 더 호출해야지 접근할 수 있음.
		var form = document.registFrm;

		if (!checkExistData(fr, "이름을"))
			return false;

		var firstName = /^[가-힣a-zA-Z]+$/;

		if (!firstName.test(fr)) {

			alert("이름은 영문과 한글로만 입력해주세요.1");
			form.inputFirstName.value = "";
			form.inputFirstName.focus();
			return false;
		}
		return true;
	}  */

	//Lastname 체크
/*  	function checkLastName(ln) {

		//form을 한번 더 호출해야지 접근할 수 있음.
		var form = document.registFrm;

		if (!checkExistData(ln, "성을"))
			return false;

		var lastName = /^[가-힣a-zA-Z]+$/;

		if (!lastName.test(ln)) {
			alert("이름은 영문과 한글로만 입력해주세요.2");
			form.inputLastName.value = "";
			form.inputLastName.focus();
			return false;
		}
		return true;
	}  */

	//아이디체크
/* 	function checkUserId(id) {

		//form을 한번 더 호출해야지 접근할 수 있음.
		var form = document.registFrm;

		//Id가 입력되었는지 확인하기 
		if (!checkExistData(id, "아이디를"))
			return false;

		var idRegExp = /^[a-zA-z0-9]{4,12}$/;

		if (!idRegExp.test(id)) {
			alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야 합니다.");
			form.inputId.value = "";
			form.inputId.focus();
			return false;
		}
		return true;
	} */

	//비밀번호 체크
/* 	function checkPassword(id, password1, password2) {

		//form을 한번 더 호출해야지 접근할 수 있음.
		var form = document.registFrm;

		if (!checkExistData(password1, "비밀번호를"))
			return false;
		if (!checkExistData(password2, "비밀번호 확인을"))
			return false;

		var password1RegExp = /^[a-zA-z0-9]{4,12}$/;

		if (!password1RegExp.test(password1)) {
			alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야 합니다.");
			form.inputPassword.value = "";
			form.inputPassword.focus();
			return false;
		}

		if (password1 != password2) {
			alert("두 비밀번호가 맞지 않습니다.");
			form.inputPassword.value = "";
			form.inputPasswordConfirm.value = "";
			form.inputPasswordConfirm.focus();
			return false;
		}

		return true;
	} */


	// 모든 함수 호출
/*  	function checkAll(form) {
		//firstname
		if (!checkFirstName(form.inputFirstName.value)) {
			return false;
		}
		//lastname
		if (!checkLastName(form.inputLastName.value)) {
			return false;
		}
		//id
	 	if (!checkUserId(form.inputId.value)) {
			return false;
		} 
		//pass
	 	if (!checkPassword(form.inputId.value, form.inputPassword.value,
				form.inputPasswordConfirm.value)) {
			return false;
		} 

		return true;
	} 
 */

	//정우오빠 JS	유효성 검사
	
   // submit 시 필수 입력 사항 입력 여부 확인
   function registValidate(form){
   	var id_val = document.getElementById("id_validate");
   	var p_check = document.getElementById("pass_check");
		if(form.inputFirstName.value == "") {
			alert("이름을 입력하세요.");
	   	form.inputFirstName.focus();
	   	return false;
		}
		if(form.inputLastName.value == "") {
			alert("성을 입력하세요.");
	   	form.inputLastName.focus();
	   	return false;
		}
   	if(form.inputId.value == "") {
  		alert("아이디를 입력하세요.");
      	form.inputId.focus();
      	return false;
   	} else {
   		if (id_val.innerHTML != "사용가능합니다.") {
   		alert("아이디를 확인하세요.");
   		form.inputId.focus();
   		return false;
   		} 
   	}
   	if(form.inputPassword.value == "") {
   		alert("비밀번호를 입력하세요.");
      	form.inputPassword.focus();
      	return false;
   	} else {
   		if(p_check.innerHTML != "사용가능합니다.") {
   			alert("비밀번호를 확인하세요.");
   			form.inputPassword.focus();
          	return false;
   		}
   	}
   	if(form.inputPasswordConfirm.value == "") {
   		alert("비밀번호를 확인하세요.");
   		form.inputPasswordConfirm.focus();
   		return false;
  }
	// submit 후 비밀번호 확인 시 다르면 경고창 띄우기
	if(form.inputPassword.value != form.inputPasswordConfirm.value) {
    		alert("비밀번호를 다시 확인하세요.");
       	form.inputPasswordConfirm.focus();
       	return false;
    	} 
    	if(form.inputFirstName.value == "") {
    		alert("이름을 입력하세요.");
       	form.inputFirstName.focus();
       	return false;
    	}
    	if(form.inputLastName.value == "") {
    		alert("성을 입력하세요.");
       	form.inputFirstName.focus();
       	return false;
    	}
	/* alert("폼값이 전송되기 전 유효성 체크를 해주세요."); */

   }
   
   // 아이디 focus 시 유효성 검사
   function idCheck(form){
   	var id_val = document.getElementById("id_validate");
   	// 아이디 입력 X
   	if(form.inputId.value == "") {
   		id_val.innerHTML = "아이디를 입력하세요.";
		id_val.style.color = "red";
   		/* form.user_id.focus(); */
   	// 아이디 입력 O
   	} else {
   		// 아이디 값을 넣어서 검증할 변수 선언
   		var u_id = form.inputId.value;
   		
   		// 아이디가 8 ~ 16자리인지 확인
   		if(u_id.length >= 8 && u_id.length <= 16) {
   			// 아이디에 숫자, 영문만 있는지 확인하여 참인지 거짓인지 판단할 변수 선언
   			var check = true;
   			// 아이디 전체를 문자 하나하나 잘라서 아스키 코드로 확인
   			for(var i = 0; i < u_id.length; i++) {
   				var ascii = u_id.charCodeAt(i);
   				if(!((ascii >= 48 && ascii <= 57) || (ascii >= 97 && ascii <= 122))) {
   					// 아이디의 문자 중 하나라도 숫자, 영문이 아니면 false 반환
  					 	check = false;
   				}
   			}
   			// check가 false이면 영문, 숫자 이외의 문자가 입력되었으므로 새로 입력하라는 문구 출력
   			if(check == false) {
   				/* alert("영문과 숫자만 입력하세요."); */
   				id_val.innerHTML = "영문(소문자), 숫자만 입력하세요.";
   				id_val.style.color = "red";
   				/* form.user_id.focus(); */
   			} else {
   				// 영문, 숫자만 있으므로 사용가능하다는 문구 출력
				id_val.innerHTML = "사용가능합니다.";
				id_val.style.color = "skyblue";
				/* form.pass1.focus(); */
   				/* alert("사용가능한 아이디입니다."); */
   			}
   		} else {
   			// 아이디가 8 ~ 16자리가 아니므로 다시 입력하라는 문구 출력
   			/* alert("8~16 자리로 입력하세요.") */
   			id_val.innerHTML = "8~16 자리로 입력하세요.";
   			id_val.style.color = "red";
   			/* form.user_id.focus(); */
   		}
   	}
   	return false;
   }
   
   // 아이디 중복 확인
   function id_Duplication_Check(form) {
   	var id_val = document.getElementById("id_validate");
   	// 아이디 입력 X
   	if(form.inputId.value == "") {
   		alert("아이디 입력 후 중복확인하세요.");
   		form.inputId.focus();
   		
   		// 아이디 입력 O
   	} else {
   		// 사용가능한 아이디 일 때
   		if(id_val.innerHTML == "사용가능합니다.") {
   			// 중복확인 팝업창 띄우기
   			window.open("id_duplication.jsp?inputId=" + form.inputId.value, "idover", "width=500px, height=300px");
   		// 사용가능한 아이디가 아니면 경고창 띄우기
   		} else {
   			alert("사용 가능한 아이디가 아닙니다.");
   			form.inputId.focus();
   		}
   	}
}
   
   // 비밀번호 입력 시 유효성 검사
   function passCheck(form) {
   	if(form.inputPassword.value != null) {
   		var u_pass = form.inputPassword.value;
   		var check = document.getElementById("pass_check");
   		
   		if(u_pass.length >= 6 && u_pass.length <= 20) {
   			var num = 0;
   			var upp_Alpha = 0;
   			var low_Alpha = 0;
   			var symbol = 0;
   			for(var i = 0; i < u_pass.length; i++) {
   				var ascii = u_pass.charCodeAt(i);
   				if(ascii >= 48 && ascii <= 57) num++;
   				if(ascii >= 65 && ascii <= 90) upp_Alpha++;
   				if(ascii >= 97 && ascii <= 122) low_Alpha++;
   				if((ascii >= 33 && ascii <= 47) || (ascii >= 58 && ascii <= 64)
   						|| (ascii >= 91 && ascii <= 96)
   						|| (ascii >= 123 && ascii <= 126)) symbol++;
   			}
   			if( num > 0 && upp_Alpha > 0 && low_Alpha > 0 && symbol > 0 ) {
       			check.innerHTML = "사용가능합니다.";
   				check.style.color = "skyblue";
       			form.inputPasswordConfirm.focus();
   			} else {
   				check.innerHTML = "영문(대소문자)/숫자/특수문자가 모두 포함되어야 합니다.";
   				check.style.color = "red";
       			/* form.pass1.focus(); */
   			}
   		} else {
   			check.innerHTML = "6~20 자리로 입력하세요.";
			check.style.color = "red";
   			/* form.pass1.focus(); */
   		}
   	}
   }
   
   
   // 비밀번호, 휴대폰 번호, 전화번호 입력시 잘못된 사항
   $(function () {
       $('#inputPassword').keyup(function () {
         $('#inputPasswordConfirm').val('');
         $('#msg').val('');
       });

       $('#inputPasswordConfirm').keyup(function () {
         if ($('#inputPassword').val() == $('#inputPasswordConfirm').val()) {
           $('#msg').html('비밀번호 일치').attr('style', 'color: skyblue');
          /*  $('input[name=name]').focus(); */
         } else {
           $('#msg').html('비밀번호 불일치').attr('style', 'color: red');
           $('#inputPasswordConfirm').focus();
         }
       });
       
     });
	
</script>

<body class="bg-light">
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-7">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">Create
										Account</h3>
								</div>
								<div class="card-body">


									<!-- form tag -->
									<!-- input 타입 email 로 하면 안하고 그냥 알아서 해줌.  -->
									<form method="post" onsubmit="return registValidate(this);"
										action="../member/register.do" name="registFrm">
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="inputFirstName"
														name="inputFirstName" type="text"  /> <label
														for="inputFirstName" style="color: gray;">First
														name</label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating">
													<input class="form-control" id="inputLastName"
														name="inputLastName" type="text" /> <label
														for="inputLastName" style="color: gray;">Last name</label>
												</div>
											</div>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" id="inputId" name="inputId"
												type="text" onblur="idCheck(this.form);"/> 
												<label for="inputId" style="color: gray;">ID</label>

											<!-- 아이디 중복확인 -->
											<button type="button"
												onclick="id_Duplication_Check(this.form);" style="margin-top: 10px">중복확인</button>
											<br /> <span id="id_validate" style="color: skyblue"></span>

											<span id="id_validate" style="color: skyblue"></span>
											<!-- 아이디 중복확인 끝 -->
										</div>
										<div class="row mb-3">
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="inputPassword"
														name="inputPassword" type="password"
														placeholder="Create a password" onblur="passCheck(this.form);"  /> <label
														for="inputPassword" style="color: gray;">Password</label>
														<span id="pass_check"></span>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-floating mb-3 mb-md-0">
													<input class="form-control" id="inputPasswordConfirm"
														name="inputPasswordConfirm" type="password"
														placeholder="Confirm password" /> <label
														for="inputPasswordConfirm" style="color: gray;">Confirm
														Password</label>
														<span id="msg"></span>
												</div>
											</div>
										</div>
										<div class="mt-4 mb-0">
											<div class="d-grid">
												<button type="submit" class="btn btn-primary btn-block">Create
													Account</button>
											</div>
										</div>
										<!-- <input type="button" onclick="javascript:checkAll(this.form)" value="확인"> -->
									</form>
								</div>
								<div class="card-footer text-center py-3">
									<div class="small">
										<a href="http://localhost:8082/MariaMVCBoard/admin/login.jsp">Have
											an account? Go to login</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div id="layoutAuthentication_footer">
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Your Website 2022</div>
						<div>
							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
