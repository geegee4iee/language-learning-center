<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<t:user_layout title="Đăng ký">
	<jsp:attribute name="content">
		<div class="container">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<f:form commandName="reg" method="POST" action="register">
						<div class="form-group">
							<label>Tài khoản</label>
							<f:input class="form-control" path="id" />						
						</div>
						<div class="form-group">
							<label>Mật khẩu</label>
							<f:input type="password" class="form-control" path="password" />						
						</div>
						<div class="form-group">
							<label>Họ tên</label>
							<f:input class="form-control" path="hoTen" />						
						</div>
						<div class="form-group">
							<label>Địa chỉ</label>
							<f:input class="form-control" path="diaChi" />						
						</div>
						<div class="form-group">
							<label>Số điện thoại</label>
							<f:input class="form-control" path="soDienThoai" />						
						</div>
						<div class="form-group">
							<label>Ngày sinh</label>
							<f:input class="form-control datepicker" path="ngaySinh" />						
						</div>
						<input type="submit" class="btn btn-default" value="Đăng ký">
					</f:form>
				</div>
			</div>
		</div>	
		<div>
		${user.id }
		${user.password}
		${user.hoTen }
		${user.diaChi }
		${user.ngaySinh }
		${date }
		</div>
</jsp:attribute>

	<jsp:attribute name="css">
		<link
			href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker3.min.css"
			rel="stylesheet" type="text/css" />
</jsp:attribute>
	<jsp:attribute name="js">
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.min.js">
			
		</script>
		<script>
			$('.datepicker').datepicker();

		</script>
</jsp:attribute>
</t:user_layout>

