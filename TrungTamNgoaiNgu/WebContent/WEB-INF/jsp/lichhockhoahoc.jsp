<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<t:user_layout title="Danh sách khóa học">
	<jsp:attribute name="content">
		<div class="single_course_content">
               <h2>${kh.ten }</h2>
               <p>Thời gian bắt đầu: <fmt:formatDate pattern="dd/MM/yyyy" value="${kh.ngayBatDau }" /></p>
               <p>Thời gian kết thúc: <fmt:formatDate pattern="dd/MM/yyyy" value="${kh.ngayKetThuc }" /></p>
               <table class="table table-striped course_table">
                <thead>
                  <tr>          
                    <th>Buổi học</th>
                    <th>Phòng học</th>
                    <th>Thời gian</th>
                  </tr>
                </thead>
                <tbody>
              		<c:forEach items="${lstLh }" var="item">
	                  <tr>          
	                    <td>Buổi ${item.id.buoiHoc }</td>
	                    <td>${item.phongHoc }</td>
	                    <td> <fmt:formatDate pattern="hh:mm a" value="${item.thoiGianHoc }" /></td>
	                  </tr>
                 	 </c:forEach>
                </tbody>
              </table>
             </div>
		
		
	</jsp:attribute>
</t:user_layout>