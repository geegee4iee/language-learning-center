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
							Thêm lịch học
                        </h1>
                        <ol class="breadcrumb">
                           <li>
                                  <a
								href="${pageContext.request.contextPath }/nhanvien/index">Chuyên đề</a>
                            </li>
                            <li>
                                  <a
								href="#">...</a>
                            </li>
                            <li>
                                   <a
								href="${pageContext.request.contextPath }/nhanvien/courses/${obj.khoaHoc}">Lịch học</a>
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
							action="${pageContext.request.contextPath}/nhanvien/addschedule" id="addSchedule">
						<div class="form-group">
							<label>Buổi học</label>
							<f:input class="form-control" path="buoiHoc" />						
						</div>
						<f:input type="hidden" path="khoaHoc" />
						<div class="form-group">
							<label>Thời gian học</label>
							<f:input class="form-control datetimepicker" path="thoiGianHoc" />						
						</div>
						<div class="form-group">
							<label>Phòng học</label>
							<f:input class="form-control" path="phongHoc" />						
						</div>
						<input type="submit" class="btn btn-default" value="Thêm">
						<a class="btn btn-default"
								href="${pageContext.request.contextPath}/nhanvien/schedule/${obj.khoaHoc}">Trở lại</a>
					</f:form>
                	</div>
                	${status }
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
	
	
	</jsp:attribute>
	<jsp:attribute name="css">
		<link
			href="${pageContext.request.contextPath}/resources/css/bootstrap-datetimepicker.min.css"
			rel="stylesheet" type="text/css" />
</jsp:attribute>
	<jsp:attribute name="js">
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js">
		</script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/moment.js"></script>
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/bootstrap-datetimepicker.min.js"></script>
		<script>
			$(function() {
				$('.datetimepicker').datetimepicker({
					format: 'MM/DD/YYYY hh:mm A'
					
					});
			});
			
			 //Validator Jquery
	        $(function () {
	            $('#addSchedule').validate({
	                rules: {
	                    buoiHoc: {
	                        required: true,
	                        min:1,
	                        max:100
	                    },
	                    thoiGianHoc: {
	                        required: true,
	                    },
	                    phongHoc: {
	                        required: true,
	                    }
	                },
	                messages: {
	                    buoiHoc: {
	                        required: 'Chưa nhập buổi học',
	                        min:'Buổi học không hợp lệ',
	                        max:'Buổi học không hợp lệ'
	                    },
	                    thoiGianHoc: {
	                        required: 'Chưa nhập thời gian học'
	                    },
						phongHoc: {
	                        required: 'Chưa nhập phòng học',
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
