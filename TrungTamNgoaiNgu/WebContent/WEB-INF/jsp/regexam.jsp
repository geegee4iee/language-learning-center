<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                		<table class="table">
                		<thead>
                			<tr>
                				<th>Khóa học</th>
								<th>Học viên</th>
								<th>Số điện thoại</th>
								<th></th>
                			</tr>
                		</thead>
                		<c:forEach items="${lst }" var="item">
							<tr>
								<td>
									${item.kyThi.id } - ${item.kyThi.ten }
								</td>
								<td>
									${item.hocVien.id } - ${item.hocVien.hoTen }
								</td>
								<td>
									${item.hocVien.soDienThoai }
								</td>
								<td>
									<form
											action="${pageContext.request.contextPath }/quantri/dangkythi"
											method="POST">
										<input type="hidden" name="kyThi" value="${item.kyThi.id }" />
										<input type="hidden" name="hocVien"
												value="${item.hocVien.id }" />
										<button
												onClick="return confirm('Bạn có chắc chắn muốn đăng ký cho học viên này?')"
												class="btn btn-primary">Đăng ký</button>
									</form>
								</td>
							</tr>               		
                		</c:forEach>
                	</table>
                	</div>
                	
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
	
	
	</jsp:attribute>
</t:admin_layout>
