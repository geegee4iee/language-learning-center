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
                	<div class="col-md-5">
                		<table class="table">
                		<thead>
                			<tr>
                				<th>Tên chuyên đề</th>
                				<th>Nhân viên hiện tại</th>
								<th>Đổi nhân viên quản lý
									</th>
                			</tr>
                		</thead>
                		<c:forEach items="${lst }" var="item">
							<tr>
								<td>
									${item.ten }
								</td>
								<td>${item.nhanVien.hoTen }</td>
								<td>
									<form method="POST"
											action="${pageContext.request.contextPath }/quantri/doichuyende"
											id="form-change-subject-${item.id }">
										<input name="nhanVien" value="${nhanVien }" type="hidden" />
										<input name="chuDe" value="${item.id }" type="hidden" />
										<button class="btn btn-default"
												onClick="return confirm('Bạn có chắc chắn muốn đổi')">Đổi nhân viên quản lý</button>
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
