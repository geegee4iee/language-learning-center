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
                            Thông tin cá nhân
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                 Trang hiện tại
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                	<div class="col-md-5">
                		<form>
                			<div class="form-group">
                				<label>Mã nhân viên</label>
                				<input class="form-control" readonly
									value="${staffInfo.id }" />
                			</div>
                			<div class="form-group">
                				<label>Họ tên</label>
                				<input class="form-control" readonly
									value="${staffInfo.hoTen }" />
                			</div>
                			<div class="form-group">
                				<label>Địa chỉ</label>
                				<input class="form-control" readonly
									value="${staffInfo.diaChi }" />
                			</div>
                			<div class="form-group">
                				<label>Số điện thoại</label>
                				<input class="form-control" readonly
									value="${staffInfo.soDienThoai }" />
                			</div>
                		</form>
                		<hr>
                		<f:form commandName="staffAcc" method="POST"
							action="${pageContext.request.contextPath}/profile/doimatkhau"
							id="changePwd">
						<div class="form-group">
							<label>Tên tài khoản</label>
							<f:input class="form-control" path="id" readonly="true" />						
						</div>
						<div class="form-group">
							<label>Mật khẩu</label>
							<f:input class="form-control" type="password" path="password" name="password" />						
						</div>
						<div class="form-group">
							<label>Mật khẩu mới</label>
							<f:input class="form-control" type="password" path="passwordNew"
									name="passwordNew" id="passwordNew" />						
						</div>
						<div class="form-group">
							<label>Nhập lại mật khẩu mới</label>
							<input class="form-control" type="password" name="passwordNewRepeat" />
						</div>
						<input type="submit" class="btn btn-default" value="Đổi mật khẩu">
					</f:form>
                	</div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
	
	
	</jsp:attribute>
	<jsp:attribute name="css">
		
	</jsp:attribute>
	<jsp:attribute name="js">
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js">
			
		</script>
		<script>
			//Validator Jquery
			$(function() {
				$('#changePwd').validate({
					rules : {
						password : {
							required : true
						},
						passwordNew : {
							required : true,
							minlength : 6
						},
						passwordNewRepeat : {
							required : true,
							equalTo : "#passwordNew"
						}
					},
					messages : {
						password : {
							required : 'Chưa nhập mật khẩu cũ'
						},
						passwordNew : {
							required : 'Chưa nhập mật khẩu mới',
							minlength : 'Mật khẩu tối thiểu phải dài 6 ký tự'
						},
						passwordNewRepeat : {
							required : 'Chưa nhập lại mật khẩu mới',
							equalTo : 'Mật khẩu mới nhập lại không chính xác'
						}
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
