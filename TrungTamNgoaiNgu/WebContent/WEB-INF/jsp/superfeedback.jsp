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
                            Phản hồi
                            <small>từ học viên</small>
                        </h1>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                	<div class="col-md-6">
                		<form
							id="form-guiphanhoi-${item.id.idHocVien }-${item.id.thoiGian }"
							method="POST"
							action="${pageContext.request.contextPath }/bangiamdoc/phanhoi">
							<label>Tháng muốn xem</label>
							<div class="form-inline">
								
								<input class="datepicker form-control" name="date" />
								<button class="btn btn-primary form-control">Xem</button>		
							</div>
								
								
							</form>
                	</div>
                	<div class="col-md-12">
							
                		<c:forEach items="${lst }" var="item">
                		<div class="list-group"
								style="float: left !important; margin-right: 20px">
							
                		 	<a
									href="${pageContext.request.contextPath }/bangiamdoc/xemphanhoi?thoiGian=<fmt:formatDate pattern="MM/dd/yyyy HH:mm:ss.SSS"
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
		<jsp:attribute name="css">
		<link
			href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker3.min.css"
			rel="stylesheet" type="text/css" />
</jsp:attribute>
	<jsp:attribute name="js">
		<script type="text/javascript"
			src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.min.js">
			
		</script>
		<script>
		$(".datepicker").datepicker( {
		    format: "mm yyyy",
		    viewMode: "months", 
		    minViewMode: "months"
		});
		</script>
</jsp:attribute>
</t:admin_layout>
