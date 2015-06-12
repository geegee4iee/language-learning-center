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
                            Quản lý khóa học
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                  <a
								href="${pageContext.request.contextPath }/nhanvien/index">Chuyên đề</a>
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
							href="${pageContext.request.contextPath}/nhanvien/addcourse/${subject}">Thêm khóa học</a>
                		<table class="table">
                		<thead>
                			<tr>
                				<th>Tên chuyên đề</th>
								<th></th>
								<th></th>
								<th></th>
                			</tr>
                		</thead>
                		<c:forEach items="${lst }" var="item">
							<tr>
								<td>
									${item.ten }
								</td>
								<td>
									<a class="btn btn-default"
										href="${pageContext.request.contextPath}/nhanvien/editcourse/${item.id }">Chỉnh sửa</a>
								</td>
								<td>
									<a href="${pageContext.request.contextPath}/nhanvien/schedule/${item.id }" class="btn btn-default">Xem lịch học</a>
								</td>
								<td>
								<a href="${pageContext.request.contextPath }/nhanvien/thongbao/${item.id}" class="btn btn-default" >Thông báo</a>
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
