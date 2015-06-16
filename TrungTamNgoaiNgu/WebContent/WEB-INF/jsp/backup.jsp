<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<t:admin_layout title="Trang chủ">
	<jsp:attribute name="content">
		
        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Sao lưu phục hồi dữ liệu
                            <small>cho hệ thống</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <a
								href="${pageContext.request.contextPath }/quantri/backup">Sao lưu phục hồi</a>
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
                	<div class="jumbotron">
 					 	<form
							action="${pageContext.request.contextPath }/quantri/backup"
							method="POST">
                			<button class="btn btn-primary"
								onClick="return confirm('Bạn có chắc chắn muốn sao lưu?')">Sao lưu dữ liệu</button>
                		</form>
                		<p>Lần cập nhập gần nhất: ${modTime }</p>
					</div>
					<div class="jumbotron">
						<form
							action="${pageContext.request.contextPath }/quantri/restore"
							method="POST">
                			<button class="btn btn-warning"
								onClick="return confirm('Bạn có chắc chắn muốn phục hồi?')">Phục hồi dữ liệu</button>
                		</form>
                		<p>Lần phục hồi gần nhất: ${restoreTime }</p>
					</div>
                		
                		
                	</div>
                	${status }
                	
                	
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
			$('.datepicker').datepicker();
		</script>
</jsp:attribute>
</t:admin_layout>
