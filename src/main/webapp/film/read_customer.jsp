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


		// ▶ 장바구니에 담기
	    function cart () {

		    if ($('#optionlan').val() == null) {
			    alert('지원 언어를 선택해 주세요');
			}
		    alert('optionlan:' + $('#optionlan').val()); 
		    alert('optionqual:' + $('#optionqual').val().toString().trim()); 
		    alert('optionrent:' + $('#optionprice').val().split(':')[0].trim()); 
		    alert('optionprice:' + $('#optionprice').val().split(':')[1].slice(2,).trim()); 

		    var params = {'optionlan' : $('#optionlan').val(),
								'optionqual' : $('#optionqual').val().toString().trim(),
								'optionrent' : $('#optionprice').val().split(':')[0].trim(),
								'optionprice' : $('#optionprice').val().split(':')[1].slice(2,).trim(),
								'memberno' : 1,
								'filmno' : ${param.filmno}
								};

		    // return;
	        
	        $.ajax({
	            url : "../cart/create.do",
	            type : "post",
	            cache : false,
	            async : false,
	            dataType : "json",
	            data : params,
	            success : function(rdata) {
	                if (rdata.cnt >= 1) {
	                    alert('장바구니 등록 성공');
	                    window.location.reload();
	                } else {
	                    if (rdata.duplicate >= 1) {
	                      alert('이미 장바구니에 담긴 영화입니다');
	                    } else {
	                      alert('장바구니 등록 실패');
	                    }
	                }
	            },
	            error : function(request, status, error) {
	                var msg = 'ERROR<br><br>';
	                msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
	                msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
	                console.log(msg);
	            }
	        });
	    }
	    
		// ▶ 영화 결제창에 담기
	    function pay () {
	        var memberno = 1;
	        var datas= 'memberno='+ memberno + '&filmno=' + ${filmVO.filmno};
	        
	        $.ajax({
	            url : "../pay/create.do",
	            type : "post",
	            cache : false,
	            async : false,
	            dataType : "json",
	            data : datas,
	            success : function(rdata) {
	                if (rdata.cnt >= 1) {
	                    alert('결제창 등록 성공');
	                    window.location.reload();
	                } else {
	                    if (rdata.duplicate >= 1) {
	                      alert('이미 결제창에 담긴 영화입니다');
	                    } else {
	                      alert('결제창 등록 실패');
	                    }
	                }
	            },
	            error : function(request, status, error) {
	                var msg = 'ERROR<br><br>';
	                msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
	                msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
	                console.log(msg);
	            }
	        });
	    }

	 // ▶ 보고싶은 영화에 담기
      function wish () {

          var memberno = 1;
          var datas= 'memberno='+ memberno + '&filmno=' + ${filmVO.filmno};
          
          $.ajax({
              url : "../filmwish/create.do",
              type : "post",
              cache : false,
              async : false,
              dataType : "json",
              data : datas,
              // data : {'filmno': ${filmVO.filmno}, 'memberno': memberno},
              success : function(rdata) {
                  if (rdata.cnt >= 1) {
                      alert('보고싶은 영화 등록 성공');
                      window.location.reload();
                  } else {
                    if (rdata.duplicate >= 1) {
                      alert('이미 보고싶은 영화에 등록된 영화입니다');
                    } else {
                      alert('보고싶은 영화 등록 실패');
                    }
                  }
              },
              error : function(request, status, error) {
                alert('등록 실패');
                  var msg = 'ERROR<br><br>';
                  msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
                  msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
                  console.log(msg);
              }
          });
      }
      
      // ▶ 좋아하는 영화에 담기
      function fav () {

          var memberno = 1;
          var datas= 'memberno='+ memberno + '&filmno=' + ${filmVO.filmno};
          
          $.ajax({
              url : "../filmfav/create.do",
              type : "post",
              cache : false,
              async : false,
              dataType : "json",
              data : datas,
              success : function(rdata) {
                  if (rdata.cnt >= 1) {
                      alert('등록 성공');
                      window.location.reload();
                  } else {
                    if (rdata.duplicate >= 1) {
                      alert('이미 좋아하는 영화에 등록된 영화입니다');
                    } else {
                      alert('좋아하는 영화에 등록 실패');
                    }
                  }
              },
              error : function(request, status, error) {
                  var msg = 'ERROR<br><br>';
                  msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
                  msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
                  console.log(msg);
              }
          });
      }
      
      // ▶ 리뷰 등록
      function review_create () {

        var review_form = $('#review_form');
        var params = review_form.serialize();
        var rate = document.getElementById("form__slider-value").innerText; 
        params = params + '&rate='+rate;

          $.ajax({
              url : "../review/create.do",
              type : "post",
              cache : false,
              async : false,
              dataType : "json",
              data : params,
              success : function(rdata) {
                  if (rdata.cnt >= 1) {
                      alert('리뷰 등록 성공');
                      window.location.reload();
                  } else {
                    alert('리뷰 등록 실패');
                  }
              },
              error : function(request, status, error) {
                  var msg = 'ERROR<br><br>';
                  msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
                  msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
                  console.log(msg);
              }
          });
      }
      
  </script>

