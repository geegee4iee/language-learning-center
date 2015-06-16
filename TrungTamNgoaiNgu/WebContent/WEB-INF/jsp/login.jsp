<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>



<t:user_layout title="Đăng nhập">
	<jsp:attribute name="js">
	    <script src="${pageContext.request.contextPath }/resources/js/jquery.validate.min.js"></script>
	    <script type="text/javascript">
	        $(function () {
	            $('#acc').validate({
	                rules: {
	                	id: {
	                        required: true
	                    },
	                    password: {
	                        required: true
	                    },
	                },
	
	                messages: {
	                    id: {
	                        required: 'Chưa nhập tên đăng nhập'
	                    },
	                    password: {
	                        required: 'Chưa nhập mật khẩu'
	                    }
	                },
	            });
	            $('#id').focus();
	        });
	    </script>
	</jsp:attribute>
	
	<jsp:attribute name="content">
		<h2>Đăng nhập</h2>
		<f:form commandName="acc" method="POST" class="form-horizontal" action="login">
			<div class="form-group">
				<label for="id" class="col-md-2 control-label">Tài khoản</label>
				<div class="col-md-6">
					<f:input class="form-control" path="id"/>	
			 	</div>					
			</div>
			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">Mật khẩu</label>
				<div class="col-md-6">
					<f:input class="form-control" path="password" type="password"/>	
				</div>					
			</div>
			<div class="form-group">
				
					<div class="col-sm-offset-2 col-sm-10">
				   <f:checkbox path="remember" value="checked" label="Ghi nhớ" />
				   </div>
            </div>
			<div class="form-group">
			    <div class="col-sm-offset-2 col-sm-10">
		      		<input type="submit" class="btn btn-default" value="Đăng nhập">
			    </div>
					</div>
			
				<f:input type="hidden" path="required" value="${required }"/>
			
			
			
</f:form>
			
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

