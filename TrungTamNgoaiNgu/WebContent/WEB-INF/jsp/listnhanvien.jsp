<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<t:admin_layout title="Trang chủ">
	<jsp:attribute name="content">
		
        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Quản lý nhân viên
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                  <a
								href="${pageContext.request.contextPath }/quantri/nhanvien">Nhân viên</a>
                            </li>
                            <li class="active">
                                 Danh sách nhân viên
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                	<div class="col-md-12">
                		<a class="btn btn-default"
							href="${pageContext.request.contextPath}/quantri/themnhanvien">Thêm nhân viên</a>
                		<table class="table">
                		<thead>
                			<tr>
                				<th>Mã nhân viên</th>
								<th>Tên</th>
								<th>Lương</th>
								<th>Chức vụ</th>
								<th>Tạo tài khoản</th>
								<th>Cập nhập lương</th>
								<th></th>
								<th></th>
                			</tr>
                		</thead>
                		<c:forEach items="${lst }" var="item">
							<tr>
								<td>
									${item.id }
								</td>
								<td>
									
									<a
										href="${pageContext.request.contextPath }/quantri/doichuyende/${item.id}">${item.hoTen }</a>
								</td>
								<td>
								<fmt:formatNumber type="currency" value="${item.luong }"
											minFractionDigits="0" currencySymbol="đ" />
									
								</td>
								<td>
									${item.vaiTro.ten }
								</td>
								<td>	
									
										
									<c:choose>
									  <c:when test="${item.taiKhoan == null}">
									    <a class="btn btn-default"
													href="${pageContext.request.contextPath }/quantri/themtaikhoan/${item.id}">Tạo tài khoản</a>
									  </c:when>
									  <c:otherwise>
									    <a href="#" class="btn btn-primary">Đã tạo tài khoản</a>
									  </c:otherwise>
									</c:choose>
								</td>
								<td>
									<form id="form-update-salary_${item.id }" class="form-inline"
											action="${pageContext.request.contextPath }/quantri/capnhapluong"
											method="POST">
										<input type="hidden" name="nhanVien" value="${item.id }" />
										<input class="form-control" name="luong" />
										<button class="btn btn-default"
												onClick="return confirm('Bạn có chắc chắn')">Cập nhập</button>
									</form>
								</td>
								<td>
									<a href="${pageContext.request.contextPath }/quantri/profile/${item.id}" class="btn btn-default">Sửa thông tin</a>
								</td>
								<td>
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