</head>
<body class="body">
    <jsp:include page="/menu/header.jsp" flush='false' />

    <!-- details -->
    <section class="section details">
        <!-- details background -->
        <div class="details__bg" data-bg="img/home/home__bg.jpg"></div>
        <!-- end details background -->
                

        <!-- details content -->
        <div class="container">
            <div class="row">
                <!-- title -->
                <div class="col-12">
                    <h1 class="details__title">${filmVO.titleen }</h1>
                    <h1 class="details__title">${filmVO.titlekr }</h1>
                <button class="" type="button" style="margin-left: 20px; font-size: 50px;" onclick="location.href='./read.do?filmno=${filmVO.filmno}'">
                    <i class="icon ion-ios-card"   ></i>
                </button>
                </div>
                <!-- end title -->

                <!-- content -->
                <div class="col-12 col-xl-6">
                    <div class="card card--details">
                        <div class="row">
                            <!-- card cover -->
                            <div class="col-12 col-sm-4 col-md-4 col-lg-3 col-xl-5">
                                <div class="card__cover">
                                    <img src="./poster/${filmVO.poster }" alt="">
                                </div>
                            </div>
                            <!-- end card cover -->

                            <!-- card content -->
                            <div class="col-12 col-sm-8 col-md-8 col-lg-9 col-xl-7">
                                <div class="card__content">
                                    <div class="card__wrap">
                                        <span class="card__rate"><i class="icon ion-ios-star"></i>8.4</span>
                                        <ul class="card__list">
                                            <li>${filmVO.restrict }+</li>
                                            <c:choose><c:when test="${qualityVO.q1440 == 1}"><li>1440p</li></c:when></c:choose>
                                            <c:choose><c:when test="${qualityVO.q1024 == 1}"><li>1024p</li></c:when></c:choose>
                                            <c:choose><c:when test="${qualityVO.q720 == 1}"><li>720p</li></c:when></c:choose>  
                                            <c:choose><c:when test="${qualityVO.q576 == 1}"><li>576p</li></c:when></c:choose>  
                                        </ul>
                                    </div>

                                    <ul class="card__meta">
                                        <li><span>장르:</span> 
                                            <c:forEach var="film_genre_VO_list" items="${film_genre_VO_list }">
                                                <a href="#">${film_genre_VO_list.genrename }</a>
                                            </c:forEach>
                                        </li>
                                        <li><span>감독:</span> <a href="#">${dirnamekr }</a></li>
                                        <li><span>출연:</span> 
                                            <c:forEach var="film_actor_VO_list" items="${film_actor_VO_list }">
                                                <a href="#">${film_actor_VO_list.actornamekr }</a>
                                            </c:forEach>
                                        </li>
                                        <li><span>개봉 년도:</span> ${filmVO.year }</li>
                                        <li><span>길이:</span> ${filmVO.len } min</li>
                                        <li><span>언어:</span> <a href="#">${filmVO.lan }</a> </li>
                                        <li>
                                            <span>지원 언어:</span> 
                                            <c:choose><c:when test="${languageVO.kr == 1}"><a href="#">KR</a> </c:when></c:choose>
                                            <c:choose><c:when test="${languageVO.en == 1}"><a href="#">EN</a> </c:when></c:choose>
                                            <c:choose><c:when test="${languageVO.ch == 1}"><a href="#">CH</a> </c:when></c:choose>
                                            <c:choose><c:when test="${languageVO.jp == 1}"><a href="#">JP</a> </c:when></c:choose>
                                            <c:choose><c:when test="${languageVO.es == 1}"><a href="#">ES</a> </c:when></c:choose>
                                            <c:choose><c:when test="${languageVO.fr == 1}"><a href="#">FR</a> </c:when></c:choose>
                                            <c:choose><c:when test="${languageVO.rs == 1}"><a href="#">RS</a> </c:when></c:choose>
                                            <c:choose><c:when test="${languageVO.de == 1}"><a href="#">DE</a> </c:when></c:choose>
                                            <c:choose><c:when test="${languageVO.pt == 1}"><a href="#">PT</a> </c:when></c:choose>
                                            <c:choose><c:when test="${languageVO.ar == 1}"><a href="#">AR</a> </c:when></c:choose>
                                            <c:choose><c:when test="${languageVO.hi == 1}"><a href="#">HI</a> </c:when></c:choose>
                                        </li>
                                    </ul>

                                    <div class="card__description card__description--details">
                                        ${filmVO.summary }
                                    </div>
                                </div>
                            </div>
                            <!-- end card content -->
                            
                        </div>
                    </div>
                </div>
                <!-- end content -->

                <!-- Youtube -->
                <div class="col-12 col-xl-6" Samesi>
                    ${filmVO.youtube}
                </div>
                <!-- end Youtube -->

                <div class="col-12">
                    <div class="details__wrap">
                        <!-- availables -->
                        <div class="details__devices">
                            <span class="details__devices-title"></span>
                            <ul class="details__devices-list">
                                <li><i class="icon ion-ios-add" id="btn_pay" onclick="wish();"></i><span>보고싶어요</span></li>
                                <li><i class="icon ion-ios-heart" id="btn_pay" onclick="fav();"></i><span>좋아해요</span></li>
                                
                            </ul>
                        </div>
                        <!-- end availables -->

                        <!-- share -->
                        <div class="details__share">
                            <span class="details__share-title">Share with friends:</span>

                            <ul class="details__share-list">
                                <li class="facebook"><a href="#"><i class="icon ion-logo-facebook"></i></a></li>
                                <li class="instagram"><a href="#"><i class="icon ion-logo-instagram"></i></a></li>
                                <li class="twitter"><a href="#"><i class="icon ion-logo-twitter"></i></a></li>
                                <li class="vk"><a href="#"><i class="icon ion-logo-vk"></i></a></li>
                            </ul>
                        </div>
                        <!-- end share -->
                    </div>
                </div>
            </div>
        </div>
        <!-- end details content -->
    </section>
    <!-- end details -->
    
    <!-- filter -->
    <div class="filter">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="filter__content">
                        <div class="filter__items">
                            <!-- filter item -->
                            <div class="filter__item" id="filter__quality">
                                <span class="filter__item-label">화질</span>
                                <div class="filter__item-btn dropdown-toggle" role="navigation" id="filter__quality" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <c:choose>
                                        <c:when test="${qualityVO.q1440 == 1}">
		                                    <input type="button" value="1440p" id="optionqual" name="optionqual" >
                                        </c:when>
                                        <c:when test="${qualityVO.q1024 == 1}">
		                                    <input type="button" value="1024p" id="optionqual" name="optionqual">
                                        </c:when>
                                        <c:when test="${qualityVO.q720 == 1}">
		                                    <input type="button" value="720p" id="optionqual" name="optionqual">
                                        </c:when>
                                        <c:when test="${qualityVO.q576 == 1}">
		                                    <input type="button" value="576p" id="optionqual" name="optionqual">
                                        </c:when>
                                    </c:choose>  
                                    <span></span>
                                </div>
                                <ul class="filter__item-menu dropdown-menu scrollbar-dropdown" aria-labelledby="filter__quality">
                                    <c:choose><c:when test="${qualityVO.q1440 == 1}"><li>1440p</li></c:when></c:choose>
                                    <c:choose><c:when test="${qualityVO.q1024 == 1}"><li>1024p</li></c:when></c:choose>
                                    <c:choose><c:when test="${qualityVO.q720 == 1}"><li>720p</li></c:when></c:choose>  
                                    <c:choose><c:when test="${qualityVO.q576 == 1}"><li>576p</li></c:when></c:choose>  
                                </ul>
                            </div>
                            <!-- end filter item -->
                            <!-- filter item -->
                            <div class="filter__item" id="filter__language">
                                <span class="filter__item-label">언어</span>
                                <div class="filter__item-btn dropdown-toggle" role="navigation" id="filter__language" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <c:choose>
                                        <c:when test="${languageVO.kr == 1}">
                                            <input id="optionlan" name="optionlan"  type="button" value="KR">
                                        </c:when>
                                        <c:when test="${languageVO.en == 1}">
                                            <input id="optionlan" name="optionlan"  type="button" value="EN">
                                        </c:when>
                                        <c:when test="${languageVO.ch == 1}">
                                            <input id="optionlan" name="optionlan"  type="button" value="CH">
                                        </c:when>
                                        <c:when test="${languageVO.jp == 1}">
                                            <input id="optionlan" name="optionlan"  type="button" value="JP">
                                        </c:when>
                                        <c:when test="${languageVO.fr == 1}">
                                            <input id="optionlan" name="optionlan"  type="button" value="FR">
                                        </c:when>
                                        <c:otherwise>
                                            <input id="optionlan" name="optionlan" type="button" value="KR" >
                                        </c:otherwise>
                                    </c:choose>
                                    <span></span>
                                </div>
                                <ul class="filter__item-menu dropdown-menu scrollbar-dropdown" aria-labelledby="filter__language">
                                    <c:choose><c:when test="${languageVO.kr == 1}"><li>KR</li></c:when></c:choose>
                                    <c:choose><c:when test="${languageVO.en == 1}"><li>EN</li> </c:when></c:choose>
                                    <c:choose><c:when test="${languageVO.ch == 1}"><li>CH</li> </c:when></c:choose>
                                    <c:choose><c:when test="${languageVO.jp == 1}"><li>JP</li> </c:when></c:choose>
                                    <c:choose><c:when test="${languageVO.fr == 1}"><li>FR</li> </c:when></c:choose>
                                    <c:choose><c:when test="${languageVO.es == 1}"><li>ES</li> </c:when></c:choose>
                                    <c:choose><c:when test="${languageVO.rs == 1}"><li>RS</li> </c:when></c:choose>
                                    <c:choose><c:when test="${languageVO.de == 1}"><li>DE</li> </c:when></c:choose>
                                    <c:choose><c:when test="${languageVO.ar == 1}"><li>AR</li> </c:when></c:choose>
                                    <c:choose><c:when test="${languageVO.pt == 1}"><li>PT</li> </c:when></c:choose>
                                    <c:choose><c:when test="${languageVO.hi == 1}"><li>HI</li> </c:when></c:choose>
                                </ul>
                            </div>
                            <!-- end filter item -->

                            <!-- filter item -->
                            <div class="filter__item" id="filter__price">
                                <span class="filter__item-label">이용권</span>
                                <div class="filter__item-btn dropdown-toggle" role="navigation" id="filter__price" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <input id="optionprice" name="optionprice" type="button" value="&nbsp;1일: ￦${priceVO.day1}">
                                    <span></span>
                                </div>
                                <ul class="filter__item-menu dropdown-menu scrollbar-dropdown" aria-labelledby="filter__price">
                                    <li>&nbsp;1일: ￦${priceVO.day1}</li>
                                    <li>&nbsp;3일: ￦${priceVO.day3}</li>
                                    <li>&nbsp;7일: ￦${priceVO.day7}</li>
                                    <li>30일: ￦ ${priceVO.day30}</li>
                                    <li>소장용: ￦ ${priceVO.dayperm}</li>
                                </ul>
                            </div>
                            <!-- end filter item -->
                        </div>
                        <!-- filter btn -->
                        <div style="margin-right:30px;">
                        <button class="header__cart-btn " type="button" style="margin-right: 20px; font-size: 50px;" onclick="cart();">
                            <i class="icon ion-ios-cart"  ></i>
                        </button>
                        <button class="header__cart-btn " type="button" style="margin-left: 20px; font-size: 50px;">
                            <i class="icon ion-ios-card"  id="btn_pay"  ></i>
                        </button>
                        </div>
                        <!-- <button class="filter__btn" type="button">장바구니</button> -->
                        <!-- end filter btn -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end filter -->
    
    

    <!-- content -->
    <section class="content">
        <div class="content__head">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <!-- content title -->
                        <h2 class="content__title">Discover</h2>
                        <!-- end content title -->

                        <!-- content tabs nav -->
                        <ul class="nav nav-tabs content__tabs" id="content__tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tab-1" role="tab" aria-controls="tab-1" aria-selected="true">Comments</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2" aria-selected="false">Reviews</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tab-3" role="tab" aria-controls="tab-3" aria-selected="false">Photos</a>
                            </li>
                        </ul>
                        <!-- end content tabs nav -->

                        <!-- content mobile tabs nav -->
                        <div class="content__mobile-tabs" id="content__mobile-tabs">
                            <div class="content__mobile-tabs-btn dropdown-toggle" role="navigation" id="mobile-tabs" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <input type="button" value="Comments">
                                <span></span>
                            </div>

                            <div class="content__mobile-tabs-menu dropdown-menu" aria-labelledby="mobile-tabs">
                                <ul class="nav nav-tabs" role="tablist">
                                    <li class="nav-item"><a class="nav-link active" id="1-tab" data-toggle="tab" href="#tab-1" role="tab" aria-controls="tab-1" aria-selected="true">Comments</a></li>

                                    <li class="nav-item"><a class="nav-link" id="2-tab" data-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2" aria-selected="false">Reviews</a></li>

                                    <li class="nav-item"><a class="nav-link" id="3-tab" data-toggle="tab" href="#tab-3" role="tab" aria-controls="tab-3" aria-selected="false">Photos</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- end content mobile tabs nav -->
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-8 col-xl-8">
                    <!-- content tabs -->
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="1-tab">
                            <div class="row">
                                <!-- comments -->
                                <div class="col-12">
                                    <div class="comments">
                                        <ul class="comments__list">
                                            <li class="comments__item">
                                                <div class="comments__autor">
                                                    <img class="comments__avatar" src="img/user.png" alt="">
                                                    <span class="comments__name">John Doe</span>
                                                    <span class="comments__time">30.08.2018, 17:53</span>
                                                </div>
                                                <p class="comments__text">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.</p>
                                                <div class="comments__actions">
                                                    <div class="comments__rate">
                                                        <button type="button"><i class="icon ion-md-thumbs-up"></i>12</button>

                                                        <button type="button">7<i class="icon ion-md-thumbs-down"></i></button>
                                                    </div>

                                                    <button type="button"><i class="icon ion-ios-share-alt"></i>Reply</button>
                                                    <button type="button"><i class="icon ion-ios-quote"></i>Quote</button>
                                                </div>
                                            </li>

                                            <li class="comments__item comments__item--answer">
                                                <div class="comments__autor">
                                                    <img class="comments__avatar" src="img/user.png" alt="">
                                                    <span class="comments__name">John Doe</span>
                                                    <span class="comments__time">24.08.2018, 16:41</span>
                                                </div>
                                                <p class="comments__text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                                <div class="comments__actions">
                                                    <div class="comments__rate">
                                                        <button type="button"><i class="icon ion-md-thumbs-up"></i>8</button>

                                                        <button type="button">3<i class="icon ion-md-thumbs-down"></i></button>
                                                    </div>

                                                    <button type="button"><i class="icon ion-ios-share-alt"></i>Reply</button>
                                                    <button type="button"><i class="icon ion-ios-quote"></i>Quote</button>
                                                </div>
                                            </li>

                                            <li class="comments__item comments__item--quote">
                                                <div class="comments__autor">
                                                    <img class="comments__avatar" src="img/user.png" alt="">
                                                    <span class="comments__name">John Doe</span>
                                                    <span class="comments__time">11.08.2018, 11:11</span>
                                                </div>
                                                <p class="comments__text"><span>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.</span>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
                                                <div class="comments__actions">
                                                    <div class="comments__rate">
                                                        <button type="button"><i class="icon ion-md-thumbs-up"></i>11</button>

                                                        <button type="button">1<i class="icon ion-md-thumbs-down"></i></button>
                                                    </div>

                                                    <button type="button"><i class="icon ion-ios-share-alt"></i>Reply</button>
                                                    <button type="button"><i class="icon ion-ios-quote"></i>Quote</button>
                                                </div>
                                            </li>

                                            <li class="comments__item">
                                                <div class="comments__autor">
                                                    <img class="comments__avatar" src="img/user.png" alt="">
                                                    <span class="comments__name">John Doe</span>
                                                    <span class="comments__time">07.08.2018, 14:33</span>
                                                </div>
                                                <p class="comments__text">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.</p>
                                                <div class="comments__actions">
                                                    <div class="comments__rate">
                                                        <button type="button"><i class="icon ion-md-thumbs-up"></i>99</button>

                                                        <button type="button">35<i class="icon ion-md-thumbs-down"></i></button>
                                                    </div>

                                                    <button type="button"><i class="icon ion-ios-share-alt"></i>Reply</button>
                                                    <button type="button"><i class="icon ion-ios-quote"></i>Quote</button>
                                                </div>
                                            </li>

                                            <li class="comments__item">
                                                <div class="comments__autor">
                                                    <img class="comments__avatar" src="img/user.png" alt="">
                                                    <span class="comments__name">John Doe</span>
                                                    <span class="comments__time">02.08.2018, 15:24</span>
                                                </div>
                                                <p class="comments__text">Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
                                                <div class="comments__actions">
                                                    <div class="comments__rate">
                                                        <button type="button"><i class="icon ion-md-thumbs-up"></i>74</button>

                                                        <button type="button">13<i class="icon ion-md-thumbs-down"></i></button>
                                                    </div>
                                                    
                                                    <button type="button"><i class="icon ion-ios-share-alt"></i>Reply</button>
                                                    <button type="button"><i class="icon ion-ios-quote"></i>Quote</button>
                                                </div>
                                            </li>
                                        </ul>

                                        <form action="#" class="form">
                                            <textarea id="text" name="text" class="form__textarea" placeholder="Add comment"></textarea>
                                            <button type="button" class="form__btn">Send</button>
                                        </form>
                                    </div>
                                </div>
                                <!-- end comments -->
                            </div>
                        </div>

                        <div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="2-tab">
                            <div class="row">
                                <!-- reviews -->
                                <div class="col-12">
                                    <div class="reviews">
                                        <ul class="reviews__list">
                                            <c:forEach var="member_review_VO_list" items="${member_review_VO_list }">
                                                <%-- <c:set var="photono" value="${member_review_VO_list.photono }"/> --%>
	                                            <li class="reviews__item">
	                                                <div class="reviews__autor">
	                                                    <img class="reviews__avatar" src="../member/prof/${member_review_VO_list.memthumb }" alt="">
	                                                    <span class="reviews__name">${member_review_VO_list.title }</span>
	                                                    <span class="reviews__time">${member_review_VO_list.rdate } by ${member_review_VO_list.nick } </span>
	
	                                                    <span class="reviews__rating"><i class="icon ion-ios-star"></i>${member_review_VO_list.rate }</span>
	                                                </div>
	                                                <p class="reviews__text">${member_review_VO_list.review }</p>
	                                            </li>
                                            </c:forEach>
                                        </ul>

                                        <form id='review_form' action="../review/create.do" class="form">
                                            <input type="hidden" id="memberno" name="memberno" class="form__input" value="1">
                                            <input type="hidden" id="payno" name="payno" class="form__input" value="3">
                                            <input type="hidden" id="filmno" name="filmno" class="form__input" value="${filmVO.filmno }" >
                                            
                                            <input type="text" id="title" name="title" class="form__input" placeholder="제목">
                                            <textarea class="form__textarea" id="review" name="review" placeholder="리뷰"></textarea>
                                            <div class="form__slider">
                                                <div class="form__slider-rating" id="slider__rating"></div>
                                                <div class="form__slider-value" id="form__slider-value"></div>
                                            </div>
                                            <button type="button" class="form__btn" onclick="review_create();">등록</button>
                                        </form>
                                    </div>
                                </div>
                                <!-- end reviews -->
                            </div>
                        </div>

                        <div class="tab-pane fade" id="tab-3" role="tabpanel" aria-labelledby="3-tab">
                            <!-- project gallery -->
                            <div class="gallery" itemscope>
                                <div class="row">

                              <!-- gallery item -->
                                <c:forEach var="photoVO_list" items="${photoVO_list }">
                                    <c:set var="photono" value="${photoVO_list.photono }"/>
                                    <c:set var="folder" value="${photoVO_list.filmno }"/>
                                    <figure class="col-12 col-sm-6 col-xl-4" itemprop="associatedMedia" itemscope>
                                        <a href="../photo/repository/${folder }/${photoVO_list.photoname}" itemprop="contentUrl" data-size="1920x1280">
                                            <img src="../photo/repository/${folder }/${photoVO_list.photothumb}" itemprop="thumbnail" alt="Image description" />
                                        </a>
                                        <figcaption itemprop="caption description">${photoVO_list.photoname} <br> ${photoVO_list.photoalt}</figcaption>
                                    </figure>
                                </c:forEach>
                              <!-- end gallery item -->

                                </div>
                            </div>
                            <!-- end project gallery -->
                        </div>
                    </div>
                    <!-- end content tabs -->
                </div>

                <!-- sidebar -->
                <div class="col-12 col-lg-4 col-xl-4">
                    <div class="row">
                        <!-- section title -->
                        <div class="col-12">
                            <h2 class="section__title section__title--sidebar">You may also like...</h2>
                        </div>
                        <!-- end section title -->

                        <!-- card -->
                        <div class="col-6 col-sm-4 col-lg-6">
                            <div class="card">
                                <div class="card__cover">
                                    <img src="img/covers/cover.jpg" alt="">
                                    <a href="#" class="card__play">
                                        <i class="icon ion-ios-play"></i>
                                    </a>
                                </div>
                                <div class="card__content">
                                    <h3 class="card__title"><a href="#">I Dream in Another Language</a></h3>
                                    <span class="card__category">
                                        <a href="#">Action</a>
                                        <a href="#">Triler</a>
                                    </span>
                                    <span class="card__rate"><i class="icon ion-ios-star"></i>8.4</span>
                                </div>
                            </div>
                        </div>
                        <!-- end card -->

                        <!-- card -->
                        <div class="col-6 col-sm-4 col-lg-6">
                            <div class="card">
                                <div class="card__cover">
                                    <img src="img/covers/cover2.jpg" alt="">
                                    <a href="#" class="card__play">
                                        <i class="icon ion-ios-play"></i>
                                    </a>
                                </div>
                                <div class="card__content">
                                    <h3 class="card__title"><a href="#">Benched</a></h3>
                                    <span class="card__category">
                                        <a href="#">Comedy</a>
                                    </span>
                                    <span class="card__rate"><i class="icon ion-ios-star"></i>7.1</span>
                                </div>
                            </div>
                        </div>
                        <!-- end card -->

                        <!-- card -->
                        <div class="col-6 col-sm-4 col-lg-6">
                            <div class="card">
                                <div class="card__cover">
                                    <img src="img/covers/cover3.jpg" alt="">
                                    <a href="#" class="card__play">
                                        <i class="icon ion-ios-play"></i>
                                    </a>
                                </div>
                                <div class="card__content">
                                    <h3 class="card__title"><a href="#">Whitney</a></h3>
                                    <span class="card__category">
                                        <a href="#">Romance</a>
                                        <a href="#">Drama</a>
                                        <a href="#">Music</a>
                                    </span>
                                    <span class="card__rate"><i class="icon ion-ios-star"></i>6.3</span>
                                </div>
                            </div>
                        </div>
                        <!-- end card -->

                        <!-- card -->
                        <div class="col-6 col-sm-4 col-lg-6">
                            <div class="card">
                                <div class="card__cover">
                                    <img src="img/covers/cover4.jpg" alt="">
                                    <a href="#" class="card__play">
                                        <i class="icon ion-ios-play"></i>
                                    </a>
                                </div>
                                <div class="card__content">
                                    <h3 class="card__title"><a href="#">Blindspotting</a></h3>
                                    <span class="card__category">
                                        <a href="#">Comedy</a>
                                        <a href="#">Drama</a>
                                    </span>
                                    <span class="card__rate"><i class="icon ion-ios-star"></i>7.9</span>
                                </div>
                            </div>
                        </div>
                        <!-- end card -->

                        <!-- card -->
                        <div class="col-6 col-sm-4 col-lg-6">
                            <div class="card">
                                <div class="card__cover">
                                    <img src="img/covers/cover5.jpg" alt="">
                                    <a href="#" class="card__play">
                                        <i class="icon ion-ios-play"></i>
                                    </a>
                                </div>
                                <div class="card__content">
                                    <h3 class="card__title"><a href="#">I Dream in Another Language</a></h3>
                                    <span class="card__category">
                                        <a href="#">Action</a>
                                        <a href="#">Triler</a>
                                    </span>
                                    <span class="card__rate"><i class="icon ion-ios-star"></i>8.4</span>
                                </div>
                            </div>
                        </div>
                        <!-- end card -->

                        <!-- card -->
                        <div class="col-6 col-sm-4 col-lg-6">
                            <div class="card">
                                <div class="card__cover">
                                    <img src="img/covers/cover6.jpg" alt="">
                                    <a href="#" class="card__play">
                                        <i class="icon ion-ios-play"></i>
                                    </a>
                                </div>
                                <div class="card__content">
                                    <h3 class="card__title"><a href="#">Benched</a></h3>
                                    <span class="card__category">
                                        <a href="#">Comedy</a>
                                    </span>
                                    <span class="card__rate"><i class="icon ion-ios-star"></i>7.1</span>
                                </div>
                            </div>
                        </div>
                        <!-- end card -->
                    </div>
                </div>
                <!-- end sidebar -->
            </div>
        </div>
    </section>
    <!-- end content -->

