<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" /> 

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- JS -->
        
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <!-- JavaScript-->
    <!-- <script src="../js/jquery-3.3.1.min.js"></script> -->
    <script src="${root }/js/bootstrap.bundle.min.js"></script>
    <script src="${root }/js/owl.carousel.min.js"></script>
    <script src="${root }/js/jquery.mousewheel.min.js"></script>
    <script src="${root }/js/jquery.mCustomScrollbar.min.js"></script>
    <script src="${root }/js/wNumb.js"></script>
    <script src="${root }/js/nouislider.min.js"></script>
    <script src="${root }/js/plyr.min.js"></script>
    <script src="${root }/js/jquery.morelines.min.js"></script>
    <script src="${root }/js/photoswipe.min.js"></script>
    <script src="${root }/js/photoswipe-ui-default.min.js"></script>
    <script src="${root }/js/main.js"></script>

    <!-- CSS -->
    <link rel="stylesheet" href="${root }/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="${root }/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="${root }/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${root }/css/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" href="${root }/css/nouislider.min.css">
    <link rel="stylesheet" href="${root }/css/ionicons.min.css">
    <link rel="stylesheet" href="${root }/css/plyr.css">
    <link rel="stylesheet" href="${root }/css/photoswipe.css">
    <link rel="stylesheet" href="${root }/css/default-skin.css">
    <link rel="stylesheet" href="${root }/css/main.css">
    <link rel="stylesheet" href="${root }/css/breadcrumb.css">

    <!-- autocomoplete library import -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600%7CUbuntu:300,400,500,700" rel="stylesheet"> 
    
    <!-- Favicons -->
    <link rel="icon" type="${root }/image/png" href="${root }/icon/favicon-32x32.png" sizes="32x32">
    <link rel="apple-touch-icon" href="${root }/icon/favicon-32x32.png">
    <link rel="apple-touch-icon" sizes="72x72" href="${root }/icon/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="${root }/icon/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="144x144" href="${root }/icon/apple-touch-icon-144x144.png">
    
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="Dmitry Volkov">
    <title>FlixGo</title>

