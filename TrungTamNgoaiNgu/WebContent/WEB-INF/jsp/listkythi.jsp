<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<t:user_layout title="Trang chủ">
	<jsp:attribute name="content">


<div class="page-header">
  <h1>Example page header <small>Subtext for header</small>
			</h1>
</div>
<div class="container">
<div class="row">
<div class="col-md-1"></div>
<div class="col-md-10">
	<table class="table">
		<thead>
			<tr>
				<th>Tên</th>
				<th>Thời gian thi</th>
				<th>Địa điểm</th>
				<th></th>
			</tr>
		</thead>
		<c:forEach items="${lstKyThi }" var="item">
		<tr>
			<td>${item.ten }</td>
			<td>${item.thoiGianThi }</td>
			<td>${item.diaDiem }</td>
			<td><a
									href="${pageContext.request.contextPath }/kythi/dangky/${item.id }"
									class="btn btn-default">Đăng ký</a> </td>
		</tr>
	
	
</c:forEach>
	</table>
</div>
</div>
</div>


	




</jsp:attribute>
</t:user_layout>

