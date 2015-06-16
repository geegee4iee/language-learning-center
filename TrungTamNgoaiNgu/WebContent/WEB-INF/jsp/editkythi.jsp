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
							Chỉnh sửa
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                   <a
								href="${pageContext.request.contextPath }/quantri/kythi">Kỳ thi</a>
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
							action="${pageContext.request.contextPath}/quantri/suakythi" id="themKyThi">
						<div class="form-group">
							<label>Tên kỳ thi</label>
							<f:input type="hidden" path="id" />
							<f:input class="form-control" path="ten" />						
						</div>
						<div class="form-group">
							<label>Thời gian thi</label>
							<f:input class="form-control datetimepicker" path="thoiGianThi" />						
						</div>
						<div class="form-group">
							<label>Địa điểm</label>
							<f:input class="form-control" path="diaDiem" />						
						</div>
						<input type="submit" class="btn btn-default" value="Sửa">
						<a class="btn btn-default"
								href="${pageContext.request.contextPath}/quantri/kythi">Trở lại</a>
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
				$('.datetimepicker').datetimepicker();
			});
			
			 //Validator Jquery
	        $(function () {
	            $('#themKyThi').validate({
	                rules: {
	                    ten: {
	                        required: true,
	                    },
	                    thoiGianThi: {
	                        required: true,
	                    },
	                    diaDiem: {
	                        required: true,
	                    }
	                },
	                messages: {
	                    ten: {
	                        required: 'Chưa nhập tên kỳ thi',
	                    },
	                    thoiGianThi: {
	                        required: 'Chưa nhập thời gian thi'
	                    },
						diaDiem: {
	                        required: 'Chưa nhập địa điểm thi',
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
