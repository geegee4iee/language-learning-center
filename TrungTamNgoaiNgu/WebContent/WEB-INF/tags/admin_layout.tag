<%@tag import="model.SessionUserModel"%>
<%@tag import="model.LoginModel"%>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@attribute name="title" required="true"%>
<%@attribute name="content" fragment="true"%>
<%@ attribute name="css" fragment="true" required="false"%>
<%@ attribute name="js" fragment="true" required="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>${title}</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/metisMenu.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.css"
	rel="stylesheet" type="text/css" />

<link
	href="${pageContext.request.contextPath}/resources/css/font-awesome-4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />


<jsp:invoke fragment="css"></jsp:invoke>
</head>
<body>
	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html">Trang quản lý</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right" id="form-logout">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>Xin
						chào ${sessionScope.accStaff.name }
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a
							href="${pageContext.request.contextPath }/profile/nhanvien"><i
								class="fa fa-sign-out fa-fw"></i> Thông tin cá nhân</a></li>
						<li class="divider"></li>
						<li>
							<form method="POST"
								action="${pageContext.request.contextPath }/tknhanvien/dangxuat">
								<input type="submit" id="submit-button" style="display: none" />
								<a href="#" onclick="$('#submit-button').click();"><i
									class="fa fa-sign-out fa-fw"></i> Logout</a>
							</form>
						</li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<c:choose>
							<c:when test="${sessionScope.accStaff.permission == 2}">
								<li><a
									href="${pageContext.request.contextPath }/nhanvien/index"><i
										class="fa fa-dashboard fa-fw"></i> Quản lý chuyên đề</a></li>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${sessionScope.accStaff.permission == 3}">
								<li><a
									href="${pageContext.request.contextPath }/bangiamdoc/thongke"><i
										class="fa fa-signal fa-fw"></i> Xem thống kê</a></li>
								<li><a
									href="${pageContext.request.contextPath }/bangiamdoc/phanhoi"><i
										class="fa fa-comments fa-fw"></i> Xem phản hồi</a></li>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${sessionScope.accStaff.permission == 4}">
								<li><a
									href="${pageContext.request.contextPath }/quantri/nhanvien"><i
										class="fa fa-user fa-fw"></i> Quản lý nhân viên</a></li>
								<li><a
									href="${pageContext.request.contextPath }/quantri/phanhoi"><i
										class="fa fa-comments fa-fw"></i> Quản lý phản hồi</a></li>
								<li><a
									href="${pageContext.request.contextPath }/quantri/backup"><i
										class="fa fa-save fa-fw"></i> Sao lưu & phục hồi</a></li>

								<li><a
									href="${pageContext.request.contextPath }/quantri/dangkykhoahoc"><i
										class="fa fa-comments fa-fw"></i>Đăng ký khóa học</a></li>
								<li><a
									href="${pageContext.request.contextPath }/quantri/dangkythi"><i
										class="fa fa-comments fa-fw"></i>Đăng ký thi</a></li>
								<li><a
									href="${pageContext.request.contextPath }/quantri/kythi"><i
										class="fa fa-comments fa-fw"></i>Quản lý kỳ thi</a></li>
							</c:when>
						</c:choose>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<!-- Page Content -->
		<jsp:invoke fragment="content"></jsp:invoke>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
</body>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/metisMenu.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/sb-admin-2.js"></script>

<jsp:invoke fragment="js"></jsp:invoke>

</html>

