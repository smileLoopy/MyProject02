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
</head>
<body>
<div class="container mt-3" style="margin-bottom: 50px;">
<h2>파일 첨부형 게시판 - 상세 보기(View)</h2>

<table class="table table-striped">
    <colgroup>
        <col width="15%"/> <col width="35%"/>
        <col width="15%"/> <col width="*"/>
    </colgroup> 
    <tr>
        <td>번호</td> <td>${dto.idx }</td>
        <td>작성자</td> <td>${dto.name }</td>
    </tr>
    <tr>
        <td>작성일</td> <td>${dto.postdate }</td>
        <td>조회수</td> <td>${dto.viewcount }</td>
    </tr>
    <tr>
        <td>제목</td>
        <td colspan="3">${dto.title }</td>
    </tr>
    <tr>
        <td>내용</td>
        <td colspan="3" height="100">
        
        	${dto.content }
        	<br />
        	<!-- 이미지 또는 음원 출력 -->
        	<c:choose>
        		<c:when test="${fileType == 'image' }">
        			<!--### 이미지 크기 조정  -->
        			<img alt="" src="../Uploads/${dto.sfile}" style="max-width:500px">
        		</c:when>
        		<c:when test="${fileType eq 'music' }">
        			<!-- controls 없으면 화면에 안뿌려짐 -->
        			<!-- 영상 넣고 싶으면 video 태그를 쓰면 됨. -->
        			<audio src="../Uploads/${dto.sfile}" controls="controls"></audio>
        		</c:when>
        	</c:choose>	
        </td>
    </tr> 
    <tr>
        <td>첨부파일</td>
        <td>
        <!--  
        첨부된 파일이 있는 경우에는 파일명과 다운로드 링크를 출력한다.
        다운로드가 완료되면 카운트 하기 위해 idx(일련번호)를 파라미터로 받는다.
        -->
        	<c:if test="${not empty dto.ofile }">
        	${dto.ofile }
        	<!-- 한줄로 써야함. 엔터키가 들어가면 값이 들어감. -->
        	<a href="../myboard/download.do?ofile=${dto.ofile }&sfile=${dto.sfile}&idx=${dto.idx}">
                [다운로드]            
        	</a>
        	</c:if>            
        </td>
         <td>다운로드수</td>
        <td>${dto.downcount }</td>
    </tr> 
    <tr>
        <td colspan="4" align="center">
        		<!-- 수정하기, 삭제하기 pass.do 라고 있는 이유는 누가 쓴지 모르기에... pass으로만 확인 가능
        		근데 수정인지 삭제인지 어떻게앎? => mode 파라미터 넣음 -->
            <button  class="btn btn-outline-dark" type="button" onclick="location.href='../myboard/pass2.do?mode=edit&idx=${param.idx}';">
                수정하기
            </button>
            <button  class="btn btn-outline-dark" type="button" onclick="location.href='../myboard/pass2.do?mode=delete&idx=${param.idx}';">
                삭제하기
            </button>
            <button  class="btn btn-outline-dark" type="button" onclick="location.href='../myboard/list2.do';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table>
</div>
</body>
</html>
