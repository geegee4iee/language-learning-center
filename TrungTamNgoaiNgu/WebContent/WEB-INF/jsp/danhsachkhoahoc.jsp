<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<t:user_layout title="Danh sách khóa học">
	<jsp:attribute name="content">
		<c:forEach items="${lstKh }" var="item">
			
			<div class="col-lg-6 col-md-6 col-sm-6">
                  <div class="single_course wow fadeInUp">
                    <div class="singCourse_imgarea">
                      <img src="${pageContext.request.contextPath }/resources/img/khoahoc/${item.id }.jpg" />
                      <div class="mask">                         
                        <a href="${pageContext.request.contextPath }/khoahoc/lichhoc/${item.id}" class="course_more">XEM KHÓA HỌC</a>
                      </div>
                    </div>
                    <div class="singCourse_content">
                    <h3 class="singCourse_title"><a href="course-single.html">${item.ten }</a></h3>
                    <p class="singCourse_price"><span>${item.chuDe.ten }</span></p>
                    <p> Khóa học bắt đầu từ 
                    	<fmt:formatDate pattern="dd/MM/yyyy" value="${item.ngayBatDau }" />
						và kết thúc vào ngày 
						<fmt:formatDate pattern="dd/MM/yyyy" value="${item.ngayKetThuc }" />
											
					</p>
                    </div>
                  </div>
           </div>
			
		</c:forEach>
		<c:forEach items="${lstKhUn }" var="item">
			
			<div class="col-lg-6 col-md-6 col-sm-6">
                  <div class="single_course wow fadeInUp">
                    <div class="singCourse_imgarea">
                      <img src="${pageContext.request.contextPath }/resources/img/khoahoc/${item.id }.jpg" />
                      <div class="mask">                         
                        <a href="${pageContext.request.contextPath }/khoahoc/lichhoc/${item.id}" class="course_more">XEM KHÓA HỌC</a>
                      </div>
                    </div>
                    <div class="singCourse_content">
                    <h3 class="singCourse_title"><a href="course-single.html">${item.ten }</a></h3>
                    <p class="singCourse_price"><span>${item.chuDe.ten }</span></p>
                    <p> Khóa học bắt đầu từ 
                    	<fmt:formatDate pattern="dd/MM/yyyy" value="${item.ngayBatDau }" />
						và kết thúc vào ngày 
						<fmt:formatDate pattern="dd/MM/yyyy" value="${item.ngayKetThuc }" />
											
					</p>
                    </div>
                  </div>
           </div>
			
		</c:forEach>
		
	</jsp:attribute>
</t:user_layout>