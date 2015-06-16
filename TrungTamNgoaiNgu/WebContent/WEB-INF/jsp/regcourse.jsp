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
                            Quản lý đăng ký khóa học
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                 <a
								href="${pageContext.request.contextPath }/quantri/dangkykhoahoc">Đăng ký khóa học</a>
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
                		<table class="table">
                		<thead>
                			<tr>
                				<th>Khóa học</th>
								<th>Học viên</th>
								<th>Số điện thoại</th>
								<th></th>
								<th></th>
                			</tr>
                		</thead>
                		<c:forEach items="${lst }" var="item">
							<tr>
								<td>
									${item.khoaHoc.id } - ${item.khoaHoc.ten }
								</td>
								<td>
									${item.hocVien.id } - ${item.hocVien.hoTen }
								</td>
								<td>
									${item.hocVien.soDienThoai }
								</td>
								<td>
									<form
											action="${pageContext.request.contextPath }/quantri/dangkykhoahoc"
											method="POST">
										<input type="hidden" name="khoaHoc"
												value="${item.khoaHoc.id }" />
										<input type="hidden" name="hocVien"
												value="${item.hocVien.id }" />
										<button
												onClick="return confirm('Bạn có chắc chắn muốn đăng ký cho học viên này?')"
												class="btn btn-primary">Đăng ký</button>
									</form>
								</td>
								<td>
									<form
											action="${pageContext.request.contextPath }/quantri/xoadangkykhoahoc"
											method="post">
										<input type="hidden" name="idHocVien"
												value="${item.id.idHocVien }" />
										<input type="hidden" name="idKhoaHoc"
												value="${item.id.idKhoaHoc }" />
										<button class="btn btn-default"
												onClick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</button>
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