</head>
<body class="body">
    
 <%-- <jsp:include page="${root }/menu/header.jsp" flush='false' /> --%>


    <!-- page title -->
    <section class="section section--first section--bg" data-bg="${root }/img/section/section.jpg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section__wrap">
                        <!-- section title -->
                        <h2 class="section__title"> 보관함</h2>
                        <!-- end section title -->

                        <!-- breadcrumb -->
                        <ul class="breadcrumb">
                            <li class="breadcrumb__item"><a href="#">Home</a></li>
                            <li class="breadcrumb__item breadcrumb__item--active">보관함</li>
                        </ul>
                        <!-- end breadcrumb -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end page title -->

    <!-- content -->
    <section class="content">
        <div class="content__head">
            <div class="container">
                <div class="row">
                    <div class="col-12">

                        <!-- content tabs nav -->
                        <ul class="nav nav-tabs content__tabs" id="content__tabs" role="tablist">
                        

                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tab-1" role="tab" aria-controls="tab-1" aria-selected="true">보고싶은 영화</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2" aria-selected="false">좋아하는 영화</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tab-3" role="tab" aria-controls="tab-3" aria-selected="false">좋아하는 감독</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tab-4" role="tab" aria-controls="tab-4" aria-selected="false">좋아하는 배우</a>
                            </li>

                        </ul>
                        <!-- end content tabs nav -->

                        <!-- content mobile tabs nav -->
                        <div class="content__mobile-tabs" id="content__mobile-tabs">
                            <div class="content__mobile-tabs-btn dropdown-toggle" role="navigation" id="mobile-tabs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <input type="button" value="New items">
                                <span></span>
                            </div>

                            <div class="content__mobile-tabs-menu dropdown-menu" aria-labelledby="mobile-tabs">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item"><a class="nav-link active" id="1-tab" data-toggle="tab" href="#tab-1" role="tab" aria-controls="tab-1" aria-selected="true">NEW RELEASES</a></li>

                                    <li class="nav-item"><a class="nav-link" id="2-tab" data-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2" aria-selected="false">MOVIES</a></li>

                                    <li class="nav-item"><a class="nav-link" id="3-tab" data-toggle="tab" href="#tab-3" role="tab" aria-controls="tab-3" aria-selected="false">TV SERIES</a></li>

                                    <li class="nav-item"><a class="nav-link" id="4-tab" data-toggle="tab" href="#tab-4" role="tab" aria-controls="tab-4" aria-selected="false">CARTOONS</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- end content mobile tabs nav -->
                    </div>
                </div>
            </div>
        </div>




        <div class="container">
            <!-- content tabs -->
            <div class="tab-content" id="myTabContent">
            
                <!-- ▶▶▶▶▶TAB-1 Filmwish◀◀◀◀◀ 12개 -->
                <div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="1-tab">
                    <div class="row">
                    
                        <!-- card -->
                        <c:forEach var="filmwishlist" items = "${filmwishlist }">
                        <div class="col-6 col-sm-4 col-lg-3 col-xl-2">
                            <div class="card">
                                <div class="card__cover">
                                    <img src="${root }/film/poster/${filmwishlist.poster}" alt="">
                                    <a href="${root }/film/read_customer.do?filmno=${filmwishlist.filmno}" class="card__play">
                                        <i class="icon ion-ios-play"></i>
                                    </a>
                                </div>
                                <div class="card__content">
                                    <h3 class="card__title" style="display: inline-block;">
                                        <a href="#" >
                                            ${filmwishlist.titlekr} <br> ${filmwishlist.titleen}
                                        </a>
                                    </h3>
                                    <h3 class="card__title" style="display: inline-block;">
	                                    <span class="card__rate" >
	                                       <i class="icon ion-ios-close"></i>
	                                    </span>
                                    </h3>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        <!-- end card -->
                 
                    </div>
                </div>

                <!-- ▶▶▶▶▶TAB-2 Actorfav ◀◀◀◀◀ 12개 -->
                <div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="2-tab">
                    <div class="row">
                    
                        <!-- card -->
                        <c:forEach var="filmfavlist" items = "${filmfavlist }">
                        <div class="col-6 col-sm-4 col-lg-3 col-xl-2">
                            <div class="card">
                                <div class="card__cover">
                                    <img src="${root }/film/poster/${filmfavlist.poster}" alt="">
                                    <a href="${root }/film/read_customer.do?filmno=${filmfavlist.filmno}" class="card__play">
                                        <i class="icon ion-ios-play"></i>
                                    </a>
                                </div>
                                <div class="card__content">
                                    <h3 class="card__title">
                                        <a href="#">
                                            ${filmfavlist.titlekr} <br> ${filmfavlist.titleen}
                                        </a>
                                    </h3>
                                    <span class="card__category">
                                        <a href="#">Action</a>
                                        <a href="#">Triler</a>
                                    </span>
                                    <span class="card__rate"><i class="icon ion-ios-star"></i>${filmfavlist.hit}</span>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        <!-- end card -->
                        
                        
                        
                    </div>
                </div>


                <!-- ▶▶▶▶▶TAB-3 Directorfav◀◀◀◀◀ 12개 -->
                <div class="tab-pane fade" id="tab-3" role="tabpanel" aria-labelledby="3-tab">
                    <div class="row">
                    
                        <!-- card -->
                        <c:forEach var="directorfavlist" items = "${directorfavlist }">
                        <div class="col-6 col-sm-4 col-lg-3 col-xl-2">
                            <div class="card">
                                <div class="card__cover">
                                    <img src="${root }/director/prof/${directorfavlist.dirphoto}" alt="">
                                    <a href="${root }/director/read.do?dirno=${directorfavlist.dirno}"  class="card__play">
                                        <i class="icon ion-ios-play"></i>
                                    </a>
                                </div>
                                <div class="card__content">
                                    <h3 class="card__title">
                                        <a href="#">
                                            ${directorfavlist.dirnamekr} <br> ${directorfavlist.dirnameen}
                                        </a>
                                    </h3>
                                  <span class="card__rate"><i class="icon ion-ios-heart"></i>52</span>           
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        <!-- end card -->
                    </div>
                </div>
                
                
                <!-- ▶▶▶▶▶TAB-4 ◀◀◀◀◀ 12개 -->

                <div class="tab-pane fade" id="tab-4" role="tabpanel" aria-labelledby="4-tab">
                    <div class="row">
                        <!-- card -->
                        <c:forEach var="actorfavlist" items = "${actorfavlist }">
                        <div class="col-6 col-sm-4 col-lg-3 col-xl-2">
                            <div class="card">
                                <div class="card__cover">
                                    <img src="${root }/actor/prof/${actorfavlist.actorpic}" alt="">
                                    <a href="${root }/actor/read.do?actorno=${actorfavlist.actorno}"  class="card__play">
                                        <i class="icon ion-ios-play"></i>
                                    </a>
                                </div>
                                <div class="card__content">
                                    <h3 class="card__title">
                                        <a href="#">
                                            ${actorfavlist.actornamekr} <br> ${actorfavlist.actornameen}
                                        </a>
                                    </h3>                           
                                  <span class="card__rate"><i class="icon ion-ios-heart"></i>52</span>           
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        <!-- end card -->


                    </div>
                </div>
            </div>
            <!-- end content tabs -->
        </div>
    </section>
    <!-- end content -->

    <%-- <jsp:include page="${root }/menu/partner.jsp" flush='false' />
    <jsp:include page="${root }/menu/footer.jsp" flush='false' /> --%>


</body>

</html>