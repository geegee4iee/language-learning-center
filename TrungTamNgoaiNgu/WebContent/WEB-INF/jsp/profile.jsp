<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<t:user_layout title="Thông tin cá nhân">
	<jsp:attribute name="content">
		<h2>Thông tin tài khoản</h2>
		<f:form commandName="objPwd" method="POST" class="form-horizontal" action="changepwd">
			
			
			<div class="form-group">
				<label for="id" class="col-md-2 control-label">Tài khoản</label>
				<div class="col-md-6">
					${objPwd.id }
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
	<div>${status }</div>
	</jsp:attribute>
</t:user_layout>