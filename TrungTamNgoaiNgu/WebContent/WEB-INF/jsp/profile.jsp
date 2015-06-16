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
			$('.datepicker').datepicker();

		</script>
	</jsp:attribute>
	<jsp:attribute name="content">
		<ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#sectionA">Tài khoản</a></li>
        <li><a data-toggle="tab" href="#sectionB">Khóa học</a></li>
        <li><a data-toggle="tab" href="#sectionC">Kỳ thi</a></li>
        <li><a data-toggle="tab" href="#sectionD">Phản hồi</a></li>
        <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">Dropdown <b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li><a data-toggle="tab" href="#dropdown1">Dropdown1</a></li>
                <li><a data-toggle="tab" href="#dropdown2">Dropdown2</a></li>
            </ul>
        </li>
    </ul>
	<div class="tab-content">
	
		<!-- -----------------------------sectionA-------------------------------- -->
		
		<div id="sectionA" class="tab-pane fade in active">
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
		</div>
		<!-- -----------------------------END sectionA-------------------------------- -->
		
		<!-- -----------------------------sectionB-------------------------------- -->
		
		 <div id="sectionB" class="tab-pane fade">
		 	<div class="col-md-12 ">
				<h3 class="page-header">Thông tin khóa học</h3>
			</div>
		 	<table class="table table-hover">
		 		<thead>
			 		<tr>
			 			<th>Tên khóa học</th>
			 			<th>Ngày bắt đầu</th>
			 			<th>Ngày kết thúc</th>
			 			<th>Lịch học</th>
			 			<th>Thông báo</th>
			 		</tr>
		 		</thead>
		 		<tbody>
		 			<c:forEach items="${lstKh }" var="item">
		 				<tr>
			 				<td>${item.ten }</td>
			 				<td>${item.ngayBatDau }</td>
			 				<td>${item.ngayKetThuc }</td>
			 				<td>
			 					<a href="${pageContext.request.contextPath }/khoahoc/lichhoc/${item.id}" class="btn btn-default"> Chi tiết</a>
			 				</td>
			 				<td>
			 					<a href="${pageContext.request.contextPath }/account/notify/${item.id}" class="btn btn-default"> Xem</a>
			 				</td>
		 				</tr>
		 			</c:forEach>
		 			
		 		</tbody>
		 		
		 	</table>
		 
		 </div>
		 
		 <!-- -----------------------------END sectionB-------------------------------- -->
		 
		 <!-- -----------------------------sectionC-------------------------------- -->
		
		 <div id="sectionC" class="tab-pane fade">
		 
		 	<div class="col-md-12 ">
				<h3 class="page-header">Thông tin kỳ thi</h3>
			</div>
		 	<table class="table table-hover">
		 		<thead>
			 		<tr>
			 			<th>Tên kỳ thi</th>
			 			<th>Thời gian thi</th>
			 			<th>Địa điểm</th>
			 			
			 		</tr>
		 		</thead>
		 		<tbody>
		 			<c:forEach items="${lstKt }" var="item">
		 				<tr>
			 				<td>${item.ten }</td>
			 				<td>${item.thoiGianThi }</td>
			 				<td>${item.diaDiem }</td>
		 				</tr>
		 			</c:forEach>
		 			
		 		</tbody>
		 		
		 	</table>
		 
		 </div>
		 
		 <!-- -----------------------------END sectionB-------------------------------- -->
		 
		  <!-- -----------------------------sectionC-------------------------------- -->
		
		 <div id="sectionD" class="tab-pane fade">
		 
		 	<div class="col-md-12 ">
				<h3 class="page-header">Phản hồi</h3>
			</div>
			<form class="form-horizontal" id="frmFeedback" method="post" action="feedback">
				<div class="form-group">
					 <label for="noiDung" class="col-md-2 control-label">Nội dung</label>
					<div class="col-md-10">
						<input type="hidden" name="id" value="${objHv.id }"/>
						<textarea class="form-control" name="noiDung" id="noiDung">
						</textarea>
					</div>
				</div>	
				<div class="form-group">
				    <div class="col-md-offset-2 col-md-10">
			      		<button type="submit" class="btn btn-default">Gửi</button>
				    </div>
			  	</div>
			  	<div class="form-group">
				    <div class="col-md-offset-2 col-md-10">
			      		<h4>${param.statusFeedback }</h4>
				    </div>
			  	</div>
			</form>
			
		 </div>
		 
		 <!-- -----------------------------END sectionB-------------------------------- -->
	</div>
		
		
	</jsp:attribute>
</t:user_layout>