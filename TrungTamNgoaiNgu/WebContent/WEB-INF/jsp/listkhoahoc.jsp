<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f" %>
<t:user_layout title="Trang chủ">
	<jsp:attribute name="content">

<div class="container">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-5">
			<f:form commandName="khoahoc" method="POST" action="list">
				<f:select path="id" items="${lst }">
				</f:select>
				
				<input type="submit" class="btn btn-default" value="Đăng nhập">
			</f:form>
		</div>
	</div>
</div>

<div class="page-header">
  <h1>Example page header <small>Subtext for header</small>
			</h1>
</div>

<c:forEach items="${fullList }" var="item">
	<div>
	${item.ten }
	</div>
	
</c:forEach>

<div class="jumbotron">
  <h1>Hello, world! </h1>
  <p>${status }</p>
  <p>
				<a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a>
			</p>
</div>
	




</jsp:attribute>
</t:user_layout>

