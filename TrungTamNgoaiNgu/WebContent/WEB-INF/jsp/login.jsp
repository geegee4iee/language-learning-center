<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<t:user_layout title="Đăng nhập">
	<jsp:attribute name="content">
		<div class="container">
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-4">
					<f:form commandName="acc" method="POST" action="login">
						<div class="form-group">
							<label>Tài khoản</label>
							<f:input class="form-control" path="id" />						
						</div>
						<div class="form-group">
							<label>Mật khẩu</label>
							<f:input class="form-control" path="password" />						
						</div>
						<div class="checkbox">
						<label>
						</label>
						<f:input type="hidden" path="required" value="${required }"/>
						</div>
						<input type="submit" class="btn btn-default" value="Đăng nhập">
					</f:form>
				</div>
			</div>
		</div>	
		<div>
		${required }
		${login.id }
		${login.password }
		${login.permission }
		${login.remember }
		${status }
		</div>
		
	
</jsp:attribute>
</t:user_layout>

