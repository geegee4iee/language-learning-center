<%@page import="utils.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<t:admin_layout title="Trang chủ">
	<jsp:attribute name="content">
		
        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Thống kê
                            <small>tình hình trung tâm</small>
                        </h1>
                    </div>
                </div>
                <!-- /.row -->
                <div class="row">
                	<div class="col-md-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<div class="panel-title">
									Thống kê học sinh trong từng năm
								</div>
							</div>
							<div class="panel-body">
								<div id="graph-by-year"></div>
							</div>
						</div>
						
						<div class="panel panel-red">
							<div class="panel-heading">
								<div class="panel-title">
									Thống kê học sinh trong từng khóa
								</div>
							</div>
							<div class="panel-body">
								<div id="graph-by-course"></div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="panel panel-info">
							<div class="panel-heading">
								<div class="panel-title">
									Thống kê học sinh trong từng chủ đề
								</div>
							</div>
							<div class="panel-body">
								<div id="graph-by-subject"></div>
							</div>
						</div>
                	</div>
                	<div class="col-md-6">
						<div class="panel panel-success">
							<div class="panel-heading">
								<div class="panel-title">
									Phân bố học viên trên các chuyên đề
								</div>
							</div>
							<div class="panel-body">
								<div id="graph-by-subject-donut"></div>
							</div>
						</div>
                	</div>
                	<c:forEach items="${byYear }" var="total"
						varStatus="loop">
                		<input type="hidden" id="by-year-${loop.index }"
							value="${total }" />
                	</c:forEach>
                	
                	<input id="by-course-total" value="${byCourse.size() }"
						type="hidden" />
                	<c:forEach varStatus="loop" items="${byCourse }"
						var="total">
						<input id="by-course-name-${loop.index }" value="${total.ten }"
							type="hidden" />
                		<input id="by-course-${loop.index }"
							value="${total.soLuong }" type="hidden" />
                	</c:forEach>
                	
                	<input id="by-subject-total"
						value="${bySubject.size() }" />
                	<c:forEach varStatus="loop" items="${bySubject }"
						var="total">
						<input id="by-subject-name-${loop.index }" value="${total.ten }"
							type="hidden" />
                		<input id="by-subject-${loop.index }"
							value="${total.soLuong }" type="hidden" />
                	</c:forEach>
                	
                	
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->
	
	
	</jsp:attribute>
	<jsp:attribute name="css">
		<link
			href="${pageContext.request.contextPath}/resources/css/morris.css"
			rel="stylesheet" type="text/css" />
	</jsp:attribute>
	<jsp:attribute name="js">
		<script
			src="${pageContext.request.contextPath }/resources/js/raphael-min.js">
			
		</script>
		<script
			src="${pageContext.request.contextPath}/resources/js/morris.js"></script>
		<script>
			var byYear = [];
			var byCourse = [];
			var bySubject = [];
			var bySubjectDonut = [];

			$(document).ready(function() {
				addByYear();
				addByCourse();
				addBySubject();
				addBySubjectDonut();
				Morris.Bar({
					element : 'graph-by-year',
					data : byYear,
					xkey : 'x',
					ykeys : [ 'y' ],
					labels : [ 'Số lượng học viên ' ]
				}).on('click', function(i, row) {
					console.log(i, row);
				});
				Morris.Bar({
					element : 'graph-by-course',
					data : byCourse,
					xkey : 'x',
					ykeys : [ 'y' ],
					labels : [ 'Số lượng học viên ' ],
					barColors : [ '#d9534f' ]
				}).on('click', function(i, row) {
					console.log(i, row);
				});
				Morris.Bar({
					element : 'graph-by-subject',
					data : bySubject,
					xkey : 'x',
					ykeys : [ 'y' ],
					labels : [ 'Số lượng học viên ' ],
					barColors : [ '#bce8f1' ]
				}).on('click', function(i, row) {
					console.log(i, row);
				});
				Morris.Donut({
					element : 'graph-by-subject-donut',
					data : bySubjectDonut,
					formatter : function(x) {
						return x + "%"
					}
				}).on('click', function(i, row) {
					console.log(i, row);
				});
			});

			function addByYear() {
				for (var i = 0; i < 6; i++) {
					var year = 2014 + i;
					byYear.push({
						x : "Khóa " + year,
						y : $('#by-year-' + i).val()
					});
				}
			};

			function addByCourse() {
				var size = $('#by-course-total').val();
				for (var i = 0; i < size; i++) {
					byCourse.push({
						x : $('#by-course-name-' + i).val(),
						y : $('#by-course-' + i).val()
					});
				}
			};

			function addBySubject() {
				var size = $('#by-subject-total').val();
				for (var i = 0; i < size; i++) {
					bySubject.push({
						x : $('#by-subject-name-' + i).val(),
						y : $('#by-subject-' + i).val()
					});
				}
			};

			function addBySubjectDonut() {
				var size = $('#by-subject-total').val();
				var totalStudents = 0;

				for (var i = 0; i < size; i++) {
					totalStudents += parseInt($('#by-subject-' + i).val());
				}

				var percents = 100 / totalStudents;

				for (var i = 0; i < size; i++) {
					bySubjectDonut.push({
						label : $('#by-subject-name-' + i).val(),
						value : $('#by-subject-' + i).val() * percents
					});
				}
			};
		</script>
	</jsp:attribute>

</t:admin_layout>
