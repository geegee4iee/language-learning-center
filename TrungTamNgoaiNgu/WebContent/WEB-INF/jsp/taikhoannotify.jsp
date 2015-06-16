<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<t:user_layout title="Danh sách khóa học">
	<jsp:attribute name="content">
		<div class="single_course_content">
			<div class="col-md-12 ">
				<h3 class="page-header">Thông báo</h3>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>    
						<th>Thời gian</th>
						<th>Nội dung</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${lstTb }" var="item">
						<tr>          
							<td> <fmt:formatDate pattern="hh:mm a" value="${item.id.thoiGian }" /></td>
							<td>${item.noiDung }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
             </div>
		
		
	</jsp:attribute>
</t:user_layout>