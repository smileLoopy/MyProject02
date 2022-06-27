<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Register - SB Admin</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    </head>
<script>
    // js function 으로 값이 잘 안먹어서 controller에 작성함
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
    
    // [ 현재 문제점: focus 가 안먹음.... ]
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
    function checkExistData (value, dataName){
    	
    	if (value == ""){
    		alert(dataName + " 입력해주세요!");
    		return false;
    	}
    	return true;
    }
    
    
    //Firstname 체크
    function checkFirstName(fr){
    	
      //form을 한번 더 호출해야지 접근할 수 있음.
      var form = document.registFrm;
    	
    	if(!checkExistData(fr, "이름을"))
    		return false;
    	
    	var firstName = /^[가-힣a-zA-Z]+$/;
    	
    	if(!firstName.test(fr)){

    		alert("이름은 영문과 한글로만 입력해주세요.1");
    		form.inputFirstName.value ="";
    		/* document.getElementById("inputFirstName").focus(); */
    		form.inputFirstName.focus();
    		return false;
    	}
    	return true;
    }
    
    
    //Lastname 체크
    function checkLastName(ln){
    	
    	//form을 한번 더 호출해야지 접근할 수 있음.
    	var form = document.registFrm;
    	
    	if(!checkExistData(ln, "성을"))
    		return false;
    	
    	var lastName = /^[가-힣a-zA-Z]+$/;
    	
    	if(!lastName.test(ln)){
    		/* 여기로 떨어짐. */
    		alert("이름은 영문과 한글로만 입력해주세요.2");
    		form.inputLastName.value ="";
    		form.inputLastName.focus();
    		return false;
    	}
    	return true;
    }
    
    //아이디체크
    function checkUserId(id){
    	
    	//form을 한번 더 호출해야지 접근할 수 있음.
    	var form = document.registFrm;
    	
    	//Id가 입력되었는지 확인하기 
    	if (!checkExistData(id, "아이디를"))
    		return false;
    	
    	var idRegExp = /^[a-zA-z0-9]{4,12}$/;
    	
    	if(!idRegExp.test(id)){
    		alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야 합니다.");
    		form.inputId.value = "";
    		form.inputId.focus();
    		return false;
    	}
    	return true;
    }

    //비밀번호 체크
    function checkPassword (id, password1, password2){
    	
    	//form을 한번 더 호출해야지 접근할 수 있음.
    	var form = document.registFrm;
    	
    	if(!checkExistData(password1, "비밀번호를"))
    		return false;
    	if(!checkExistData(password2, "비밀번호 확인을"))
    		return false;
    	
    	var password1RegExp = /^[a-zA-z0-9]{4,12}$/;
    	
    	if(!password1RegExp.test(password1)){
    		alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야 합니다.");
    		form.inputPassword.value="";
    		form.inputPassword.focus();
    		return false;
    	}
    	
      if(password1 != password2){
    		alert("두 비밀번호가 맞지 않습니다.");
    		form.inputPassword.value="";
    		form.inputPasswordConfirm.value="";
    		form.inputPasswordConfirm.focus();
    		return false;
    	}
    	
    	 return true;
    }
    
/*     //비밀번호 & 비밀번호 확인 체크 
     function checkTwoPass (password1, password2){
    	
    	//form을 한번 더 호출해야지 접근할 수 있음.
    	
    	var form = document.registFrm;
    	
    	if(password1 != password2){
    		alert("두 비밀번호가 맞지 않습니다.");
    		form.password1.value="";
    		form.password2.value="";
    		form.password2.focus();
    		return false;
    	}
    	
    	 return true;
    	
    } */
    
    
    // 모든 함수 호출
    function checkAll(form){
    	//firstname
    	if(!checkFirstName(form.inputFirstName.value)){
    		return false;
    	}
    	//lastname
    	if (!checkLastName(form.inputLastName.value)){
    		return false;
    	}
    	//id
    	if(!checkUserId(form.inputId.value)){
    		return false;
    	}
    	//pass
    	if (!checkPassword(form.inputId.value, form.inputPassword.value, form.inputPasswordConfirm.value)){
    		return false;
    	}
     	//two pass
/*     	if (!checkTwoPass(form.inputPassword.value, form.inputPasswordConfirm.value)){
    		return false;
    	}  */
    	
    	return true;
    }
    
    // 아이디 중복 확인
    function id_Duplication_Check(form) {
    	/* 밑에 파란창. */
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
    			form.user_id.focus();
    		}
    	}

</script>
    
    <body class="bg-light">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Create Account</h3></div>
                                    <div class="card-body">
                                    
                                    
                                    <!-- form tag -->
                                    <!-- input 타입 email 로 하면 안하고 그냥 알아서 해줌.  -->
                                        <form method="post"  onsubmit="return checkAll(this);" action="../member/register.do" name="registFrm" >
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputFirstName" name="inputFirstName" type="text" placeholder="Enter your first name" />
                                                        <label for="inputFirstName">First name</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating">
                                                        <input class="form-control" id="inputLastName" name="inputLastName" type="text" placeholder="Enter your last name" />
                                                        <label for="inputLastName">Last name</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inputId" name="inputId" type="text"/>
                                                <label for="inputId">inputId</label>
                                                
                                                <!-- 아이디 중복확인 -->
                                                <button type="button" onclick="id_Duplication_Check(this.form);" style="margin-top: 10px;">중복확인</button>
                                                <br />
                                                
                                                <span id="id_validate" style="color: skyblue"></span>
                                                <!-- 아이디 중복확인 끝 -->
                                            </div>
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputPassword" name="inputPassword" type="password" placeholder="Create a password" />
                                                        <label for="inputPassword">Password</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-floating mb-3 mb-md-0">
                                                        <input class="form-control" id="inputPasswordConfirm" name="inputPasswordConfirm" type="password" placeholder="Confirm password" />
                                                        <label for="inputPasswordConfirm">Confirm Password</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid"><button type="submit" class="btn btn-primary btn-block" >Create Account</button></div>
                                            </div>
                                            <!-- <input type="button" onclick="javascript:checkAll(this.form)" value="확인"> --> 
                                        </form>
                                        
                                        
                                        
                                        
                                    </div>
                                    <div class="card-footer text-center py-3">
                                        <div class="small"><a href="http://localhost:8082/MariaMVCBoard/admin/login.jsp">Have an account? Go to login</a></div>
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
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
