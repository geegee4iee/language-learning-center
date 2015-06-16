<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<t:admin_layout title="Trang chủ">
	<jsp:attribute name="content">
		
		
        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
							Thông tin nhân viên
                        </h1>
                        <ol class="breadcrumb">
                        	<li>
                        		<a
								href="${pageContext.request.contextPath }/quantri/nhanvien">Nhân viên</a>
                        	</li>
                            <li class="active">
                                 Trang hiện tại
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                	<div class="col-md-5">
                		<f:form commandName="obj" method="POST"
							action="${pageContext.request.contextPath }/quantri/changeInfo"> 
                			<div class="form-group">
                				<label>Mã nhân viên</label>
                				<f:input class="form-control" readonly="true"
									path="id" />
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
                				<f:input class="form-control datepicker"
									path="ngaySinh" />
                			</div>
                			<button class="btn btn-default">Cập nhập</button>
                			<a href="${pageContext.request.contextPath }/quantri/nhanvien" class="btn btn-default">Trở lại</a>
                		</f:form>
                	</div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
	
	
	</jsp:attribute>
	<jsp:attribute name="css">
		<link
			href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker3.min.css"
			rel="stylesheet" type="text/css" />
	</jsp:attribute>
	<jsp:attribute name="js">
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js">
			
		</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.min.js">
			
		</script>
		<script>
			$(".datepicker").datepicker();

			//Validator Jquery
			$(function() {
				$('#changeInfo').validate({
					rules : {
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
					messages : {
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
					errorElement : 'small',
					errorClass : 'place-right fg-yellow error',
					highlight : function(element) {
						$(element).closest('.form-control').addClass('error');
					},
					success : function(label) {
						label.closest('.form-control').removeClass('error');
						label.remove();
					}
				});
			});
		</script>
</jsp:attribute>
</t:admin_layout>
