<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<script type="text/javascript">
	//글쓰기 폼에서 누락된 내용이 있는지 확인하는 함수
	function validateForm(form) {
		
		if(form.pass.value == ""){
			alert("비밀번호를 입력하세요.");
			form.pass.focus();
			return false;
		}
		
	}
</script>
<!-- BootStrap CDN -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container mt-3" style="margin-bottom: 50px;">
<h2>패스워드 검증 (어드민쪽 Q&A)</h2>
<form name="writeFrm" method="post" action="../myboard/pass.do" onsubmit="return validateForm(this);">
<!--  
해당 요청명으로 넘어온 파라미터는 컨트롤러에서 받은 후 request영역에 저장하여 
View에서 확인할 수 있지만, EL을 이용하면 해당 과정없이 param내장객체로 즉시 
값을 받아올 수 있다.

※ hidden 박스를 사용하는 경우 웹브라우저에서는 숨김처리 되기 때문에 값이 제대로 
입력되었는지 화면으로 확인할 수 없다. 따라서 개발자모드를 사용하거나 type을 디버깅용으로
잠깐 수정한 후 값이 제대로 입력되었는지 반드시 확인해야 한다.
(hidden값이 잘 들어오는지 확인하려면 hidd-en 이런식으로 오타를 내서 확인해보기 or 소스보기 or F12으로 element에서 확인)
-->
<%-- <input type="hidden"  name="idx"	value="${param.idx }"/>
 --%>
<input type="hidden"  name="idx"	value="${idx }"/>
<!-- 아까 controller에서 request 영역에 set 했으니까 -->
<input type="hidden"  name="mode"	value="${mode }"/>
<table class="table">
	<thead class="table-dark" align="center">
		<tr>
			<td>비밀번호</td>
		</tr>
  </thead>
	 <tbody align="center">
	 	<tr>
			<td>
				<input type="password" name="pass" style="width:100px;" />
			</td>
	 	</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-outline-dark">작성완료</button>
				<button type="reset" class="btn btn-outline-danger">RESET</button>
				<button type="button" onclick="location.href='../myboard/list.do';" class="btn btn-outline-primary" >목록 바로가기</button>
			</td>
		</tr>
	 </tbody>

</table>
</form>	
</div>
</body>
</html>



























