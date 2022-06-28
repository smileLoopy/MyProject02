<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pss_member의 경우 비밀번호 검증은 필요없음...하지만 mode값을 받아와야햠.</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

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
<%-- <input type="hid-den"  name="idx"	value="${idx }"/>
<!-- 아까 controller에서 request 영역에 set 했으니까 -->
<input type="hidd-en"  name="mode"	value="${mode }"/> --%>


<form name="writeFrm" method="post" action="../member/pass.do">
<input type="hidden"  name="idx"	value="${idx }"/>
<!-- 아까 controller에서 request 영역에 set 했으니까 -->
<input type="hidden"  name="mode"	value="${mode }"/>
<div class="container mt-3" style="margin-bottom: 50px;">
<h2>수정하려는 회원 번호와 모드를 확인해주세요! (Pass.member.jsp)</h2>
  <table class="table">
    <thead class="table-dark">
      <tr>
      	<th>회원번호</th>
        <th>수정/삭제 (모드)</th>
      </tr>
    </thead>
    <tbody>
      <tr>
      	<td>${idx }</td>
        <td>${mode }</td>
      </tr>
      <tr>
        <td colspan="4" align="center">
        		<button type="submit" class="btn btn-outline-dark" >확인</button>
            <button class="btn btn-outline-primary" type="button" onclick="window.history.go(-1); return false;">
                목록
            </button>
        </td>
    </tr>
    </tbody>
  </table>
</div>

</form>	
</body>
</html>



























