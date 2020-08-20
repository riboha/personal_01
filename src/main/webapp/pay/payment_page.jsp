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
$(function(){

    $(".clickable-row").click(function() {window.location = $(this).data("href");});
    
    $("#btn_pntuse").on('click', pntuse); // 포인트 적용 버튼
    $("#btn_pntuse_all").on('click', pntuse_all); // 포인트 모두 적용 버튼
    $("#btn_pntuse_cancel").on('click', pntuse_cancel); // 포인트 적용 취소 버튼

    cal(); // pricetotal 계산
});

  // ▶ pricetotal 계산
  function cal() {
    var total_price = 0;
    var option_total_price=0;
    
    var price_text = 0;
    var optionprice_text = 0;
    
    var price = 0;
    var optionprice=0;
    
    var pricefinal = document.getElementsByClassName('pricefinal');
    var optionprice_class = document.getElementsByClassName('optionprice');
    var pntuse_val = parseInt($('#pntuse').val());

    // 적립 예정 포인트
    var pntsave_id = document.getElementById('pntsave');
    var pntsave_val = parseInt(document.getElementById('pntsave').textContent);

    // 총 할인 금액
    var pricetotaldiscount_id =document.getElementById('pricetotaldiscount');
    var pricetotaldiscount_val = parseInt(document.getElementById("pricetotaldiscount").textContent);

    // 총 결제 금액
    var pricetotalfinal_id = document.getElementById("pricetotalfinal");
    var pricetotalfinal_val = parseInt(document.getElementById("pricetotalfinal").textContent);

    $(optionprice_class).each(function(){ 
      optionprice_text = $(optionprice_class).text();
   });
    
     var optionprice_list = optionprice_text.split(' ' , );
     for (var i in optionprice_list) {
       optionprice = parseInt(optionprice_list[i].trim()) || 0 ;
       option_total_price += optionprice;
     }
    
    $(pricefinal).each(function(){ 
       price_text = $(pricefinal).text();
    });
      //alert('price_text: ' + price_text);
    
    var price_list = price_text.split(' ' , );
    for (var i in price_list) {
      price = parseInt(price_list[i].trim()) || 0 ;
      total_price += price;
    }

    
    total_price -= pntuse_val;
    pricetotalfinal_id.textContent=total_price;
    
    pricetotaldiscount_id.textContent = option_total_price - total_price;
    pntsave_id.textContent = Math.ceil((total_price) / 100);
    //pntsave_id.textContent = total_price / 100;

    // ▼ form_paytotal 값 할당 ▼
    document.getElementById('pricetotaloriginal_paytotal').value = option_total_price;
    document.getElementById('pricetotaldiscpromo_paytotal').value = option_total_price - total_price - pntuse_val;
    document.getElementById('pricetotaldiscpnt_paytotal').value = pntuse_val;
    document.getElementById('pricetotalfinal_paytotal').value = total_price;
    document.getElementById('pntsave_paytotal').value =Math.ceil((total_price) / 100);
    
  }


  
  // ▶ 포인트 사용
  function pntuse () {

	var pntcurrent_id = document.getElementById("pntcurrent");
	var pntcurrent_val = parseInt(document.getElementById("pntcurrent").textContent);
	var pntuse_id = $('#pntuse');
	var pntuse_val = $('#pntuse').val();

    pntuse_id.attr("readonly", true);
    
    btn_pntuse.style.display = "none";
    btn_pntuse_all.style.display = "none";
    btn_pntuse_cancel.style.display = "inline-block";
    
    pntcurrent_id.textContent = parseInt(pntcurrent_val) - parseInt(pntuse_val);

    cal();
  }
  
  // ▶ 포인트 모두사용
  function pntuse_all() {

    var pntcurrent_id = document.getElementById("pntcurrent");
    var pntcurrent_val = parseInt(document.getElementById("pntcurrent").textContent);
    var pntuse_id = $('#pntuse');
    var pntuse_val = pntcurrent_val;

    pntuse_id.val(pntuse_val);
    pntuse_id.attr("readonly", true);

    btn_pntuse.style.display = "none";
    btn_pntuse_all.style.display = "none";
    btn_pntuse_cancel.style.display = "inline-block";

    pntcurrent_id.textContent = parseInt(pntcurrent_val) - parseInt(pntuse_val);

    cal();
  }

  // ▶ 포인트 사용 취소
  function pntuse_cancel() {
    
    var pntcurrent_id = document.getElementById("pntcurrent");
    var pntcurrent_val = parseInt(document.getElementById("pntcurrent").textContent);
    var pntuse_id = $('#pntuse');
    var pntuse_val = pntcurrent_val;

    pntcurrent_id.textContent = ${memberVO.pnt};
    pntuse_id.val(0);

    pntuse_id.attr("readonly", false);

    btn_pntuse.style.display = "inline-block";
    btn_pntuse_all.style.display = "inline-block";
    btn_pntuse_cancel.style.display = "none";
    
    cal();
  }

  // ▶ 프로모션 할인액 적용
  function promoamount(promoamount, cartno, promofilmno) {

    var priceoriginal_id = document.getElementById('optionprice_'+cartno);
    var priceoriginal = parseInt(priceoriginal_id.textContent);
    var pricefinal_id = document.getElementById('pricefinal_'+cartno);
    var pricefinal = parseInt(priceoriginal) - promoamount;
    var pricediscount_id = document.getElementById('pricediscount_'+cartno);

    var btn_promoamount_id = document.getElementById('btn_promoamount_'+promofilmno);
    var btn_promoamount_cancel_id = document.getElementById('btn_promoamount_cancel_'+promofilmno);


    priceoriginal_id.style.textDecoration  = "line-through";
    pricefinal_id.textContent = pricefinal;
    pricefinal_id.style.display = "block";

    btn_promoamount_id.style.display = "none";
    btn_promoamount_cancel_id.style.display = "inline-block";

    pricefinal_id.value = parseInt(pricefinal);
    pricediscount_id.value = parseInt(promoamount);

    alert('pricefinal_: ' + pricefinal_id.value);
    alert('pricediscount_: ' + pricediscount_id.value);

    var params = $('#form_' + cartno).serialize();
    alert('params: ' + params);
    
    cal();
  }

  // ▶ 프로모션 할인액 적용 취소
  function promoamount_cancel(promoamount, cartno, promofilmno) {

    var priceoriginal_id = document.getElementById('optionprice_'+cartno);
    var priceoriginal = parseInt(priceoriginal_id.textContent);
    var pricefinal_id = document.getElementById('pricefinal_'+cartno);
    var pricefinal = priceoriginal - promoamount;

    var btn_promoamount_id = document.getElementById('btn_promoamount_'+promofilmno);
    var btn_promoamount_cancel_id = document.getElementById('btn_promoamount_cancel_'+promofilmno);

    
    priceoriginal_id.style.textDecoration  = "none";
    pricefinal_id.textContent = priceoriginal;
    pricefinal_id.style.display = "none";

    // Desactive Buttons 
    btn_promoamount_id.style.display = "inline-block";
    btn_promoamount_cancel_id.style.display = "none";



    cal();
  }
  
  // ▶ 프로모션 할인 퍼센트 적용
  function promopercent(promopercent, cartno, promofilmno) {

    var priceoriginal_id = document.getElementById('optionprice_'+cartno);
    var priceoriginal = parseInt(priceoriginal_id.textContent);
    var pricefinal_id = document.getElementById('pricefinal_'+cartno);
    var pricefinal = priceoriginal * (100-promopercent) / 100;

    var btn_promopercent_id = document.getElementById('btn_promopercent_'+promofilmno);
    var btn_promopercent_cancel_id = document.getElementById('btn_promopercent_cancel_'+promofilmno);
    
    priceoriginal_id.style.textDecoration  = "line-through";
    pricefinal_id.textContent = pricefinal;
    
    pricefinal_id.style.display = "block";

    btn_promopercent_id.style.display = "none";
    btn_promopercent_id.style.display = "none";
    btn_promopercent_cancel_id.style.display = "inline-block";

    cal();
  }

  
  // ▶ 프로모션 할인 퍼센트 취소
  function promopercent_cancel(promopercent, cartno, promofilmno) {

    var priceoriginal_id = document.getElementById('optionprice_'+cartno);
    var priceoriginal = parseInt(priceoriginal_id.textContent);
    var pricefinal_id = document.getElementById('pricefinal_'+cartno);
    var pricefinal = priceoriginal * (100-promopercent) / 100;

    var btn_promopercent_id = document.getElementById('btn_promopercent_'+promofilmno);
    var btn_promopercent_cancel_id = document.getElementById('btn_promopercent_cancel_'+promofilmno);
   
    priceoriginal_id.style.textDecoration  = "none";
    pricefinal_id.textContent = priceoriginal;
    pricefinal_id.style.display = "none";

    btn_promopercent_id.style.display = "inline-block";
    btn_promopercent_cancel_id.style.display = "none";

    cal();
  }


    var cartno_count = ${cartno_count};
    var cartno_list = ('${cartno_list_string}').split(',' , );
    var cartno_array = [];
    for (var i in cartno_list) {
      if (parseInt(cartno_list[i] || 0) != 0) {
        cartno_array.push(parseInt(cartno_list[i] || 0));
        //alert(parseInt(cartno_list[i] || 0));
      }
    }

  // 총 결제 생성 → 개별 결제 진행
  function order () {

    var params = $('#form_paytotal').serialize();
    alert('params: ' + params); 

    // return;
    if (confirm("결제를 진행하시겠습니까?")) {
      $.ajax({
          url : "../paytotal/create.do",
          type : "post",
          cache : false,
          async : false,
          dataType : "json",
          data : params,
          success : function(rdata) {
              if (rdata.paytotalno >= 1) { 
                  alert(' paytotal 등록 성공');

                  // ▶ 개별 결제
                  for (var i =0; i < cartno_array.length; i ++ ) {
                    params = $('#form_' + cartno_array[i]).serialize() + '&paytotalno=' + rdata.paytotalno;
                    // alert('params: ' + params);
					$.ajax({
					  url : "../pay/create.do",
					  type : "post",
					  cache : false,
					  async : false,
					  dataType : "json",
					  data : params ,
					  success : function(rdata) {
					      if (rdata.cnt >= 1) { 
					          // alert('pay 등록 성공');
					      } else {
					          // alert('결제 실패: pay');
					      }
					  },
					  error : function(request, status, error) {
						  alert('결제 실패: pay');
					      var msg = 'ERROR<br><br>';
					      msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
					      msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
					      console.log(msg);
					  }
					});
                  }
                  alert('전체 결제 등록 성공');
                  
                  // ▶ 장바구니 삭제
                  for (var i =0; i < cartno_array.length; i ++ ) {
					$.ajax({
					  url : "../cart/delete.do",
					  type : "post",
					  cache : false,
					  async : false,
					  dataType : "json",
					  data : {'cartno' : cartno_array[i]} ,
					  success : function(rdata) {
					      if (rdata.cnt >= 1) { 
					          alert('cartno ' + cartno_array[i] +  '삭제 성공');
					      } else {
					          alert('cartno ' + cartno_array[i] +  '삭제 실패');
					      }
					  },
					  error : function(request, status, error) {
						  alert('결제 실패: pay');
					      var msg = 'ERROR<br><br>';
					      msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
					      msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
					      console.log(msg);
					  }
					});
                  }
                  alert('전체 장바구니 삭제 성공');
              } else {
                  alert('결제 실패: paytotalno');
              }
          },
          error : function(request, status, error) {
                  alert('결제 실패: paytotalno');
              var msg = 'ERROR<br><br>';
              msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
              msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
              console.log(msg);
          }
      });
     } else {
     alert('아니오를 누르셨습니다');
     }
  }

  function submit(cartno) {
    // alert('cartno: ' + cartno);

    var params = $('#form_' + cartno).serialize();
    alert('params: ' + params);
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
				                       
							       <form id="form_${cartno }" name="form_${cartno }">
							         <input type="hidden" id="optionlan_${cartno }" name="optionlan" value="${VO.optionlan }">
							         <input type="hidden" id="optionqual_${cartno }" name="optionqual" value="${VO.optionqual }">
							         <input type="hidden" id="optionrent_${cartno }" name="optionrent" value="${VO.optionrent }">

							         <input type="hidden" id="priceoriginal_${cartno }" name="priceoriginal"  value="${VO.optionprice }">
							         <input type="hidden" id="pricediscount_${cartno }" name="pricediscount"  value="0">
							         <input type="hidden" id="pricefinal_${cartno }" name="pricefinal" value="${VO.optionprice }">

							         <input type="hidden" id="memberno_${cartno }" name="memberno" value="${sessionScope.memberno }">
							         <input type="hidden" id="promono_${cartno }" name="promono" value="0">
							         <input type="hidden" id="filmno_${cartno }" name="filmno" value="${filmno}">
							         
							       </form>
							         <button onclick="submit(${cartno})">등록</button>
							       
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
                        <col style='width: 100%;'/>
                      </colgroup>
                      <thead>  
                      <TR >
                        <TH style="text-align: center;"></TH>
                      </TR>
                      </thead> 
                         
                      <tbody>
                        <TR>
                          <TD style="text-align: center; " >
                            <span>내 포인트</span>
                            <span id="pntcurrent"> ${memberVO.pnt } 원</span>
                            <input type="number" id="pntuse" name="pntuse" 
                                style="background-color: rgba(255,255,255,0.08); border: none; border-bottom: none; font-family: 'Open Sans', sans-serif; font-size: 14px; " 
                                value="0"  max="${memberVO.pnt}" min="0" step="10"> 원
                            <button id="btn_pntuse" name = "btn_pntuse" style ="display:inline-block;">[사용]</button>
                            <button id="btn_pntuse_all" name = "btn_pntuse_all" style ="display:inline-block;">[모두 사용]</button>
                            <button id="btn_pntuse_cancel" name = "btn_pntuse_cancel" style ="display:none;">[취소]</button>
                          </TD>
                        </TR>
                      </tbody>
                      </TABLE>
                      
					  <br>
					  <br>
					  <h4 class="faq__title">결제</h4>
			         <TABLE style = "width:100%; margin: 30px 25px; " >
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
						       
						  <form id="form_paytotal" name="form_paytotal" action="../paytotal/create.do">
						    <input type="hidden" id="pricetotaloriginal_paytotal" name="pricetotaloriginal" value="${VO.optionlan }">
							<input type="hidden" id="pricetotaldiscpromo_paytotal" name="pricetotaldiscpromo" value="${VO.optionqual }">
							<input type="hidden" id="pricetotaldiscpnt_paytotal" name="pricetotaldiscpnt" value="${VO.optionqual }">
							<input type="hidden" id="pricetotalfinal_paytotal" name="pricetotalfinal" value="${VO.optionrent }">
							<input type="hidden" id="pntsave_paytotal" name="pntsave"  value="${VO.optionprice }">
							<input type="hidden" id="memberno_paytotal" name="memberno" value="${sessionScope.memberno }">
							
					       <div class=" sign__group--checkbox" style = "width: 80%; display:inline; " > 
					          <input id="kakaopay" name="method" type="radio"  value="1" checked="checked"> 
                              <label for="kakaopay"> KAKAO PAY </label>
                            </div>
					       <div class=" sign__group--checkbox" style = "width: 80%; display:inline; " > 
					          <input id="naverpay" name="method" type="radio"  value="2"> 
                              <label for="naverpay"> NAVER PAY </label>
                            </div>
					        <div class=" sign__group--checkbox" style = "width: 80%; display:inline; " >
                              <input id="creditcard" name="method" type="radio"  value="3" > 
                              <label for="creditcard"> 신용카드 </label>
                            </div>
					        <div class=" sign__group--checkbox" style = "width: 80%; display:inline; " >
                              <input id="paypal" name="method" type="radio"  value="4" > 
                              <label for="paypal"> PAYPAL </label>
                            </div> 
		                  </form>
                            
					      </TD>
					    </TR>
					    <TR >
					      <TD style="text-align: center; " >
					       적립 예정　<span id="pntsave"> </span> 점 
					      </TD>
					    </TR>
					    <TR >
					      <TD style="text-align: center; width:100%; " >
					           할인　<span id="pricetotaldiscount"></span> 원
					      </TD>
					    </TR>
					    <TR >
					      <TD style="text-align: center; width:100%; " >
					           총　<span id="pricetotalfinal"></span> 원
					      </TD>
					    </TR>
					  </tbody>
					  </TABLE>
					  
	                  
					  <div  >
					  <button onclick="order();" class="header__sign-in" style="margin-right: 50px;">
					       <i class="icon ion-ios-log-in" ></i>
					       <span>결제</span>
                      </button>
					  </div>
			</div>
		</div>
	</section>
	<!-- end actor -->


</body>

</html>