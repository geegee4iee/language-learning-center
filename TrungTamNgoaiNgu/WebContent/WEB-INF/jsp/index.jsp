<%@page import="model.SessionUserModel"%>
<%@page import="model.LoginModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!--=============================================== 
    Template Design By WpFreeware Team.
    Author URI : http://www.wpfreeware.com/
    ====================================================-->

    <!-- Basic Page Needs
    ================================================== -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>ENVN Center</title>

    <!-- Mobile Specific Metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/icon" href="${pageContext.request.contextPath }/resources/img/wpf-favicon.png"/>

    <!-- CSS
    ================================================== -->       
    <!-- Bootstrap css file-->
    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font awesome css file-->
	<link href="${pageContext.request.contextPath }/resources/css/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <!-- Superslide css file-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/users/superslides.css">
    <!-- Slick slider css file -->
    <link href="${pageContext.request.contextPath }/resources/css/users/slick.css" rel="stylesheet"> 
    <!-- Circle counter cdn css file -->
    <link rel='stylesheet prefetch' href='https://cdn.rawgit.com/pguso/jquery-plugin-circliful/master/css/jquery.circliful.css'>  
    <!-- smooth animate css file -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/users/animate.css"> 
    <!-- preloader -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/users/queryLoader.css" type="text/css" />
    <!-- gallery slider css -->
    <link type="text/css" media="all" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/users/jquery.tosrus.all.css" />    
    <!-- Default Theme css file -->
    <link id="switcher" href="${pageContext.request.contextPath }/resources/css/users/themes/default-theme.css" rel="stylesheet">
    <!-- Main structure css file -->
    <link href="${pageContext.request.contextPath }/resources/css/users/style.css" rel="stylesheet">
	<style>
		.navbar-form{
			padding-top:18px
		}
		#register {
			margin-left: 50px;
		}
	</style>
    <!-- Google fonts -->
    <link href='http://fonts.googleapis.com/css?family=Merriweather' rel='stylesheet' type='text/css'>   
    <link href='http://fonts.googleapis.com/css?family=Varela' rel='stylesheet' type='text/css'>    

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
 
  </head>
  <body>    

    <!-- SCROLL TOP BUTTON -->
    <a class="scrollToTop" href="#"></a>
    <!-- END SCROLL TOP BUTTON -->

    <!--=========== BEGIN HEADER SECTION ================-->
    <header id="header">
      <!-- BEGIN MENU -->
      <div class="menu_area">
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">  
		<div class="container">
            <div class="navbar-header">
              <!-- FOR MOBILE VIEW COLLAPSED BUTTON -->
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <!-- LOGO -->
              <!-- TEXT BASED LOGO -->
              <a class="navbar-brand" href="${pageContext.request.contextPath }/home/index">ENVN <span>Center</span></a>              
              <!-- IMG BASED LOGO  -->
               <!-- <a class="navbar-brand" href="index.html"><img src="img/logo.png" alt="logo"></a>  -->            
                     
            </div>
            <div id="navbar" class="navbar-collapse collapse navbar-left">
			
              <ul id="top-menu" class="nav navbar-nav  main-nav">
                <li class="active"><a href="${pageContext.request.contextPath }/home/index">TRANG CHỦ</a></li>
                <li><a href="${pageContext.request.contextPath }/khoahoc/danhsach">KHÓA HỌC</a></li>
                <li><a href="${pageContext.request.contextPath }/kythi/danhsach">KỲ THI</a></li>
              </ul>
           
            </div><!--/.nav-collapse -->
            
            <div id="register" class="navbar-collapse collapse navbar-left">
			
              <ul id="top-menu" class="nav navbar-nav  navbar-right">
                <%
								if (session.getAttribute("acc") != null) {
									SessionUserModel log = (SessionUserModel) session
											.getAttribute("acc");
							%>
							<li>
								<a href="${pageContext.request.contextPath}/account/profile">
									<%out.print("Xin chào " + log.getName());%>
								</a>
							</li>
							<li>
								<a href="${pageContext.request.contextPath}/account/logout">
									THOÁT
								</a>
							</li>		
									
							<%
								}else{
							%>
							
							<li><a href="${pageContext.request.contextPath}/account/register">ĐĂNG KÝ</a></li>

							<li><a href="${pageContext.request.contextPath}/account/login">ĐĂNG NHẬP</a></li>
							<%} %>
              </ul>
           
            </div><!--/.nav-collapse -->
            
			<form class="navbar-form navbar-right " role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Tìm kiếm</button>
			</form>
          </div>     
        </nav>  
      </div>
      <!-- END MENU -->    
    </header>
    <!--=========== END HEADER SECTION ================--> 

    <!--=========== BEGIN SLIDER SECTION ================-->
    <section id="slider">
      <div class="row">
        <div class="col-lg-12 col-md-12">
          <div class="slider_area">
            <!-- Start super slider -->
            <div id="slides">
              <ul class="slides-container">                          
                <li>
                  <img src="${pageContext.request.contextPath }/resources/img/slider/2.jpg" alt="img">
                   <div class="slider_caption">
                    <h2>Largest & Beautiful University</h2>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
                    <a class="slider_btn" href="#">Know More</a>
                  </div>
                  </li>
                <!-- Start single slider-->
                <li>
                  <img src="${pageContext.request.contextPath }/resources/img/slider/3.jpg" alt="img">
                   <div class="slider_caption slider_right_caption">
                    <h2>Better Education Environment</h2>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search</p>
                    <a class="slider_btn" href="#">Know More</a>
                  </div>
                </li>
                <!-- Start single slider-->
                <li>
                  <img src="${pageContext.request.contextPath }/resources/img/slider/4.jpg" alt="img">
                   <div class="slider_caption">
                    <h2>Find out you in better way</h2>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search</p>
                    <a class="slider_btn" href="#">Know More</a>
                  </div>
                </li>
              </ul>
              <nav class="slides-navigation">
                <a href="#" class="next"></a>
                <a href="#" class="prev"></a>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--=========== END SLIDER SECTION ================-->

    <!--=========== BEGIN ABOUT US SECTION ================-->
	
	<!--=========== END ABOUT US SECTION ================--> 

    <!--=========== BEGIN WHY US SECTION ================-->
    <section id="whyUs">
      <!-- Start why us top -->
      <div class="row">        
        <div class="col-lg-12 col-sm-12">
          <div class="whyus_top">
            <div class="container">
              <!-- Why us top titile -->
              <div class="row">
                <div class="col-lg-12 col-md-12"> 
                  <div class="title_area">
                    <h2 class="title_two">Why Us</h2>
                    <span></span> 
                  </div>
                </div>
              </div>
              <!-- End Why us top titile -->
              <!-- Start Why us top content  -->
              <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-3">
                  <div class="single_whyus_top wow fadeInUp">
                    <div class="whyus_icon">
                      <span class="fa fa-desktop"></span>
                    </div>
                    <h3>Technology</h3>
                    <p>when an unknown printer took a galley of type and scrambled it to make a type specimen book</p>
                  </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3">
                  <div class="single_whyus_top wow fadeInUp">
                    <div class="whyus_icon">
                      <span class="fa fa-users"></span>
                    </div>
                    <h3>Best Tutor</h3>
                    <p>when an unknown printer took a galley of type and scrambled it to make a type specimen book</p>
                  </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3">
                  <div class="single_whyus_top wow fadeInUp">
                    <div class="whyus_icon">
                      <span class="fa fa-flask"></span>
                    </div>
                    <h3>Practical Training</h3>
                    <p>when an unknown printer took a galley of type and scrambled it to make a type specimen book</p>
                  </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3">
                  <div class="single_whyus_top wow fadeInUp">
                    <div class="whyus_icon">
                      <span class="fa fa-support"></span>
                    </div>
                    <h3>Support</h3>
                    <p>when an unknown printer took a galley of type and scrambled it to make a type specimen book</p>
                  </div>
                </div>
              </div>
              <!-- End Why us top content  -->
            </div>
          </div>
        </div>        
      </div>
      <!-- End why us top -->

      <!-- Start why us bottom -->
	  
      <!-- End why us bottom -->
    </section>
    <!--=========== END WHY US SECTION ================-->

    <!--=========== BEGIN OUR COURSES SECTION ================-->
    <section id="ourCourses">
      <div class="container">
       <!-- Our courses titile -->
        <div class="row">
          <div class="col-lg-12 col-md-12"> 
            <div class="title_area">
              <h2 class="title_two">Danh sách khóa học</h2>
              <span></span> 
            </div>
          </div>
        </div>
        <!-- End Our courses titile -->
        <!-- Start Our courses content -->
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="ourCourse_content">
              <ul class="course_nav">
              <c:forEach items="${lst }" var="item">
                <li>
                  <div class="single_course">
                    <div class="singCourse_imgarea">
                      <img src="${pageContext.request.contextPath }/resources/img/course-1.jpg" />
                      <div class="mask">                         
                        <a href="${pageContext.request.contextPath }/khoahoc/lichhoc/${item.id}" class="course_more">XEM KHÓA HỌC</a>
                      </div>
                    </div>
                    <div class="singCourse_content">
                    <h3 class="singCourse_title"><a href="course-single.html">${item.ten }</a></h3>
                    <p class="singCourse_price"><span>${item.chuDe.ten }</span></p>
                    <p> Khóa học bắt đầu từ 
                    	<fmt:formatDate pattern="dd/MM/yyyy" value="${item.ngayBatDau }" />
						và kết thúc vào ngày 
						<fmt:formatDate pattern="dd/MM/yyyy" value="${item.ngayKetThuc }" />
											
					</p>
                    </div>
                    
                  </div>
                </li>
                </c:forEach>
                </ul>
            </div>
          </div>
        </div>
        <!-- End Our courses content -->
      </div>
    </section>
    <!--=========== END OUR COURSES SECTION ================-->  

    <!--=========== BEGIN OUR TUTORS SECTION ================-->
    <section id="ourTutors">
      <div class="container">
       <!-- Our courses titile -->
        <div class="row">
          <div class="col-lg-12 col-md-12"> 
            <div class="title_area">
              <h2 class="title_two">NHỮNG HỌC VIÊN ĐIỂM CAO</h2>
              <span></span> 
            </div>
          </div>
        </div>
        <!-- End Our courses titile -->

        <!-- Start Our courses content -->
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="ourTutors_content">
              <!-- Start Tutors nav -->
              <ul class="tutors_nav">
              	<c:forEach items="${lstHs }" var="item">
	                <li>
	                  <div class="single_tutors">
	                    <div class="tutors_thumb">
	                      <img src="${pageContext.request.contextPath }/resources/img/course-1.jpg" />                      
	                    </div>
	                    <div class="singTutors_content">
	                      <h3 class="tutors_name">${item.hoTen }</h3>
	                      <span>${item.tenKyThi }</span>
	                      <p>Số điểm đạt được trong kỳ thi: ${item.diem }</p>
	                    </div>
	                    <div class="singTutors_social">
	                      <ul class="tutors_socnav">
	                        <li><a class="fa fa-facebook" href="#"></a></li>
	                        <li><a class="fa fa-twitter" href="#"></a></li>
	                        <li><a class="fa fa-instagram" href="#"></a></li>
	                        <li><a class="fa fa-google-plus" href="#"></a></li>
	                      </ul>
	                    </div>
	                  </div>
	                </li>
                </c:forEach>
                </ul>
            </div>
          </div>
        </div>
        <!-- End Our courses content -->
      </div>
    </section>
    <!--=========== END OUR TUTORS SECTION ================-->

    <!--=========== BEGIN STUDENTS TESTIMONIAL SECTION ================-->
    <section id="studentsTestimonial">
      <div class="container">
       <!-- Our courses titile -->
        <div class="row">
          <div class="col-lg-12 col-md-12"> 
            <div class="title_area">
              <h2 class="title_two">Học viên nói gì về Chúng tôi</h2>
              <span></span> 
            </div>
          </div>
        </div>
        <!-- End Our courses titile -->

        <!-- Start Our courses content -->
        <div class="row">
          <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="studentsTestimonial_content">              
              <div class="row">
                <!-- start single student testimonial -->
                <c:forEach items="${lstPh }" var="item">
	                <div class="col-lg-4 col-md-4 col-sm-4">
	                  <div class="single_stsTestimonial wow fadeInUp">
	                    <div class="stsTestimonial_msgbox">
	                      <p>${item.noiDung }</p>
	                    </div>
	                    <img class="stsTesti_img" src="${pageContext.request.contextPath }/resources/img/author.jpg" alt="img">
	                    <div class="stsTestimonial_content">
	                      <h3>${item.hocVien.hoTen }</h3>                      
	                      <span>Ex. Student</span>
	                      <p>Software Department</p>
	                    </div>
	                  </div>
	                </div>
                </c:forEach>
                <!-- End single student testimonial -->
               
              </div>
            </div>
          </div>
        </div>
        <!-- End Our courses content -->
      </div>
    </section>
    <!--=========== END STUDENTS TESTIMONIAL SECTION ================-->    
    
    <!--=========== BEGIN FOOTER SECTION ================-->
    <footer id="footer">
      <!-- Start footer top area -->
      <div class="footer_top">
        <div class="container">
          <div class="row">
            <div class="col-ld-3  col-md-3 col-sm-3">
              <div class="single_footer_widget">
                <h3>About Us</h3>
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
              </div>
            </div>
            <div class="col-ld-3  col-md-3 col-sm-3">
              <div class="single_footer_widget">
                <h3>Community</h3>
                <ul class="footer_widget_nav">
                  <li><a href="#">Our Tutors</a></li>
                  <li><a href="#">Our Students</a></li>
                  <li><a href="#">Our Team</a></li>
                  <li><a href="#">Forum</a></li>
                  <li><a href="#">News &amp; Media</a></li>
                </ul>
              </div>
            </div>
            <div class="col-ld-3  col-md-3 col-sm-3">
              <div class="single_footer_widget">
                <h3>Others</h3>
                <ul class="footer_widget_nav">
                  <li><a href="#">Link 1</a></li>
                  <li><a href="#">Link 2</a></li>
                  <li><a href="#">Link 3</a></li>
                  <li><a href="#">Link 4</a></li>
                  <li><a href="#">Link 5</a></li>
                </ul>
              </div>
            </div>
            <div class="col-ld-3  col-md-3 col-sm-3">
              <div class="single_footer_widget">
                <h3>Social Links</h3>
                <ul class="footer_social">
                  <li><a data-toggle="tooltip" data-placement="top" title="Facebook" class="soc_tooltip" href="#"><i class="fa fa-facebook"></i></a></li>
                  <li><a data-toggle="tooltip" data-placement="top" title="Twitter" class="soc_tooltip"  href="#"><i class="fa fa-twitter"></i></a></li>
                  <li><a data-toggle="tooltip" data-placement="top" title="Google+" class="soc_tooltip"  href="#"><i class="fa fa-google-plus"></i></a></li>
                  <li><a data-toggle="tooltip" data-placement="top" title="Linkedin" class="soc_tooltip"  href="#"><i class="fa fa-linkedin"></i></a></li>
                  <li><a data-toggle="tooltip" data-placement="top" title="Youtube" class="soc_tooltip"  href="#"><i class="fa fa-youtube"></i></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- End footer top area -->

      
    </footer>
    <!--=========== END FOOTER SECTION ================--> 

  

    <!-- Javascript Files
    ================================================== -->

    <!-- initialize jQuery Library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Preloader js file -->
    <script src="${pageContext.request.contextPath }/resources/js/users/queryloader2.min.js" type="text/javascript"></script>
    <!-- For smooth animatin  -->
    <script src="${pageContext.request.contextPath }/resources/js/users/wow.min.js"></script>  
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <!-- slick slider -->
    <script src="${pageContext.request.contextPath }/resources/js/users/slick.min.js"></script>
    <!-- superslides slider -->
    <script src="${pageContext.request.contextPath }/resources/js/users/jquery.easing.1.3.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/users/jquery.animate-enhanced.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/users/jquery.superslides.min.js" type="text/javascript" charset="utf-8"></script>   
    <!-- for circle counter -->
    <script src='https://cdn.rawgit.com/pguso/jquery-plugin-circliful/master/js/jquery.circliful.min.js'></script>
    <!-- Gallery slider -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/users/jquery.tosrus.min.all.js"></script>   
   
    <!-- Custom js-->
    <script src="${pageContext.request.contextPath }/resources/js/users/custom.js"></script>
    
   
    <!--=============================================== 
    Template Design By WpFreeware Team.
    Author URI : http://www.wpfreeware.com/
    ====================================================-->


  </body>
</html>