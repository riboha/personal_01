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
	<title>FlixGo</title>
		
	<script type="text/javascript">
	
  $(function(){
    $(".clickable-row").click(function() {
      window.location = $(this).data("href");
    });
    $('#btn_pntuse').on('click', pntuse); // 포인트 사용 버튼

    cal();
  });


  function cal() {
    var total_price = 0;
    var price_text = 0;
    var price = 0;
    var pricefinal = document.getElementsByClassName('pricefinal');
    var pntuse = document.getElementById("pntuse").value;
    
    $(pricefinal).each(function(){ 
       price_text = $(pricefinal).text();
    });
    var price_list = price_text.split('  ' , );
    
    for (var i in price_list) {
      price = parseInt(price_list[i].trim()) || 0 ;
      alert('price: ' + price);
      total_price += price;
    }

    total_price -= pntuse;
    
    document.getElementById("pricetotalfinal").textContent=total_price;
  }
	  
  // ▶ 포인트 사용
  function pntuse() {
    $("input[name='pntuse']").attr("readonly", true);
    var pntcurrent = ${memberVO.pnt};
    var pntuse = $("input[name='pntuse']").val();

    document.getElementById("btn_pntuse").style.display = "none";
    document.getElementById("btn_pntuse_cancel").style.display = "block";
    
    var pricetotalfinal = document.getElementById("pricetotalfinal").textContent;
    document.getElementById("pricetotalfinal").textContent = parseInt(pricetotalfinal) - pntuse;
    document.getElementById("pntcurrent").textContent = parseInt(pntcurrent) - pntuse;

    cal();
  }

  // ▶ 프로모션 할인액 적용
  function promoamount(promoamount, cartno, promofilmno) {

    var priceoriginal = parseInt(document.getElementById('optionprice_'+cartno).textContent);
    var pricefinal = priceoriginal - promoamount;

    document.getElementById('optionprice_'+cartno).style.textDecoration  = "line-through";
    document.getElementById('pricefinal_'+cartno).textContent = pricefinal;
    document.getElementById('pricefinal_'+cartno).style.display = "block";

    document.getElementById('btn_promoamount_'+promofilmno).style.display = "none";
    document.getElementById('btn_promoamount_'+promofilmno).style.display = "none";
    document.getElementById('btn_promoamount_cancel_'+promofilmno).style.display = "inline-block";

    cal();
  }

  
  // ▶ 프로모션 할인액 적용 취소
  function promoamount_cancel(promoamount, cartno, promofilmno) {

    var priceoriginal = parseInt(document.getElementById('optionprice_'+cartno).textContent);
    var pricefinal = priceoriginal * (100-promopercent) / 100;
    
    document.getElementById('optionprice_'+cartno).style.textDecoration  = "none";
    document.getElementById('pricefinal_'+cartno).textContent = priceoriginal;
    document.getElementById('pricefinal_'+cartno).style.display = "none";

    document.getElementById('btn_promoamount_'+promofilmno).style.display = "inline-block";
    document.getElementById('btn_promoamount_'+promofilmno).style.display = "inline-block";

    document.getElementById('btn_promoamount_cancel_'+promofilmno).style.display = "none";

    cal();
  }
  
  // ▶ 프로모션 할인 퍼센트 적용
  function promopercent(promopercent, cartno, promofilmno) {

    var priceoriginal = parseInt(document.getElementById('optionprice_'+cartno).textContent);
    var pricefinal = priceoriginal * (100-promopercent) / 100;
    
    document.getElementById('optionprice_'+cartno).style.textDecoration  = "line-through";
    document.getElementById('pricefinal_'+cartno).textContent = pricefinal;
    document.getElementById('pricefinal_'+cartno).style.display = "block";

    document.getElementById('btn_promopercent_'+promofilmno).style.display = "none";
    document.getElementById('btn_promopercent_'+promofilmno).style.display = "none";
    document.getElementById('btn_promopercent_cancel_'+promofilmno).style.display = "inline-block";

    cal();

  }

  
  // ▶ 프로모션 적용 취소
  function promopercent_cancel(promopercent, cartno, promofilmno) {

    var priceoriginal = parseInt(document.getElementById('optionprice_'+cartno).textContent);
    var pricefinal = priceoriginal * (100-promopercent) / 100;
    
    document.getElementById('optionprice_'+cartno).style.textDecoration  = "none";
    document.getElementById('pricefinal_'+cartno).textContent = priceoriginal;
    document.getElementById('pricefinal_'+cartno).style.display = "none";

    document.getElementById('btn_promopercent_'+promofilmno).style.display = "inline-block";
    document.getElementById('btn_promopercent_'+promofilmno).style.display = "inline-block";
    document.getElementById('btn_promopercent_cancel_'+promofilmno).style.display = "none";

    cal();
  }
  
  

	</script>
	

