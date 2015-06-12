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

<jsp:invoke fragment="css"></jsp:invoke>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Trang chủ</a>
			</div>
			<p class="navbar-text">
				<a href="${pageContext.request.contextPath}/account/login"
					class="navbar-link">Đăng nhập</a>
			</p>
			<p class="navbar-text">
				<a href="${pageContext.request.contextPath}/account/register"
					class="navbar-link">Đăng ký</a>
			</p>
			<p class="navbar-text">
				<a href="${pageContext.request.contextPath}/account/logout"
					class="navbar-link">Thoát</a>
			</p>
			<p class="navbar-text">
				<a href="${pageContext.request.contextPath}/khoahoc/list"
					class="navbar-link">Khóa học</a>
			</p>
			<p class="navbar-text">
				<a href="${pageContext.request.contextPath}/kythi/list"
					class="navbar-link">Chương trình thi</a>
			</p>
			<p class="navbar-text">
				<%
					if (session.getAttribute("acc") != null) {
						SessionUserModel log = (SessionUserModel) session.getAttribute("acc");
						out.print("Xin chào " + log.getName());
					}
				%>
			</p>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<form class="navbar-form navbar-left " role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Tìm kiếm</button>
				</form>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<jsp:invoke fragment="content"></jsp:invoke>
</body>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<jsp:invoke fragment="js"></jsp:invoke>
</html>
