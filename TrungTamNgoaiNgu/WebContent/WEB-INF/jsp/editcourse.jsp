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
                            Chỉnh sửa khóa học
                        </h1>
                       <ol class="breadcrumb">
                            <li>
                                <a
								href="${pageContext.request.contextPath }/nhanvien/index">Chuyên đề</a>
                            </li>
                            <li>
                                  <a
								href="${pageContext.request.contextPath }/nhanvien/courses/${linkback}">Khóa học</a>
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
							action="${pageContext.request.contextPath}/nhanvien/updatecourse" id="editCourse">
						<div class="form-group">
							<label>Tên khóa học</label>
							<f:input class="form-control" path="ten" name="ten" />						
						</div>
						<f:input type="hidden" path="id" />
						<div class="form-group">
							<label>Khóa</label>
							<f:input class="form-control" path="khoa" name="khoa" />						
						</div>
						<div class="form-group">
							<label>Ngày bắt đầu</label>
							<f:input class="form-control datepicker" path="ngayBatDau" name="ngayBatDau" />						
						</div>
						<div class="form-group">
							<label>Ngày kết thúc</label>
							<f:input class="form-control datepicker" path="ngayKetThuc" name="ngayKetThuc" />						
						</div>
						<input type="submit" class="btn btn-default" value="Cập nhập">
						<a class="btn btn-default"
								href="${pageContext.request.contextPath}/nhanvien/courses/${linkback}">Trở lại</a>
							<br/><br/>
						<div>${status }</div>
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
			$('.datepicker').datepicker();
			
		      //Validator custom date format for date of birth
	        $.validator.addMethod("vndate", function (value, element) {
	            return /^\d\d?\/\d\d?\/\d\d\d\d$/.test(value);
	        });
			
			 //Validator Jquery
	        $(function () {
	            $('#editCourse').validate({
	                rules: {
	                    ten: {
	                        required: true
	                    },
	                    khoa: {
	                        required: true,
	                        digits: true,
	                        min:2014,
	                        max:2024
	                    },
	                    ngayBatDau: {
	                        required: true,
	                        vndate: true
	                    },
	                    ngayKetThuc: {
	                        required: true,
	                        vndate: true
	                    }
	                },
	                messages: {
	                    ten: {
	                        required: 'Chưa nhập tên khóa học'
	                    },
	                    khoa: {
	                        required: 'Chưa nhập khóa',
	                        digits: 'Đây không phải là số',
	                        min:'Không hợp lệ',
	                        max:'Không hợp lệ'
	                    },
	                    ngayBatDau: {
	                        required: 'Chưa nhập ngày bắt đầu',
	                      	vndate:'Ngày nhập không đúng định dạng'
	                    },
	                    ngayKetThuc: {
	                        required: 'Chưa nhập ngày kết thúc',
	                        vndate:'Ngày nhập không đúng định dạng'
	                    }
	                },
	                errorElement: 'small',
	                errorClass: 'place-right fg-yellow error',
	                highlight: function (element) {
	                    $(element).closest('.form-control').addClass('error');
	                },
	                success: function (label) {
	                    label.closest('.form-control').removeClass('error');
	                    label.remove();
	                }
	            });
	        });

		</script>
</jsp:attribute>
</t:admin_layout>
