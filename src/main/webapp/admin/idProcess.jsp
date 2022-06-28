<%@page import="member.MembershipDTO"%>
<%@page import="member.MembershipDAO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MembershipDAO dao = new MembershipDAO();
/* String u_Id = request.getParameter("id");  */
/* String u_Id = request.getParameter("inputId"); */
String u_Id = request.getParameter("user_id");
out.println("아이디:"+ u_Id);

MembershipDTO dto = dao.idValidate(u_Id);

boolean result = true;

if(dto.getId() == null) {
	result = true;
	/*이쪽 u_Id 를 못가져오네 */
	response.sendRedirect("id_duplication.jsp?inputId="+u_Id);
} else if(dto.getId().equals(u_Id)) {
	result = false;
	/* JSFunction.alertBack("중복되었습니다.", out); */
%>
<script>
	history.back();
</script>
<%
}

// 연습 1 ( 직접 값을 받아 비교 )
/* if(dto.getId() == null) {
	JSFunction.alertBack("사용가능합니다.", out);
} else if(dto.getId().equals(u_Id)) {
	JSFunction.alertBack("중복되었습니다.", out);
} */

// 연습 2 ( dao에서 값을 받아오면서 비교한 결과 값으로 비교)
/* int iResult = dao.idValidate2(u_Id);

if(iResult == 1) {
	JSFunction.alertBack("중복되었습니다.", out);
} else if(iResult == 2) {
	session.setAttribute("User_Id", u_Id);
	
	JSFunction.alertBack("사용가능합니다.", out);
}
 */
dao.close();
%>
<%-- <!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
</head>
<body>
	<form action="id_duplication.jsp?inputId="+<%=u_Id%>"></form>
	<input type="text" name="user_id" id="id" value="<%=u_Id%>" style="border: 1px solid #cccccc; height: 35px"/>
</body>
</html>
 --%>
