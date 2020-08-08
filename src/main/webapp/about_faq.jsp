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
                        <h2 class="section__title">About Us</h2>
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
                    <h2 class="section__title"><b>FLIXGO</b> – Best Place for Movies</h2>
                </div>
                <!-- end section title -->

                <!-- section text -->
                <div class="col-12">
                    <p class="section__text">It is a long <b>established</b> fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using.</p>

                    <p class="section__text section__text--last-with-margin">'Content here, content here', making it look like <a href="#">readable</a> English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
                </div>
                <!-- end section text -->

                <!-- feature -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="feature">
                        <i class="icon ion-ios-tv feature__icon"></i>
                        <h3 class="feature__title">플릭스고란 무엇인가요?</h3>
                        <p class="feature__text">플릭스고는 다양한 콘텐츠를 다양한 기기에서 시청할 수 있는 스트리밍 서비스입니다. 플릭스고에서는 콘텐츠를 광고 없이 무제한으로 즐길 수 있습니다. </p>
                    </div>
                </div>
                <!-- end feature -->

                <!-- feature -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="feature">
                        <i class="icon ion-ios-film feature__icon"></i>
                        <h3 class="feature__title">어떤 콘텐츠가 있나요?</h3>
                        <p class="feature__text">10,000여건의 콘텐츠가 제공되며 새로운 TV 프로그램, 영화, 다큐멘터리가 매달 업데이트됩니다.</p>
                    </div>
                </div>
                <!-- end feature -->

                <!-- feature -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="feature">
                        <i class="icon ion-ios-search feature__icon"></i>
                        <h3 class="feature__title">추천 알고리즘 무엇인가요?</h3>
                        <p class="feature__text">전 세계 수천만명의 이용자의 시청기록을 토대로 한 알고리즘이 내 취향에 맞는 콘텐츠를 추천해줍니다.</p>
                    </div>
                </div>
                
                <!-- end feature -->

                <!-- feature -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="feature">
                        <i class="icon ion-ios-download feature__icon"></i>
                        <h3 class="feature__title">Notifications</h3>
                        <p class="feature__text">Various versions have evolved over the years, sometimes by accident, sometimes on purpose.</p>
                    </div>
                </div>
                <!-- end feature -->

                <!-- feature -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="feature">
                        <i class="icon ion-ios-globe feature__icon"></i>
                        <h3 class="feature__title">어떤 언어가 지원되나요? </h3>
                        <p class="feature__text">플릭스고 콘텐츠에는 설정에 따라 다양한 언어 자막과 더빙이 지원됩니다.</p>
                    </div>
                </div>
                <!-- end feature -->

                <!-- feature -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="feature">
                        <i class="icon ion-ios-chatbubbles feature__icon"></i>
                        <h3 class="feature__title">더 궁금한 사항이 있으세요?</h3>
                        <p class="feature__text"> 여기 <a href="../faq/list.do" class="section__text  a  section__text--last-with-margin a" style="color: #ff55a5;">자주 묻는 질문</a>을 모아두었어요.</p>
                    </div>
                </div>
                <!-- end feature -->

                
            </div>
        </div>
    </section>
    <!-- end about -->
    
    <ion-icon name="ellipsis-horizontal-outline"></ion-icon>

    <!-- how it works -->
    <section class="section section--dark">
        <div class="container">
            <div class="row">
                <!-- section title -->
                <div class="col-12">
                    <h2 class="section__title section__title--no-margin">How it works?</h2>
                </div>
                <!-- end section title -->

                <!-- how box -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="how">
                        <span class="how__number">01</span>
                        <h3 class="how__title">Create an account</h3>
                        <p class="how__text">It has never been an issue to find an old movie or TV show on the internet. However, this is not the case with the new releases.</p>
                    </div>
                </div>
                <!-- ebd how box -->

                <!-- how box -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="how">
                        <span class="how__number">02</span>
                        <h3 class="how__title">Choose your Plan</h3>
                        <p class="how__text">It has never been an issue to find an old movie or TV show on the internet. However, this is not the case with the new releases.</p>
                    </div>
                </div>
                <!-- ebd how box -->

                <!-- how box -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="how">
                        <span class="how__number">03</span>
                        <h3 class="how__title">Enjoy MovieGo</h3>
                        <p class="how__text">It has never been an issue to find an old movie or TV show on the internet. However, this is not the case with the new releases.</p>
                    </div>
                </div>
                <!-- ebd how box -->
            </div>
        </div>
    </section>
    <!-- end how it works -->

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