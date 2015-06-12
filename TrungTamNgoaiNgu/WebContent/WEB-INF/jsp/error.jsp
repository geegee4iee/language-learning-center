<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<t:user_layout title="Trang chủ">
	<jsp:attribute name="content">



<div class="page-header" style="padding: 20px">
  <h1>${title } 
  <small>
  ${status}
  </small>
  </h1>
  <div class="row" style="padding: 20px">
  <a class="btn btn-default"
					href="${pageContext.request.contextPath}${linkBack}">${linkContent }</a>
  </div>
  <div>
  	tooi moi sua o day
  </div>
</div>





</jsp:attribute>
</t:user_layout>

