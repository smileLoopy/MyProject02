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
<title>Tables - SB Admin</title>


<!-- admin css-->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/admin/css/styles.css" rel="stylesheet" />
<!-- css 절대경로 -->
<link href="<%=request.getContextPath()%>/admin/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/admin/js/jquery-2.1.1.js"></script>
<script src="<%=request.getContextPath()%>/admin/js/modernizr.custom.97074.js"></script>



<!-- Website side cdn fiels -->
<!-- Bootstrap Core CSS -->
<link href="<%=request.getContextPath()%>/admin/css2/bootstrap.min.css" rel="stylesheet" type="text/css">
<!-- 절대경로 -->
<link href="<%=request.getContextPath()%>/admin/css2/bootstrap.min.css" rel="stylesheet" type="text/css">

<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/admin/css2/style.css" rel="stylesheet">
<!-- 절대경로 -->
<link href="<%=request.getContextPath()%>/admin/css2/style.css" rel="stylesheet">
<link rel="stylesheet" href="fonts/stylesheet.css">
<link href="<%=request.getContextPath()%>/admin/css2/mb-comingsoon-iceberg.css" rel="stylesheet" />
<!-- 절대경로 -->
<link href="<%=request.getContextPath()%>/admin/css2/mb-comingsoon-iceberg.css" rel="stylesheet" />

<!-- Custom Fonts -->
<link href="<%=request.getContextPath()%>/admin/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- jQuery and Modernizr -->
<script src="<%=request.getContextPath()%>/admin/js2/jquery-2.1.1.js"></script>
<script src="<%=request.getContextPath()%>/admin/js2/modernizr.custom.97074.js"></script>




</head>
<header class="sub-header">
	<jsp:include page="../Website/header.jsp" />
</header>
<body class="sb-nav-fixed">
	<!-- header ìì -->
	<!-- ììª½ ë¤ë¸ë°, ì¬ì´ëë¤ë¸ë° headerë¡ ì¤ì  -->
	<!-- ììª½ ë¤ë¸ë° -->
	<!-- include1 -->
	<!-- <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark" id="header1"> -->
	<!-- header1 -->
	<!--     </nav> -->
	<!-- ì¬ì´ë ë¤ë¸ë° -->
	<!--        <div id="layoutSidenav">
            <div id="layoutSidenav_nav" >
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion"> -->
	<!-- include2 -->
	<!--   <div class="sb-sidenav-menu" id="header2">
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div> -->
	<!-- header ë -->
	<div id="layoutSidenav_content">
		<main>
			<!-- include header website file  -->
			<div class="container-fluid px-4">
				<input style="margin-left: 1px; margin-top: 20px" action="action"
					onclick="location.href='http://localhost:8082/MariaMVCBoard/Website/index.jsp'"
					type="submit" value="Go to the Main Page" /> <input
					style="margin-left: 5px; margin-top: 20px" action="action"
					onclick="window.history.go(-1); return false;" type="submit"
					value="Go Back" />
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
								</tr>
							</thead>
							<!--                                     <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </tfoot> -->
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
												<td>${row.title }</td>
												<td>${row.name }</td>
												<td>${row.viewcount }</td>
												<td>${row.postdate }</td>
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
				<button type="button" onclick="location.href='../myboard/write2.do'">글쓰기</button>
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
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/admin/js/scripts.js"></script>
	<!-- 절대경로 -->
	<script src="<%=request.getContextPath()%>/admin/js/scripts.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="<%=request.getContextPath()%>/admin/js/datatables-simple-demo.js"></script>
	<!-- 절대경로 -->
	<script
		src="<%=request.getContextPath()%>/admin//js/datatables-simple-demo.js"></script>
</body>
</html>
