<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<t:user_layout title="Đăng ký">

	<jsp:attribute name="js">
	    <script src="${pageContext.request.contextPath }/resources/js/jquery.validate.min.js"></script>
	    <script type="text/javascript">
	        $(function () {
	            $('#reg').validate({
	                rules: {
	                	id: {
	                        required: true
	                    },
	                    password: {
	                        required: true
	                    },
	                    ConfirmPWD: {
	                        required: true,
	                        equalTo: $("[name='password']")
	                    },
	                    hoTen: {
	                        required: true
	                    },
	                    diaChi: {
	                        required: true
	                    },
	                    soDienThoai: {
	                        required: true
	                    },
	                    ngaySinh: {
	                        required: true
	                    },
	                },
	
	                messages: {
	                    id: {
	                        required: 'Chưa nhập tên đăng nhập'
	                    },
	                    password: {
	                        required: 'Chưa nhập mật khẩu'
	                    },
	                    ConfirmPWD: {
	                        required: 'Chưa nhập lại mật khẩu',
	                        equalTo: 'Mật khẩu nhập lại không đúng'
	                    },
	                    hoTen: {
	                        required: 'Chưa nhập họ tên'
	                    },
	                    diaChi: {
	                        required: 'Chưa nhập địa chi'
	                    },
	                    soDienThoai: {
	                        required: 'Chưa nhập số điện thoại'
	                    },
	                    ngaySinh: {
	                        required: 'Chưa nhập ngày sinh'
	                    },
	                },
	            });
	            $('#id').focus();
	        });
	    </script>
	    <script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.min.js">
			
		</script>
		<script>
			$('.datepicker').datepicker();

		</script>
	</jsp:attribute>
	
	<jsp:attribute name="content">
			<h2>Đăng ký tài khoản</h2>
			<f:form commandName="reg" method="POST" action="register" class="form-horizontal">
				<div class="form-group">
					<label for="id" class="col-md-2 control-label">Tài khoản</label>
					<div class="col-md-6">
						<f:input class="form-control" path="id" />	
					</div>					
				</div>
				<div class="form-group">
					<label for="password" class="col-md-2 control-label">Mật khẩu</label>
					<div class="col-md-6">
						<f:input type="password" class="form-control" path="password" />	
					</div>					
				</div>
				<div class="form-group">
					<label for="ConfirmPWD" class="col-md-2 control-label">Nhập lại</label>
					<div class="col-md-6">
						<input id="ConfirmPWD" name="ConfirmPWD" type="password" class="form-control"/>	
					</div>					
				</div>
				<div class="form-group">
					<label for="hoTen" class="col-md-2 control-label">Họ tên</label>
					
					<div class="col-md-6">
						<f:input class="form-control" path="hoTen" />
					</div>							
				</div>
				<div class="form-group">
					<label for="diaChi" class="col-md-2 control-label">Địa chỉ</label>
					<div class="col-md-6">
						<f:input class="form-control" path="diaChi" />
					</div>						
				</div>
				<div class="form-group">
					<label for="soDienThoai" class="col-md-2 control-label">Số điện thoại</label>
					<div class="col-md-6">
						<f:input class="form-control" path="soDienThoai" />
					</div>						
				</div>
				<div class="form-group">
					<label for="ngaySinh" class="col-md-2 control-label">Ngày sinh</label>
					<div class="col-md-6">
						<f:input class="form-control datepicker" path="ngaySinh" />
					</div>						
				</div>
				<div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
			      		<input type="submit" class="btn btn-default" value="Đăng ký">
				    </div>
				</div>
			</f:form>
				
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
</t:user_layout>

