<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<t:user_layout title="Danh sách kỳ thi">
	<jsp:attribute name="content">
		<c:forEach items="${lstKtUn }" var="item">
			
			<div class="col-lg-6 col-md-6 col-sm-6">
                  <div class="single_course wow fadeInUp">
                    <div class="singCourse_imgarea">
                      <img src="${pageContext.request.contextPath }/resources/img/course-1.jpg" />
                      <div class="mask">                         
                        <a href="${pageContext.request.contextPath }/kythi/dangky/${item.id }" class="course_more">ĐĂNG KÝ</a>
                      </div>
                    </div>
                    <div class="singCourse_content">
                    <h3 class="singCourse_title"><a href="course-single.html">${item.ten }</a></h3>
                    <p class="singCourse_price"><span>Số lượng: ${item.soLuongDuThi }</span></p>
                    <p> Thời gian thi:  
                    	<fmt:formatDate pattern="dd/MM/yyyy" value="${item.thoiGianThi }" />
						
					</p>
					<p>
						Địa điểm: ${item.diaDiem }
					</p>
                    </div>
                  </div>
           </div>
			
		</c:forEach>
		
		
	</jsp:attribute>
</t:user_layout>