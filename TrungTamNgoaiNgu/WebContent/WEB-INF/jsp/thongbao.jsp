<%@page import="utils.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<t:admin_layout title="Trang chủ">
	<jsp:attribute name="content">
		
        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Thông báo
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                  <a
								href="${pageContext.request.contextPath }/nhanvien/index">Chuyên đề</a>
                            </li>
                            <li>
                                   <a
								href="${pageContext.request.contextPath }/nhanvien/courses/${subject}">Khóa học</a>
                            </li>
                            <li class="active">
                                 Trang hiện tại
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                	<div class="col-md-12">
						<form
							action="${pageContext.request.contextPath }/nhanvien/addthongbao"
							method="POST">
							<div class="form-group">
								<input name="khoaHoc" type="hidden" value="${subject }" />
								<textarea class="form-control" rows="5" name="noiDung"></textarea>
							</div>
							<button class="btn btn-default">Thêm thông báo</button>
						</form>	
							
							
                		<c:forEach items="${lst }" var="item">
							<div class="alert alert-info alert-dismissible" role="alert">
  								<a href="${pageContext.request.contextPath }/nhanvien/removethongbao?khoaHoc=${item.id.idKhoaHoc}&thoiGian=${item.id.thoiGian}" 
  								class="close" ><span aria-hidden="true">&times;</span></a>
  								<strong><fmt:formatDate pattern="dd/MM/yyyy hh:mm a" value="${item.id.thoiGian }" /></strong> 
  								${item.noiDung }
							</div>
                		</c:forEach>
                	</div>
                	
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
	
	
	</jsp:attribute>
</t:admin_layout>
