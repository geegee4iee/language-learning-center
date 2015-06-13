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
                            Danh sách đăng ký chưa thi
                            <small>${obj.ten }</small>
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
                	<div class="col-md-6">
                		<table class="table">
                		<thead>
                			<tr>
                				<th>Mã học viên</th>
								<th>Tên học viên</th>
                			</tr>
                		</thead>
                		<c:forEach items="${lst }" var="item">
							<tr>
								<td>
									${item.hocVien.id }
								</td>
								<td>
									${item.hocVien.hoTen }
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
