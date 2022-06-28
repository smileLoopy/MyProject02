<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
<!-- BootStrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
	//글쓰기 폼에서 누락된 내용이 있는지 확인하는 함수
	function validateForm(form) {
		if(form.name.value == ""){
			alert("작성자를 입력하세요.");
			form.name.focus();
			return false;
		}
		if(form.title.value == ""){
			alert("제목을 입력하세요");
			form.title.focus();
			return false;
		}
		if(form.content.value == ""){
			alert("내용을 입력하세요");
			form.content.focus();
			return false;
		}
		if(form.pass.value == ""){
			alert("비밀번호를 입력하세요.");
			form.pass.focus();
			return false;
		}
		
	}

</script>
</head>
<body>
<div class="container mt-3" style="margin-bottom: 50px;">
<h2>파일 첨부형 게시판 - 글쓰기 (write)</h2>
<!--  
	파일을 첨부하기 위한 작성폼은 아래 2가지 조건이 지켜져야 한다. 
	1. 전송방식(method)은 post여야 한다. 
	2. 인코딩방식(enctype)은 multipart/form-data로 지정해야 한다.
	이와 같이 <form>태그를 구성한 후 전송(submit)하면 일반적인 request 객체로는
	폼값을 받을 수 없다. cos.jar 확장라이브러리가 제공하는 MultipartRequest 
	객체를 사용해서 폼값을 받아야 한다. 
-->
<form name="writeFrm" method="post" enctype="multipart/form-data" action="../myboard/write.do" onsubmit="return validateForm(this);">
<table class="table table-striped">
	<colgroup>
<%--     <col width="15%"/> <col width="35%"/> --%>
   <col width="15%"/> <col width="*"/>
	</colgroup> 
	<tr>
		<td>작성자</td>
		<td>
			<input type="text" name="name" style="width:150px;" />
		</td>
	</tr>
	
	<tr>
		<td>제목</td>
		<td>
			<input type="text" name="title" style="width:90%;" />
		</td>
	</tr>
	
	<tr>
		<td>내용</td>
		<td>
			<textarea name="content" style="width:90%; height:100px"></textarea>
		</td>
	</tr>
	
	<tr>
		<td>첨부 파일</td>
		<td>
			<input type="file" name="ofile" />
		</td>
	</tr>
	
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="pass" style="width:100px;" />
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<button class="btn btn-outline-dark" type="submit">작성완료</button>
			<button class="btn btn-outline-dark" type="reset">RESET</button>
			<button class="btn btn-outline-dark" type="button" onclick="location.href='/myboard/list.do';">목록 바로가기</button>
		</td>
	</tr>


</table>
</form>	
</div>
</body>
</html>



























