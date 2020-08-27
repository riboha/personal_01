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

    <!-- Customized CSS -->
    <link rel="stylesheet" href="${root }/css/breadcrumb.css">
    <link rel="stylesheet" href="${root }/css/paylist_accordion.css">

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
	$(function(){
		$(".clickable-row").click(function() {
		  if (confirm('리뷰 작성하러 갈까요?')) {
			  window.location = $(this).data("href");
		   }
		});
    });
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
						<h2 class="section__title">구매 내역</h2>
						<!-- end section title -->
						
						  <!-- breadcrumb -->
                        <ul class="breadcrumb">
                            <li class="breadcrumb__item"><a href="#"> 홈</a></li>
                            <li class="breadcrumb__item breadcrumb__item--active">내 구매 내역</li>
                        </ul>
                        <!-- end breadcrumb -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end page title -->

	<!-- Container-->
	<div class="container" style="padding-top: 30px; magin-top: 40px;]">
	
	   <!-- Paylist -->
       <div class="paylist" id="paylist" style="width: 100%;">
       
            <!-- Card-->
		    <c:forEach var="list_paging_paytotalno"  items="${list_paging_paytotalno}">
		    <c:set var="paytotalno" value="${list_paging_paytotalno.paytotalno}" /> 
            
            <!-- Paylist_Card -->
            <div class="paylist__card">
            
                <!-- Card-Header -->
                <div class="card-header" id="heading_${paytotalno}">
                    <button class="collapsed"  type="button" data-toggle="collapse" data-target="#collapse_${paytotalno}" aria-expanded="true" aria-controls="collapse_${paytotalno}">
                        <span>결제 번호: ${paytotalno}</span>
                        <span> 
                            총액 : ${list_paging_paytotalno.pricetotalfinal}　　
                            프로모션 할인 : ${list_paging_paytotalno.pricetotaldiscpromo}　　
                            포인트 할인 : ${list_paging_paytotalno.pricetotaldiscpnt}　　
                            적립 : ${list_paging_paytotalno.pntsave}
                        </span>
                        <span> 
                            일자 : ${list_paging_paytotalno.paytotaldate.substring(0, 10)}　　결제 :
                            <c:choose> 
                                <c:when test="${list_paging_paytotalno.method == 1}"> KAKAO PAY </c:when>
                                <c:when test="${list_paging_paytotalno.method == 2}"> NAVER PAY </c:when>
                                <c:when test="${list_paging_paytotalno.method == 3}"> 신용카드 </c:when>
                                <c:when test="${list_paging_paytotalno.method == 4}"> PAY PAL </c:when>
                            </c:choose>
                        </span>
                    </button>
                </div>
                <!-- Card-Header END-->
                
                <!-- Card-Body-->
                <div id="collapse_${paytotalno}" class="collapse" aria-labelledby="heading_${paytotalno}" data-parent="#paylist">
	                <div class="card-body">
	                
	                    <table class="paylist__list">
	                       <colgroup> 
		                        <col style="width: 25%;"/><col style='width: 10%;'/><col style='width: 10%;'/><col style='width: 10%;'/><col style='width: 15%;'/><col style='width: 15%;'/>
	                       </colgroup>
	                       <thead>
	                            <tr>
	                                <th>제목</th><th>언어</th><th>화질</th><th>기간</th><th>금액</th><th>결제</th>
	                            </tr>
	                        </thead>
                            <tbody>
                                <c:forEach var="list_paging"  items="${list_paging}">
	                                <c:choose>
		                                <c:when test="${list_paging.paytotalno == list_paging_paytotalno.paytotalno}">
		                                <tr>
		                                    <th class='clickable-row' 
		                                          data-href= "../film/read_customer.do?filmno=${list_paging.filmno }&payno=${list_paging.payno}">
		                                      ${list_paging.titlekr} <br> ${list_paging.titleen}
		                                    </th>
		                                    <td>${list_paging.optionlan}</td>
		                                    <td>${list_paging.optionqual}</td>
		                                    <td>${list_paging.optionrent}</td>
		                                    <td>${list_paging.priceoriginal}</td>
		                                    <td>${list_paging.pricefinal}</td>
		                                </tr>
		                                </c:when>
	                                </c:choose>
                               </c:forEach>
                            </tbody>
                        </table>
                        
                    </div>
                </div>
                <!-- Card-Body END-->
                
            </div>
            <!-- Paylist_Card  END-->
            </c:forEach>
	<!-- paginator -->
	<div class="col-12">
	    ${paging }
	</div>
	<!-- end paginator -->
		</div>
 <!-- Paylist END-->
 
</div>
<!-- Continaer END -->


<br>
<br>

</body>
</html>