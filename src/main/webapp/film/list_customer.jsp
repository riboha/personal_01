<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" /> 

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- JS -->
    <script src="${root }/js/jquery-3.3.1.min.js"></script>
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
    
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600%7CUbuntu:300,400,500,700" rel="stylesheet"> 

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
    
    <script type="text/javascript">

    function search () {
      alert('search');
    }

    </script>

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
                        <h2 class="section__title">영화</h2>
                        <!-- end section title -->

                        <!-- breadcrumb -->
                        <ul class="breadcrumb">
                            <li class="breadcrumb__item"><a href="${root }/index.do">Home</a></li>
                            <li class="breadcrumb__item breadcrumb__item--active">영화</li>
                        </ul>
                        <!-- end breadcrumb -->
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end page title -->

    <!-- filter -->
    <div class="filter">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="filter__content">
                        <div class="filter__items">
                        
                            <!-- filter item -->
                            <div class="filter__item" id="filter__genre">
                                <span class="filter__item-label">장르:</span>
                                <div class="filter__item-btn dropdown-toggle" role="navigation" id="filter-genre" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <input type="button" value="액션">
                                    <span></span>
                                </div>
                                <ul class="filter__item-menu dropdown-menu scrollbar-dropdown" aria-labelledby="filter-genre">
                                    <c:forEach var="list_genre" items="${list_genre }">
	                                    <li>${list_genre.genrename }</li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <!-- end filter item -->

                            <!-- filter item -->
                            <div class="filter__item" id="filter__quality">
                                <span class="filter__item-label">화질:</span>
                                <div class="filter__item-btn dropdown-toggle" role="navigation" id="filter-quality" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <input type="button" value="1440p">
                                    <span></span>
                                </div>
                                <ul class="filter__item-menu dropdown-menu scrollbar-dropdown" aria-labelledby="filter-quality">
                                    <li>1440p</li>
                                    <li>1024p</li>
                                    <li>720p</li>
                                    <li>560p</li>
                                </ul>
                            </div>
                            <!-- end filter item -->

                            <!-- filter item -->
                            <div class="filter__item" id="filter__quality">
                                <span class="filter__item-label">언어:</span>
                                <div class="filter__item-btn dropdown-toggle" role="navigation" id="filter-quality" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <input type="button" value="KR">
                                    <span></span>
                                </div>
                                <ul class="filter__item-menu dropdown-menu scrollbar-dropdown" aria-labelledby="filter-quality">
                                    <li>KR</li>
                                    <li>EN</li>
                                    <li>CH</li>
                                    <li>JP</li>
                                    <li>FR</li>
                                    <li>ES</li>
                                    <li>RS</li>
                                    <li>DE</li>
                                    <li>AR</li>
                                    <li>PT</li>
                                    <li>HI</li>
                                </ul>
                            </div>
                            <!-- end filter item -->
                            
                        </div>
                        <!-- filter btn -->
                        <button class="filter__btn" type="button" onclick="search();">검색</button>
                        <!-- end filter btn -->
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end filter -->

    <!-- catalog -->
    <div class="catalog">
        <div class="container">
            <div class="row">
            
            
                <!-- card -->
                <c:forEach var="list" items = "${list_paging_search }">
                <div class="col-6 col-sm-12 col-lg-6" >
                    <div class="card card--list">
                        <div class="row">
                            <div class="col-12 col-sm-4">
                                <div class="card__cover">
                                    <img src="./poster/${list.poster }" alt="">
                                    <a href="./read_customer.do?filmno=${list.filmno }" class="card__play">
                                        <i class="icon ion-ios-play"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="col-12 col-sm-8">
                                <div class="card__content">
                                    <h3 class="card__title" style="margin:1px;"><a href="./read_customer.do?filmno=${list.filmno }">${list.titlekr }<br>${list.titleen }</a></h3>
                                    <span class="card__category">
                                        <a href="#">Action</a>
                                        <a href="#">Triler</a>
                                    </span>

                                    <div class="card__wrap">
                                        <span class="card__rate"><i class="icon ion-ios-star"></i>8.4</span>

                                        <ul class="card__list">
                                            <li>HD</li>
                                            <li>${list.restrict }+</li>
                                        </ul>
                                    </div>

                                    <div class="card__description">
                                        <p> ${list.summary } </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <!-- end card -->

           
                <!-- paginator -->
                <div class="col-12">
                    <!--<ul class="paginator paginator--list">
                         <li class="paginator__item paginator__item--prev">
                            <a href="#"><i class="icon ion-ios-arrow-back"></i></a>
                        </li>
                        <li class="paginator__item"><a href="#">1</a></li>
                        <li class="paginator__item paginator__item--active"><a href="#">2</a></li>
                        <li class="paginator__item"><a href="#">3</a></li>
                        <li class="paginator__item"><a href="#">4</a></li>
                        <li class="paginator__item paginator__item--next">
                            <a href="#"><i class="icon ion-ios-arrow-forward"></i></a>
                        </li> 
                    </ul>-->
                    ${paging }
                </div>
                <!-- end paginator -->
                
                
                
            </div>
        </div>
    </div>
    <!-- end catalog -->


    <jsp:include page="../menu/partner.jsp" flush='false' />
    <jsp:include page="../menu/footer.jsp" flush='false' />
</body>

</html>
