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
                            Blank Page
                            <small>Subheading</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a
								href="index.html">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-file"></i> Blank Page
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                	<div class="col-md-5">
                		<f:form commandName="obj" method="POST"
							action="${pageContext.request.contextPath}/quantri/themnhanvien">
						<div class="form-group">
							<label>Tên nhân viên</label>
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
						<div class="form-group">
							<label>Giới tính</label>
							<f:select class="form-control" path="gioiTinh">
								<f:option value="Nam">Nam</f:option>
								<f:option value="Nữ">Nữ</f:option>
							</f:select>
						</div>
						<input type="submit" class="btn btn-default" value="Thêm">
						<a class="btn btn-default" href="${pageContext.request.contextPath}/quantri/nhanvien">Trở lại</a>
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
</t:admin_layout>
