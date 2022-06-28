<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Q&A 게시판</title>
<style type="text/css">
input[type=submit] {
    padding:5px; 
    border:2px solid #ccc; 
    -webkit-border-radius: 5px;
    border-radius: 5px;
}
#btnWrite{
	margin-bottom: 15px;
}


</style>
<!-- 폰트어썸 cdn -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" />

<!-- bootstrap cdn-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- admin css-->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/admin/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

<!-- Website css => 문제점: Website 템플릿 까지 합치면 뭔가 겹침. => 그래서 페이징이 삐뚤어짐.
	+) header쪽에 템플릿 절대경로 지정하고 이쪽 파일에서 경로 지정 안하면 또 안나옴.
	+) admin 쪽으로 복사한 website css 파일만 돌려도 안나옴.
-->
<!-- Bootstrap Core CSS -->
<%-- <link href="<%=request.getContextPath()%>/Website/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/Website/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="fonts/stylesheet.css">
<link href="<%=request.getContextPath()%>/Website/css/mb-comingsoon-iceberg.css" rel="stylesheet" />
<!-- Custom Fonts -->
<link href="<%=request.getContextPath()%>/Website/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- jQuery and Modernizr-->
<script src="<%=request.getContextPath()%>/Website/js/jquery-2.1.1.js"></script>
<!-- 이거 파일에 없는데? -->
<script src="<%=request.getContextPath()%>/Website/js/modernizr.custom.97074.js"></script> --%>


</head>
<%-- <header class="sub-header">
	<jsp:include page="../Website/header.jsp" />
</header> --%>
<body class="sb-nav-fixed">
	<div id="layoutSidenav_content" style="margin-top: 30px">
		<main>
			<!-- include header website file  -->
			<div class="container-fluid px-4" >
				<i class="fa-solid fa-circle-arrow-left fa-2x" 	onclick="window.history.go(-1); return false;" ></i>
			 	<i class="fa-solid fa-house-chimney fa-2x" onclick="location.href='<%=request.getContextPath()%>/Website/index.jsp'"></i>
				<h1 class="mt-4" style="color: black">Q&A</h1>
				<!-- <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol> -->
				<div class="card mb-4">
					<div class="card-body">
						Q&A<br> DataTables is a third party plugin that is used to
						generate the demo table below. For more information about
						DataTables, please visit the <a target="_blank"
							href="https://datatables.net/">official DataTables
							documentation</a>
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> DataTable Example
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>Number</th>
									<th>Title</th>
									<th>Name</th>
									<th>Views</th>
									<th>Date</th>
									<th>File</th>
									<th>Download</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty boardLists }">
										<tr>
											<td align="center">등록된 게시물이 없습니다^^</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${boardLists }" var="row" varStatus="loop">
											<tr>
												<td>${row.idx }</td>
												<td><a
													href="http://localhost:8082/MariaMVCBoard/myboard/view2.do?idx=${row.idx }">${row.title }</a>
												</td>
												<td>${row.name }</td>
												<td>${row.viewcount }</td>
												<td>${row.postdate }</td>
												<td>${row.ofile }</td>
												<td><c:if test="${not empty row.ofile }">
														<a
															href="../myboard/download.do?ofile=${row.ofile }&sfile=${row.sfile}&idx=${row.idx}">
															[Down]</a>
													</c:if></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
				<button id="btnWrite" type="button" class="btn btn-outline-dark" onclick="location.href='../myboard/write2.do'">글쓰기</button>
			</div>
		</main>
		<footer class="py-4 bg-light mt-auto">
			<div class="container-fluid px-4">
				<div class="d-flex align-items-center justify-content-between small">
					<div class="text-muted">Copyright &copy; Your Website 2022</div>
					<div>
						<a href="#">Privacy Policy</a> &middot; <a href="#">Terms
							&amp; Conditions</a>
					</div>
				</div>
			</div>
		</footer>
	</div>
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <script src="<%=request.getContextPath()%>/admin/js/scripts.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
  <script src="<%=request.getContextPath()%>/admin/js/datatables-simple-demo.js"></script>
  

</body>
</html>
