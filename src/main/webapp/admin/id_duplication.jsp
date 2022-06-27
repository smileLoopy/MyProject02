<%@page import="utils.JSFunction"%>
<%@page import="member.MembershipDTO"%>
<%@page import="member.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//쿼리스트링으로 전달된 id 값을 String id 변수에 저장함. 
String id = request.getParameter("inputId");

//member테이블에 파라미터로 전달된 id가 있는지 확인해야한다. 
MembershipDAO dao = new MembershipDAO();

//쿼리스트링으로 전달된 id 값을 String u_id 변수에 저장함. 
String u_Id = request.getParameter("inputId");

MembershipDTO dto = dao.idValidate(u_Id);

//일단 result 가 true 이면 즉, 해당 아이디는 DB에 저장되어 있지 않은 상태임. 즉, 사용 가능한 상태!
boolean result = true;

//dto에 저장된 아이디 값이 현재 입력한 값의 아이디값과 다른면 getId()했을때 null 값이 나옴. 즉 해당 아이디가 없음. 
if(dto.getId() == null) {
	//해당 아이디 사용가능.
	result = true;
//DB에 저장되어있는 아이디와 request영역에 저장된 현재 사용자가 입력한 아이디가 같으면 이미 회원가입이 되어있는 상태이기에
} else if(dto.getId().equals(u_Id)) {
	//해당 아이디 사용 불가능.
	result = false;
}

dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- JSP 배우기 전 Javascript에서 쓰는 코드 -->
<!-- <script>
// 주소창의 URL을 얻어와서 파라미터로 전달된 id를 브라우저에 출력한다.
window.onload = function(){
  var url = location.href;
  console.log(url);
  var parameters = (url.slice(url.indexOf('?') + 1, url.length)).split('&');
  console.log(parameters[0]); 
  returnValue = parameters[0].split('=')[1];
  document.getElementById('id').value = returnValue;
}
</script> -->

<script>
function Use_Id(){
	var id_val = document.getElementById("id_validate");
	if(id_val.innerHTML == "중복되었습니다.") {
		alert("중복확인 후 사용하세요.");
	} else {
		opener.document.getElementById("id").value = "<%= id %>";
		self.close();
	}
}

//idCheck 함수 굳이 필요없는거 같아서 삭제함

</script>
</head>
<body>
<div class="container-fluid" style="background-color: #4A566C; color: white; height: 50px; font-size: 20px; font-weight: bold; padding-top: 10px">
아이디 중복확인
</div>


<!-- 폼태그에 전송된 값 한번더 id 체크 중복검사를 함. -->
<form name="idValFrm" action="idProcess.jsp" onsubmit="return idCheck(this);">
	<div style="padding: 15px 0px 15px 20px">
		<span>아이디는 영문(소문자), 숫자로 8 ~ 16자 이내로 입력해 주세요.</span>
	</div>
<%
if(result==true){
%>
	<div style="padding: 0px 0px 15px 20px">
		<input type="text" name="user_id" id="id" value="<%= id %>" style="border: 1px solid #cccccc; height: 35px; margin-bottom: 10px" readonly/>
		<br />
		<span id="id_validate" style="color: skyblue">입력한 아이디인 <%= id %>는 사용가능한 아이디입니다.</span>
	</div>
<%
} else {
%>
	<div style="padding: 0px 0px 15px 20px">
		<input type="text" name="user_id" id="id" value="<%=id%>" style="border: 1px solid #cccccc; height: 35px"/>
		<button type="submit" style="background-color: white; border: 1px solid #cccccc; height: 35px; border-radius: 5px" >중복확인</button>
		<br />
		<span id="id_validate" style="color: red">중복되었습니다.</span>
		<br />
	</div>
<% 
} 
%>
	<div style="color: gray; padding-left: 20px">
		<span>공백 또는 특수문자가 포함된 아이디는 사용할 수 없습니다.</span>
		<p>숫자로 시작하거나, 숫자로만 이루어진 아이디는 사용할 수 없습니다.</p>
	</div>
	<div class="container-fluid text-center" style="margin-top: 100px; background-color: #F2F5FA; padding-top: 10px; padding-bottom: 10px; border-top: 1px solid #cccccc; position: absolute; bottom: 0;">
		<button class="btn" type="button" onclick="Use_Id();" style="background-color: #4A566C; color: white; width: 120px;">사용하기</button>	
	</div>
</form>



</body>
</html>