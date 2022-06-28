<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>회원정보 수정하기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-3" style="margin-bottom: 50px;">
  <h2>회원정보 수정하기</h2>
<form name="writeFrm" method="post" enctype="multipart/form-data" action="../member/edit.do">
  <!-- 게시물 수정을 위해 일련번호와 기존 파일명을 hidden박스에 추가한다. -->
	<input type="hid-den" name="idx" value="${dto.idx }"/>
  <p>해당 사이트에 가입한 회원들의 정보를 볼 수 있습니다.</p>
  <table class="table">
    <thead class="table-dark">
      <tr>
      	<th>IDX</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>ID</th>
        <th>Password</th>
        <th>Register Date</th>
      </tr>
    </thead>
    <tbody>
      <tr>
      	<td>
      	<input type="text" name="idx"  value="${dto.idx }" style="width: 30px"/>
      	</td>
      	<td>
      	<input type="text" name="idx"  value="${dto.firstname }" style="width: 80px"/>
      	</td>
      	<td>
      	<input type="text" name="idx"  value="${dto.lastname }" style="width: 80px"/>
      	</td>
      	<td>
      	<input type="text" name="idx"  value="${dto.id }" style="width: 80px"/>
      	</td>
      	<td>
      	<input type="text" name="idx"  value="${dto.pass }" style="width: 80px"/>
      	</td>
      	<td>
      	<input type="text" name="idx"  value="${dto.regidate }" style="width: 80px"/>
      	</td>
      </tr>
      <tr>
      	<td></td>
        <td colspan="4" align="center">
      		<button type="submit" >작성완료</button>
					<button type="reset" >RESET</button>
					<button type="button" onclick="location.href='../member/list.do';">목록 바로가기</button>
        </td>
        <td></td>
    </tr>
    </tbody>
  </table>
</form>
</div>
</body>
</html>
