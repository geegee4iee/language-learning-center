<%@tag import="model.SessionUserModel"%>
<%@tag import="model.LoginModel"%>
<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@attribute name="title" required="true"%>
<%@attribute name="content" fragment="true"%>
<%@ attribute name="css" fragment="true" required="false"%>
<%@ attribute name="js" fragment="true" required="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
     <title>${title }</title>

    <!-- Mobile Specific Metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/icon" href="img/wpf-favicon.png"/>
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
		#courseArchive{
			padding: 100px 0px;
		}
	</style>
    <!-- Google fonts -->
    <link href='http://fonts.googleapis.com/css?family=Merriweather' rel='stylesheet' type='text/css'>   
    <link href='http://fonts.googleapis.com/css?family=Varela' rel='stylesheet' type='text/css'>    

	<jsp:invoke fragment="css"></jsp:invoke>
</head>
<body>
	<%-- <nav class="navbar navbar-default">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Trang chủ</a>
			</div>
			<p class="navbar-text">
				<a href="${pageContext.request.contextPath}/account/login"
					class="navbar-link">Đăng nhập</a>
			</p>
			<p class="navbar-text">
				<a href="${pageContext.request.contextPath}/account/register"
					class="navbar-link">Đăng ký</a>
			</p>
			<p class="navbar-text">
				<a href="${pageContext.request.contextPath}/account/logout"
					class="navbar-link">Thoát</a>
			</p>
			<p class="navbar-text">
				<a href="${pageContext.request.contextPath}/khoahoc/list"
					class="navbar-link">Khóa học</a>
			</p>
			<p class="navbar-text">
				<a href="${pageContext.request.contextPath}/kythi/list"
					class="navbar-link">Chương trình thi</a>
			</p>
			<p class="navbar-text">
				<%
					if (session.getAttribute("acc") != null) {
						SessionUserModel log = (SessionUserModel) session.getAttribute("acc");
						out.print("Xin chào " + log.getName());
					}
				%>
			</p>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<form class="navbar-form navbar-left " role="search">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Search">
					</div>
					<button type="submit" class="btn btn-default">Tìm kiếm</button>
				</form>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav> --%>
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
                <li><a href="${pageContext.request.contextPath }/account/login">ĐĂNG NHẬP</a></li>
                <li><a href="${pageContext.request.contextPath }/account/register">ĐĂNG KÝ</a></li>
              </ul>
           
            </div><!--/.nav-collapse -->
            
			<form class="navbar-form navbar-right " role="search">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form>
          </div>     
        </nav>  
      </div>
      <!-- END MENU -->    
    </header>
    <!--=========== END HEADER SECTION ================--> 

    
    <!--=========== BEGIN COURSE BANNER SECTION ================-->
    <section id="courseArchive">
      <div class="container">
        <div class="row">
          
          <!-- start course archive sidebar -->
          <div class="col-lg-3 col-md-3 col-sm-3">
            <div class="courseArchive_sidebar">
              <!-- start single sidebar -->
             
              <!-- End single sidebar -->
              <!-- start single sidebar -->
				
              <div class="single_sidebar">
                <h2>Category <span class="fa fa-angle-double-right"></span></h2>
				<ul class="list-group">
					<c:forEach items="${lstCd }" var="item">
						<li class="list-group-item"><a href="${pageContext.request.contextPath }/khoahoc/danhsach/${item.id }">${item.ten }</a></li>
					</c:forEach>
				</ul>
              </div>
              <!-- End single sidebar -->
              <!-- start single sidebar -->
              
              <!-- End single sidebar -->
              <!-- start single sidebar -->
             
			 
              <!-- End single sidebar -->
            </div>
          </div>
          <!-- start course archive sidebar -->
		  
		  <!-- start course content -->
          <div class="col-lg-9 col-md-9 col-sm-9">
            <div class="courseArchive_content">
              <!-- start blog archive  -->
              <div class="row">
                <!-- start single blog -->
                
					 <!-- code content-->
                    <jsp:invoke fragment="content"></jsp:invoke>
                                  
                </div>
                <!-- End single blog -->                
              </div>
              <!-- end blog archive  -->                       
            </div>
          </div>
          <!-- End course content -->

       
      </div>
    </section>
    <!--=========== END COURSE BANNER SECTION ================-->
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
	<jsp:invoke fragment="js"></jsp:invoke>
	
</body>
</html>
