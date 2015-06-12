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
                            Lịch học
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                  <a
								href="${pageContext.request.contextPath }/nhanvien/index">Chuyên đề</a>
                            </li>
                            <li>
                                   <a
								href="${pageContext.request.contextPath }/nhanvien/courses/${subject}">Khóa học</a>
                            </li>
                            <li class="active">
                                 Trang hiện tại
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                	<div class="col-md-7">
                		<a class="btn btn-default"
							href="${pageContext.request.contextPath}/nhanvien/addschedule/${subject}">Thêm lịch học</a>
                		<table class="table">
                		<thead>
                			<tr>
                				<th>Buổi</th>
								<th>Thời gian học</th>
								<th>Phòng</th>
								<th></th>
								<th></th>
                			</tr>
                		</thead>
                		<c:forEach items="${lst }" var="item">
							<tr>
								<td>
									${item.id.getBuoiHoc() }
								</td>
								<td>
									${item.thoiGianHoc }
								</td>
								<td>
									${item.phongHoc }
								</td>
								<td>
									<a class="btn btn-default" href="${pageContext.request.contextPath }/nhanvien/editschedule?kh=${item.id.idKhoaHoc}&bh=${item.id.buoiHoc}" >Chỉnh sửa</a>
								</td>
								<td>
									<form method="POST" id="formDelSchedule_${item.id.buoiHoc }_${item.id.idKhoaHoc }]" action="${pageContext.request.contextPath }/nhanvien/delschedule">
										<input type="hidden" name="khoaHoc" value="${item.id.idKhoaHoc }" />
										<input type="hidden" name="buoiHoc" value="${item.id.buoiHoc }" />
										<input class="btn btn-default" type="submit" onClick="return confirm('Bạn chắc chắn muốn xóa!')" value="Xóa" />
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
