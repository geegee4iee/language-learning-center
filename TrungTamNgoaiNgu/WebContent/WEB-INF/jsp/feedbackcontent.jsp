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
                            Nội dung phản hồi
                            <small>từ học viên</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <a
								href="${pageContext.request.contextPath }/quantri/phanhoi">Phản hồi</a>
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
                		 	<a href="#" class="list-group-item">
    							<h4 class="list-group-item-heading">
    								<fmt:formatDate pattern="dd/MM/yyyy hh:mm a"
											value="${obj.id.thoiGian }" />
    							
    							</h4>
    							<h3>${obj.hocVien.hoTen }</h3>
    							<p>${obj.noiDung }</p>
    							
   							</a>

                	</div>
                	
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
	
	
	</jsp:attribute>
</t:admin_layout>