<jsp:include page="/menu/footer.jsp" flush='false' />

    <!-- Root element of PhotoSwipe. Must have class pswp. -->
    <div class="pswp" tabindex="-1" role="dialog" aria-hidden="true">

        <!-- Background of PhotoSwipe. 
        It's a separate element, as animating opacity is faster than rgba(). -->
        <div class="pswp__bg"></div>

        <!-- Slides wrapper with overflow:hidden. -->
        <div class="pswp__scroll-wrap">

            <!-- Container that holds slides. PhotoSwipe keeps only 3 slides in DOM to save memory. -->
            <!-- don't modify these 3 pswp__item elements, data is added later on. -->
            <div class="pswp__container">
                <div class="pswp__item"></div>
                <div class="pswp__item"></div>
                <div class="pswp__item"></div>
            </div>

            <!-- Default (PhotoSwipeUI_Default) interface on top of sliding area. Can be changed. -->
            <div class="pswp__ui pswp__ui--hidden">

                <div class="pswp__top-bar">

                    <!--  Controls are self-explanatory. Order can be changed. -->

                    <div class="pswp__counter"></div>

                    <button class="pswp__button pswp__button--close" title="Close (Esc)"></button>

                    <button class="pswp__button pswp__button--fs" title="Toggle fullscreen"></button>

                    <!-- Preloader -->
                    <div class="pswp__preloader">
                        <div class="pswp__preloader__icn">
                            <div class="pswp__preloader__cut">
                                <div class="pswp__preloader__donut"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <button class="pswp__button pswp__button--arrow--left" title="Previous (arrow left)"></button>

                <button class="pswp__button pswp__button--arrow--right" title="Next (arrow right)"></button>

                <div class="pswp__caption">
                    <div class="pswp__caption__center"></div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>