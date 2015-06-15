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
                            Quản lý kỳ thi
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                  <a
								href="${pageContext.request.contextPath }/quantri/kythi">Kỳ thi</a>
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
                	<a class="btn btn-default" href="${pageContext.request.contextPath }/quantri/themkythi">Thêm kỳ thi</a>
                	<h3>Kỳ thi đã diễn ra</h3>
                		<table class="table">
                		<thead>
                			<tr>
                				<th>Mã kỳ thi</th>
								<th>Tên</th>
								<th>Địa điểm</th>
								<th>Số lượng dự thi</th>
								<th>Thời gian thi</th>
								<th></th>
                			</tr>
                		</thead>
                		<c:forEach items="${lst }" var="item">
							<tr>
								<td>
									${item.id }
								</td>
								<td>
									<a href="${pageContext.request.contextPath }/quantri/kythi/${item.id}">
										${item.ten }
									</a>
								</td>
								<td>
									${item.diaDiem }
									
								</td>
								<td>
									${item.dangKyThis.size() }
								</td>
								<td>
									${item.thoiGianThi }
								</td>
								<td>	
								</td>
							</tr>               		
                		</c:forEach>
                	</table>
                	</div>
                	
                </div>
                
                 <div class="row">
                	<div class="col-md-12">
                	<h3>Kỳ thi chưa diễn ra</h3>
                		<table class="table">
                		<thead>
                			<tr>
                				<th>Mã kỳ thi</th>
								<th>Tên</th>
								<th>Địa điểm</th>
								<th>Số lượng dự thi</th>
								<th>Thời gian thi</th>
								<th></th>
                			</tr>
                		</thead>
                		<c:forEach items="${lstUn }" var="item">
							<tr>
								<td>
									${item.id }
								</td>
								<td>
									<a
										href="${pageContext.request.contextPath }/quantri/chuathi/${item.id}">
										${item.ten }
									</a>
								</td>
								<td>
									${item.diaDiem }
									
								</td>
								<td>
									${item.dangKyThis.size() }
								</td>
								<td>
									${item.thoiGianThi }
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
