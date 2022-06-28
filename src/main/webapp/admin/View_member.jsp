<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>회원정보 상세보기</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- BootStrap CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-3" style="margin-bottom: 50px;">
  <h2>회원정보 상세보기</h2>
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
      	<td>${dto.idx }</td>
        <td>${dto.firstname }</td>
        <td>${dto.lastname }</td>
        <td>${dto.id }</td>
        <td>${dto.pass }</td>
        <td>${dto.regidate }</td>
      </tr>
      <tr>
      	<td></td>
        <td colspan="4" align="center">
        		<!-- 수정하기, 삭제하기 pass.do 라고 있는 이유는 누가 쓴지 모르기에... pass으로만 확인 가능
        		근데 수정인지 삭제인지 어떻게앎? => mode 파라미터 넣음 -->
            <button class="btn btn-outline-primary" type="button" onclick="location.href='../member/pass.do?mode=edit&idx=${param.idx}';">
                수정하기
            </button>
            <button class="btn btn-outline-danger" type="button" onclick="location.href='../member/pass.do?mode=delete&idx=${param.idx}';">
                삭제하기
            </button>
            <button class="btn btn-outline-dark" type="button" onclick="location.href='../member/list.do';">
                목록 바로가기
            </button>
        </td>
        <td></td>
    </tr>
    </tbody>
  </table>
</div>

</body>
</html>
