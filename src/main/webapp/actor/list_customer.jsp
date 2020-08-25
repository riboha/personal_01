<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" /> 


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
    <link rel="stylesheet" href="${root }/css/actor.css">

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

    $(function() {
      $('#search_actor').val('${search_actor}'); 
    });

    // 배우 검색
    function search () {
      var search_actor = $('#search_actor').val();
      if ( search_actor == null || $.trim(search_actor).length == 0 ) {
        alert('검색어를 입력해주세요');
        return;
      }
      location.href='list_customer.do?search_actor=' + search_actor + '&nowPage=';
    }



    </script>

</head>
<body class="body">
    
 <jsp:include page="../menu/header.jsp" flush='false' />


    <!-- page title -->
    <section class="section section--first section--bg" data-bg="${root }/img/section/section.jpg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section__wrap">
                        <!-- section title -->
                        <h2 class="section__title">배우 </h2>
                        <!-- end section title -->

                        <!-- breadcrumb -->
                        <ul class="breadcrumb">
                            <li class="breadcrumb__item"><a href="${root }/index.do">Home</a></li>
                            <li class="breadcrumb__item breadcrumb__item--active">배우</li>
                        </ul>
                        <!-- end breadcrumb -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end page title -->
    
    <!-- actor_search -->
    <div class="filter">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="actor__search-content">
                        <input type="text"  id ="search_actor"  name="search_actor" placeholder="여기서 좋아하는 배우를 검색해보세요!" >
                        <button type="button" onclick="search();">search</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- actor_search end-->
    
    <!-- catalog -->
    <div class="catalog">
        <div class="container">
            <div class="row">
                        <!-- card -->
                        <c:forEach var="list" items = "${actorVO_list }">
                        <div class="col-6 col-sm-4 col-lg-3 col-xl-2">
                            <div class="card">
                                <div class="card__cover">
                                    <img src="${root }/actor/prof/${list.actorpic}" alt="">
                                    <a href="${root }/actor/read.do?actorno=${list.actorno}"  class="card__play">
                                        <i class="icon ion-ios-play"></i>
                                    </a>
                                </div>
                                <div class="card__content">
                                    <h3 class="card__title">
                                        <a href="#">
                                            ${list.actornamekr} <br> ${list.actornameen}
                                        </a>
                                    </h3>                           
                                  <span class="card__rate"><i class="icon ion-ios-heart"></i>${list.actorhit}</span>           
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        <!-- end card -->
                        
                        <!-- paginator -->
		                <div class="col-12">
		                    ${paging }
		                </div>
		                <!-- end paginator -->

                    </div>
                </div>
            </div>
            <!-- end content tabs -->
    <!-- end content -->

    <%-- <jsp:include page="${root }/menu/partner.jsp" flush='false' />
    <jsp:include page="${root }/menu/footer.jsp" flush='false' /> --%>


</body>

</html>