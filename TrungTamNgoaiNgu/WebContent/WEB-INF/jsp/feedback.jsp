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
                            Blank Page
                            <small>Subheading</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a
								href="index.html">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-file"></i> Blank Page
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                	<div class="col-md-12">
							
                		<c:forEach items="${lst }" var="item">
                		<div class="list-group"
								style="float: left !important; margin-right: 20px">
							<form
									id="form-xoaphanhoi-${item.id.idHocVien }-${item.id.thoiGian }"
									method="POST"
									action="${pageContext.request.contextPath }/quantri/xoaphanhoi">
								<input
										value="<fmt:formatDate pattern="MM/dd/yyyy HH:mm"
											value="${item.id.thoiGian }" />"
										name="thoiGian" type="hidden" />
								<input value="${item.id.idHocVien }" name="hocVien"
										type="hidden" />
								<button class="btn btn-primary form-control"
										onClick="return confirm('Bạn có chắc chắn muốn xóa!?')">Xóa phản hồi</button>
							</form>
                		 	<a
									href="${pageContext.request.contextPath }/quantri/xemphanhoi?thoiGian=<fmt:formatDate pattern="MM/dd/yyyy HH:mm:ss.SSS"
											value="${item.id.thoiGian }" />&hocVien=${item.id.idHocVien}"
									class="list-group-item">
    							<h4 class="list-group-item-heading">
    								<fmt:formatDate pattern="dd/MM/yyyy hh:mm a"
											value="${item.id.thoiGian }" />
    							
    							</h4>
    							<h3>${item.hocVien.hoTen }</h3>
    							
   							</a>
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
