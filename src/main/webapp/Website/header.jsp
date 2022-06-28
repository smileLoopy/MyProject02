<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<!-- Website css  -->
<!-- Bootstrap Core CSS -->
<link href="<%=request.getContextPath()%>/Website/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<!-- Custom CSS -->
<link href="<%=request.getContextPath()%>/Website/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="fonts/stylesheet.css">
<link href="css/mb-comingsoon-iceberg.css" rel="stylesheet" />
<!-- Custom Fonts -->
<link href="<%=request.getContextPath()%>/Website/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!-- jQuery and Modernizr-->
<script src="<%=request.getContextPath()%>/Website/js/jquery-2.1.1.js"></script>
<!-- 이거 파일에 없는데? -->
<script src="<%=request.getContextPath()%>/Website/js/modernizr.custom.97074.js"></script>
<!-- 헤더 시작 -->
<!-- <header class="sub-header">  이 부분은 페이지마다 삽입한다.-->
<!-- /////////////////////////////////////////Navigation -->
<nav class="">
	<div class="">
		<div class="navbar navbar-default">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header page-scroll"
					style="position: relative; z-index: 999">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand page-scroll"
						href="http://localhost:8082/MariaMVCBoard/Website/index.jsp">
						<img src="images/logoBlack.png" alt="" width="55 height="
						45" style="font-weight: bold;" /> Wonderful Indonesia
					</a>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right"
						style="position: relative; z-index: 999">
						<li><a class="page-scroll"
							href="http://localhost:8082/MariaMVCBoard/Website/index.jsp">Home</a>
						</li>
						<li><a class="page-scroll"
							href="http://localhost:8082/MariaMVCBoard/Website/single.jsp">About
								Us</a></li>
						<li><a class="page-scroll"
							href="http://localhost:8082/MariaMVCBoard/Website/archive.jsp">Blog</a>
						</li>
						<li><a class="page-scroll" href="../mynotice/list_notice2.do">Notice</a>
						</li>
						<li><a class="page-scroll" href="../myboard/list2.do">Q&A</a>
						</li>
						<li><a class="page-scroll" href="contact.jsp">Contact</a></li>
						<!-- Login & Logout -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-2 d-none d-lg-inline text-gray-600 ">Login&Logout</span>
								<img class="img-profile rounded-circle"
								src="images/indonesia.png" width="25" height="20">
						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown" style="text-align: center">
								<!-- 세션에 저장된 아이디 값이 있꼬 -->
								<%
								if (session.getAttribute("id") != null) {
									/* 만약 헤딩 아이디가 admin 이면... */
									if (session.getAttribute("id").equals("admin")) {
								%>
								<!-- admin이면 admin page랑 logout page를 보여주고...  -->
								<a class="dropdown-item" href="../admin/index.jsp"> Admin
									Page </a> <br /> <a class="dropdown-item"
									href="../admin/logout.jsp"> Logout </a>
								<!-- 만약 해당 아이디가 admin이 아니면... -->
								<%
								} else {
								%>
								<!-- 그냥 logout 페이지를 보여준다... -->
								<a class="dropdown-item" href="../admin/logout.jsp"> Logout
								</a>
								<%
								}
								%>


								<!-- 만약 세션에 저장된 아이디가 없다면... -->
								<%
								} else {
								%>
								<!-- register랑 login 페이지를 보여준다. -->
								<a class="dropdown-item" href="../admin/register.jsp">
									Register </a> <br /> <a class="dropdown-item"
									href="../admin/login.jsp"> Login </a>
								<%
								}
								%>
							</div></li>

					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->
</nav>
<!-- Navigation -->
<!-- 헤더끝  -->
<!-- 이부분에 다른 header 코드들 들어가있음. 각 페이지 마다 다름. -->
<!-- </header> -->
