<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
          
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600%7CUbuntu:300,400,500,700" rel="stylesheet"> 
    
    <!-- CSS -->
    <link rel="stylesheet" href="../css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="../css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" href="../css/nouislider.min.css">
    <link rel="stylesheet" href="../css/ionicons.min.css">
    <link rel="stylesheet" href="../css/plyr.css">
    <link rel="stylesheet" href="../css/photoswipe.css">
    <link rel="stylesheet" href="../css/default-skin.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/breadcrumb.css">
    
    <!-- Favicons -->
    <link rel="icon" type="image/png" href="icon/favicon-32x32.png" sizes="32x32">
    <link rel="apple-touch-icon" href="icon/favicon-32x32.png">
    <link rel="apple-touch-icon" sizes="72x72" href="icon/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="icon/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="144x144" href="icon/apple-touch-icon-144x144.png">
    
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="Dmitry Volkov">
    <title>FlixGo – Online Movies, TV Shows & Cinema HTML Template</title>

</head>
<body class="body">
<jsp:include page="/menu/header.jsp" flush='false' />
    
 

    <!-- page title -->
    <section class="section section--first section--bg" data-bg="img/section/section.jpg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section__wrap">
                        <!-- section title -->
                        <h2 class="section__title">FAQ</h2>
                        <!-- end section title -->

                        <!-- breadcrumb -->
                        <ul class="breadcrumb">
                            <li class="breadcrumb__item"><a href="#">Home</a></li>
                            <li class="breadcrumb__item breadcrumb__item--active">About Us</li>
                        </ul>
                        <!-- end breadcrumb -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end page title -->

    <!-- about -->
    <section class="section">
        <div class="container">
            <div class="row">
                <!-- section title -->
                <div class="col-12">
                    <h2 class="section__title"><b></b> </h2>
                </div>
                <!-- end section title -->
                      <c:forEach var="VO" items="${list }">  <!-- request 객체에 접근 -->
                        <c:set var="qcateno" value="${VO.qcateno}" />
		                <div class="col-12 col-md-6 col-lg-4">
		                    <div class="feature">
		                        <i class="icon ion-ios-${VO.qcateicon} feature__icon"></i>
		                        <h3 class="feature__title">${VO.qcatetitle }</h3>
		                        <p class="feature__text"></p>
		                    </div>
		                </div>
                      </c:forEach>
            </div>
        </div>
    </section>
    <!-- end about -->
    

	 <jsp:include page="/menu/partner.jsp" flush='false' />
	 <jsp:include page="/menu/footer.jsp" flush='false' />

    <!-- JS -->
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/jquery.mousewheel.min.js"></script>
    <script src="../js/jquery.mCustomScrollbar.min.js"></script>
    <script src="../js/wNumb.js"></script>
    <script src="../js/nouislider.min.js"></script>
    <script src="../js/plyr.min.js"></script>
    <script src="../js/jquery.morelines.min.js"></script>
    <script src="../js/photoswipe.min.js"></script>
    <script src="../js/photoswipe-ui-default.min.js"></script>
    <script src="../js/main.js"></script>
    
</body>

</html>