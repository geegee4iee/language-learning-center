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
                            Học viên ${obj.hocVien.hoTen }
                            <small>phản hồi</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <a
								href="${pageContext.request.contextPath }/bangiamdoc/phanhoi">Phản hồi</a>
                            </li>
                            <li class="active">
                                Phản hồi hiện tại
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                	<div class="col-md-12">
                		<h3>Thời gian <small><fmt:formatDate pattern="dd/MM/yyyy hh:mm a"
											value="${obj.id.thoiGian }" /></small></h3>
    								
    							
    							<h3>Nội dung</h3>
    							<p>${obj.noiDung }</p>
    							

                	</div>
                	
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
	
	
	</jsp:attribute>
</t:admin_layout>
