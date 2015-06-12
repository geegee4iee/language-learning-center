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
                	<div class="col-md-5">
                		<form
							action="${pageContext.request.contextPath }/quantri/backup"
							method="POST">
                			<button class="btn btn-primary"
								onClick="return confirm('Bạn có chắc chắn muốn sao lưu?')">Sao lưu dữ liệu</button>
                		</form>
                		<form
							action="${pageContext.request.contextPath }/quantri/restore"
							method="POST">
                			<button class="btn btn-warning"
								onClick="return confirm('Bạn có chắc chắn muốn phục hồi?')">Phục hồi dữ liệu</button>
                		</form>
                	</div>
                	${status }
                	Lần cập nhập gần nhất: ${modTime }
                	Lần phục hồi gần nhất: ${restoreTime }
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
