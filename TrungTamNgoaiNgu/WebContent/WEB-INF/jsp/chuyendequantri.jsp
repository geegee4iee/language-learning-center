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
                            Quản lý chuyên đề
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                  <a
								href="${pageContext.request.contextPath }/quantri/chuyende">Chuyên đề</a>
                            </li>
                            <li class="active">
                                 Trang hiện tại
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                	<div class="col-md-10">
                		<a class="btn btn-default"
							href="${pageContext.request.contextPath}/quantri/themchuyende">Thêm chuyên đề</a>
                		<table class="table">
                		<thead>
                			<tr>
                				<th>Mã chuyên đề</th>
                				<th>Tên chuyên đề</th>
								<th>Nhân viên quản lý</th>
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
									${item.ten }
								</td>
								<td>
									${item.nhanVien.hoTen }
								</td>
								<td>
									<a class="btn btn-default"
										href="${pageContext.request.contextPath}/quantri/suachuyende/${item.id }">Chỉnh sửa</a>
								</td>
								<td>
									<form method="POST" action="${pageContext.request.contextPath }/quantri/xoachuyende">
										<input name="id" value="${item.id }" type="hidden" />
										<button class="btn btn-default">Xóa</button>
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
