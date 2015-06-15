<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<t:user_layout title="Thông tin cá nhân">
<jsp:attribute name="css">
		<link
			href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker3.min.css"
			rel="stylesheet" type="text/css" />
	</jsp:attribute>
<jsp:attribute name="js">
	    <script src="${pageContext.request.contextPath }/resources/js/jquery.validate.min.js"></script>
	    <script type="text/javascript">
	        $(function () {
	            $('#objHv').validate({
	                rules: {
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
	        });
	    </script>
	    <script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.min.js">
			
		</script>
		<script>
			$('.datepicker').datepicker({
				format: 'yyyy-mm-dd'
				});

		</script>
	</jsp:attribute>
	<jsp:attribute name="content">
		<div class="col-md-12 ">
			<h3 class="page-header">Thông tin tài khoản</h3>
		
		</div>
		<f:form commandName="objPwd" method="POST" class="form-horizontal" action="changepwd">
			
			
			<div class="form-group">
				<label for="id" class="col-md-2 control-label">Tài khoản</label>
				<div class="col-md-6">
					<h4>${objPwd.id }</h4>
					<f:input class="form-control" path="id" type="hidden"/>	
			 	</div>					
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">Mật khẩu cũ</label>
				<div class="col-md-6">
					<f:input class="form-control" path="password" type="password"/>	
				</div>					
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">Mật khẩu mới</label>
				<div class="col-md-6">
					<f:input class="form-control" path="passwordNew" type="password"/>	
				</div>
            </div>
            <div class="form-group">
				<label for="password" class="col-sm-2 control-label">Nhập lại</label>
				<div class="col-md-6">
					<input class="form-control" type="password" name="ConfirmPwd"/>	
				</div>
            </div>
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
		      		<input type="submit" class="btn btn-default" value="Đổi mật khẩu">
			    </div>
			</div>
	</f:form>
	<div class="col-md-12 ">${status }</div>
	
	<div class="col-md-12 ">
			<h3 class="page-header">Thông tin cá nhân</h3>
		
		</div>
		<f:form commandName="objHv" method="POST" class="form-horizontal" action="changeinfo">
			
			
			<div class="form-group">
					<label for="hoTen" class="col-md-2 control-label">Họ tên</label>
					
					<div class="col-md-6">
					<f:input class="form-control" path="id" type="hidden"/>	
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
			      		<input type="submit" class="btn btn-default" value="Cập nhật">
				    </div>
				</div>
	</f:form>
	</jsp:attribute>
</t:user_layout>