</head>
<body class="body">
 <jsp:include page="/menu/header.jsp" flush='false' />
 
	<!-- page title -->
	<section class="section section--first section--bg" data-bg="../img/section/section.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section__wrap">
						<!-- section title -->
						<h2 class="section__title">장바구니</h2>
						<!-- end section title -->
						
						  <!-- breadcrumb -->
                        <ul class="breadcrumb">
                            <li class="breadcrumb__item"><a href="./create.do"> 등록 </a></li>
                            <li class="breadcrumb__item breadcrumb__item--active">검색</li>
                        </ul>
                        <!-- end breadcrumb -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end page title -->


	<!-- director lsit -->
	<section class="">
		<div class="container" style = "width:100%; "> 
			<div class="accordion__list" style = "width:100%; ">
			
			     <br>
			     <br>
			      <h4 class="faq__title">상품 정보</h4>
			      <TABLE style = "width:100%; margin: 30px 25px;">
					  <colgroup>
					    <col style="width: 20%;"/>
					    <col style='width: 10%;'/>
					    <col style='width: 10%;'/>
					    <col style='width: 10%;'/>
					    <col style='width: 15%;'/>
					    <col style='width: 35%;'/>
					  </colgroup>
					  
				  <thead>  
					  <TR >
					    <TH style="text-align: center;">영화</TH>
					    <TH style="text-align: center;">언어</TH>
					    <TH style="text-align: center;">화질</TH>
					    <TH style="text-align: center;">기간</TH>
					    <TH style="text-align: center;">가격</TH>
					    <TH style="text-align: center;">프로모션</TH>
					  </TR>
					  </thead>    
					          
					  <tbody>
					  <c:forEach var="VO" items="${list }">  <!-- request 객체에 접근 -->
                        <c:set var="cartno" value="${VO.cartno}" />
                        <c:set var="filmno" value="${VO.filmno}" />
					    <TR >
					      <TD style="text-align: center;" class='clickable-row' data-href= "../film/read_customer.do?filmno=${filmno }">
					           <span style="margin: 0px;">${VO.titlekr }<br>${VO.titleen }</span>
					      </TD>
					      <TD style="text-align: center;">
					           <span style="margin: 0px;"> ${VO.optionlan } </span>
					      </TD>
					      <TD style="text-align: center;">
					           <span style="margin: 0px;"> ${VO.optionqual } </span>
					      </TD>
					      <TD style="text-align: center;">
					           <span style="margin: 0px;"> ${VO.optionrent } </span>
					      </TD>
					      <TD style="text-align: center;" >
					           <span style="margin: 0px; display:block; text-decoration: none;" class="optionprice"  id="optionprice_${cartno }"  > ${VO.optionprice } </span>
					           <span style="margin: 0px; display:none;" class="pricefinal"  id="pricefinal_${cartno }" > ${VO.optionprice }  </span>
					      </TD>
					      <TD style="text-align: center;"> 
					           <ul>
					               <c:forEach var="film_promotion_list" items="${film_promotion_list }">
			                       <c:set var="promofilmno" value="${film_promotion_list.promofilmno}" />
				                   <c:choose>
				                       <c:when test="${film_promotion_list.filmno == VO.filmno}">
							               <li>
							                   ${film_promotion_list.promotitle }
							                   <c:choose>
					                           <c:when test="${film_promotion_list.promoamount == 0 }">
					                              <button id="btn_promopercent_${promofilmno }" onclick="promopercent(${film_promotion_list.promopercent }, ${cartno }, ${promofilmno });" style="margin: 0px; display: inline-block;">적용</button>
					                              <button id="btn_promopercent_cancel_${promofilmno }" onclick="promopercent_cancel(${film_promotion_list.promopercent }, ${cartno }, ${promofilmno });" style="margin: 0px; display: none;">취소</button>
					                           </c:when>
					                           <c:otherwise>
					                              <button id="btn_promoamount_${promofilmno }" onclick="promoamount(${film_promotion_list.promoamount }, ${cartno }, ${promofilmno });" style="margin: 0px; display: inline-block;">적용</button>
					                              <button id="btn_promoamount_cancel_${promofilmno }" onclick="promoamount_cancel(${film_promotion_list.promoamount }, ${cartno }, ${promofilmno });" style="margin: 0px; display: none;">취소</button>
					                           </c:otherwise>
							                   </c:choose>
							               </li>
				                       </c:when>
				                   </c:choose>
					               </c:forEach>
					           </ul>
					      </TD>
					    </TR>
					  </c:forEach>
					  </tbody>
					  </TABLE>
					  
					  <br>
					  <br>
					  <h4 class="faq__title">포인트 할인</h4>
					  <TABLE style = "width:100%; margin: 30px 25px; ">
                      <colgroup>
                        <col style='width: 20%;'/>
                        <col style='width: 20%;'/>
                        <col style='width: 20%;'/>
                        <col style='width: 20%;'/>
                        <col style='width: 20%;'/>
                      </colgroup>
                      <thead>  
                      <TR >
                        <TH style="text-align: center;"></TH>
                        <TH style="text-align: center;"></TH>
                        <TH style="text-align: center;"></TH>
                        <TH style="text-align: center;"></TH>
                        <TH style="text-align: center;"></TH>
                      </TR>
                      </thead> 
                         
                      <tbody>
                        <TR>
                          <TD style="text-align: center; " >
                            <span>내 포인트</span>
                          </TD>
                          <TD style="text-align: center; ">
                            <span id="pntcurrent"> ${memberVO.pnt } 원</span>
                          </TD>
                          <TD style="text-align: center; " >
                            <input type="number" id="pntuse" name="pntuse" 
                                style="background-color: rgba(255,255,255,0.08); border: none; border-bottom: none; font-family: 'Open Sans', sans-serif; font-size: 14px; " 
                                value="0"  max="${memberVO.pnt}" min="0" step="10"> 원
                          </TD>
                          <TD style="text-align: center; " > 
                            <button id="btn_pntuse" name = "ptn_pntuse" style ="display:block;">사용</button>
                            <button id="btn_pntuse_all" name = "btn_pntuse_all" style ="display:block;">전체 사용</button>
                            <button id="btn_pntuse_cancel" name = "btn_pntuse_cancel" style ="display:none;" onclick="window.location.reload();">취소</button>
                          </TD>
                        </TR>
                      </tbody>
                      </TABLE>
                      
					  <br>
					  <br>
					  <h4 class="faq__title">결제</h4>
			         <TABLE style = "width:100%; margin: 30px 25px; pointer-events: none;" >
					  <colgroup>
					    <col style='width: 100%;'/>
					  </colgroup>
					  <thead>  
					  <TR >
					    <TH style="text-align: center;"></TH>
					  </TR>
					  </thead> 
					     
					  <tbody>
					    <TR >
					      <TD style="text-align: center; " >
					       <span>적립 예정 포인트</span> 
					       <span id="pntsave"> 점</span> 
					      </TD>
					    </TR>
					    <TR >
					      <TD style="text-align: center; width:100%; " >
					           할인　<span id="pricetotaldiscount"></span> 원
					           총　<span id="pricetotalfinal"></span> 원
					      </TD>
					    </TR>
					  </tbody>
					  </TABLE>
					  
					  <div  >
					  <a href="#" class="header__sign-in" style="margin-right: 50px;">
					       <i class="icon ion-ios-log-in" ></i>
					       <span>결제</span>
                      </a>
					  </div>
			</div>
		</div>
	</section>
	<!-- end actor -->
	
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