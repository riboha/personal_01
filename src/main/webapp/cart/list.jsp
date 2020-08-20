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
	$(function() {
		$(".clickable-row").click(function() {
			window.location = $(this).data("href");
		});
		$('#btn_checkout_select').on('click', checkout_select_proc); // 선택 결제
		$('#btn_checkout_select_all').on('click', checkout_select_proc); // 전체 결제
	});



  var total_price = 0; // 선택한 상품 총 가격
  var quantitiy = 0; // 선택한 상품 총 갯수

  // var checkout_select = []; // 선택한 장바구니 번호 배열
  var checkout_select = ""; // 선택한 장바구니 번호 문자열
  var checkout_select_all = ""; // 전체 장바구니 번호 문자열
  
  var price_id = 0;  // 선택한 상품 가격 span id
  var price = 0; // 선택한 상품 가격
  
$( document ).ready( function() {
  // 로딩시 자동 계산
  $('input[class="checkout"]:checked').each(function(){
    price_id = parseInt($(this).val());
    price = parseInt(document.getElementById(price_id).textContent);
    total_price += parseInt(price);
    quantitiy += 1;
    // checkout_select.push(price_id);
    checkout_select += price_id + ',';
  });
  checkout_select_all = checkout_select;
   
  document.getElementById("total_quantitiy").textContent=quantitiy;
  document.getElementById("quantitiy").textContent=quantitiy;
  document.getElementById("total_price").textContent=total_price;
  document.getElementById('checkout_select').value = checkout_select;
  document.getElementById('checkout_select_all').value = checkout_select;

  // ▶ Checkbox 전체 선택, 전체 해제시
  $( '.selectall' ).click( function() {
    $( '.checkout' ).prop( 'checked', this.checked );
    total_price = 0;
    quantitiy = 0;
    // checkout_select = [];
    checkout_select = "";
    price_id = 0;
    price = 0;
  $('input[class="checkout"]:checked').each(function(){
    price_id = parseInt($(this).val());
    price = parseInt(document.getElementById(price_id).textContent);
    total_price += parseInt(price);
    quantitiy += 1;
    // checkout_select.push(price_id);
    checkout_select += price_id + ',';
    
  });
  document.getElementById("total_price").textContent=total_price;
  document.getElementById("quantitiy").textContent=quantitiy;
  document.getElementById('checkout_select').value = checkout_select;
  
  });
  
   // ▶ Checkbox 개별 선택, 해제시  
  $('.checkout').change(function (){
      total_price = 0;
      quantitiy = 0;
      // checkout_select = [];
      checkout_select = "";
      price_id = 0;
      price = 0;
      $('input[class="checkout"]:checked').each(function(){
        price_id = parseInt($(this).val());
        price = parseInt(document.getElementById(price_id).textContent);
        total_price += parseInt(price);
        quantitiy += 1;
        // checkout_select.push(price_id);
        checkout_select += price_id + ',';
      });     
      $( '.selectall' ).prop( 'checked', false );
      
      document.getElementById("total_price").textContent=total_price;
      document.getElementById("quantitiy").textContent=quantitiy;
      document.getElementById('checkout_select').value = checkout_select;
      
  });
  
});

  // ▶ 레코드 삭제 실행
  function delete_proc(cartno) {
    if (confirm('삭제 하시겠습니까?')) {
      $.ajax({
        url: "./delete.do", 
        type: "post",          
        cache: false,          // 브러우저의 캐시영역 사용안함.
        async: true,           // true: 비동기
        dataType: "json",   
        data: { 'cartno' : cartno }, 
        success: function(rdata) {
          var msg = ""; // 메시지 출력
          if (rdata.cnt == 1) {
              alert('삭제 성공');
              window.location.reload();
          } else {
              alert('삭제 실패');
              window.location.reload();
          }   
        },
        error: function(request, status, error) { 
          var msg = 'ERROR request.status: '+request.status + '/ ' + error;
          console.log(msg); 
        }
      });
     } 
  }

  // ▶ 개별 결제
  function checkout_proc (cartno) {
    if(confirm("결제를 진행하시겠습니까?")){
      alert('cartno ' + cartno);
      $.ajax({
        url: "../pay/create.do", 
        type: "post",          
        cache: false,          // 브러우저의 캐시영역 사용안함.
        async: true,           // true: 비동기
        dataType: "json",   
        data: { 'cartno' : cartno }, 
        success: function(rdata) {
          var msg = ""; // 메시지 출력
          if (rdata.cnt == 1) {
              alert('결제 등록 실패');
              // location.href="http://cdmanii.tistory.com";
          } else {
              alert('결제 등록 실패');
              window.location.reload();
          }   
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          var msg = 'ERROR request.status: '+request.status + '/ ' + error;
          console.log(msg); // Chrome에 출력
        }
      });
    } else {
    alert('아니오를 누르셨습니다');
    }
    // return;
    
  }
    
  // ▶ 선택/전체 결제
  function checkout_select_proc () {
    
    alert('checkout_select: ' + checkout_select);

    if (confirm("결제를 진행하시겠습니까?")) {
	    // return;
      $.ajax({
	      url : "../pay/payment_page.do",
	      type : "get",
	      cache : false,
	      async : false,
	      dataType : "json",
	      data : {'checkout_select':checkout_select, 'memberno' : 1} ,
	      success : function(rdata) {
	          if (rdata.cnt >= 1) {
	              //alert('등록 성공');
	          } else {
	              alert('등록 실패');
	          }
	      },
	      error : function(request, status, error) {
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
		<div class="container">
			<div class="accordion__list">
			
			      <TABLE style = "width:100%; margin: 30px 25px;">
					  <colgroup>
					    <col style="width: 5%;"/>
					    <col style='width: 20%;'/>
					    <col style='width: 10%;'/>
					    <col style='width: 10%;'/>
					    <col style='width: 10%;'/>
					    <col style='width: 15%;'/>
					    <col style='width: 25%;'/>
					  </colgroup>
					  
				  <thead>  
					  <TR >
					   <TH style="text-align: center;"> 
                        <div class=" sign__group--checkbox" style = "width: 80%; display:inline; " >
                             <input id="selectall_id" class="selectall" type="checkbox" checked="checked" value="${filmno }"> 
                             <label for="selectall_id">　</label>
                        </div>
                        </TH>
					    <TH style="text-align: center;">영화</TH>
					    <TH style="text-align: center;">언어</TH>
					    <TH style="text-align: center;">화질</TH>
					    <TH style="text-align: center;">기간</TH>
					    <TH style="text-align: center;">가격</TH>
					    <TH style="text-align: center;"></TH>
					  </TR>
					  </thead>    
					          
					  <tbody>
					  <c:forEach var="VO" items="${list }">  <!-- request 객체에 접근 -->
                        <c:set var="cartno" value="${VO.cartno}" />
                        <c:set var="filmno" value="${VO.filmno}" />
                        
					    <TR >
                          <TD class=" " style="text-align: center;" >
                            <form>
                              <div class=" sign__group--checkbox" style = "width: 80%; display:inline; " >
                                   <input id="pay_proc_${cartno }" class="checkout"  type="checkbox" checked="checked" value="${VO.cartno }"> 
                                   <label for="pay_proc_${cartno }" >　</label>
                                  </div>
                            </form>
                          </TD>
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
					           <span style="margin: 0px;" id="${cartno }" > ${VO.optionprice } </span>
					      </TD>
					      <TD style="text-align: center;"> 
                              <button onclick="checkout_proc('${filmno}')" id="btn_checkout_proc_${filmno }"  name="btn_checkout_proc_${filmno }"  style="width:25%; height:100%; margin: 0px; display: inline-block;">결제</button>
                              <button onclick="delete_proc('${cartno}')" id="btn_delete_proc_${cartno }"  name="btn_delete_proc_${cartno }"  style="width:25%; height:100%; margin: 0px; display: inline-block;">삭제</button>
					      </TD>
					                   
					    </TR>
					  </c:forEach>
					  </tbody>
					  </TABLE>
					  
			      <TABLE style = "width:100%; margin: 30px 25px; " >
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
					    <TR >

					      <TD style="text-align: center; pointer-events: auto;" >
					           총　<span id="total_quantitiy"></span>건　중　<span id="quantitiy"></span>　건
					      </TD>
					      
					      <TD style="text-align: center; pointer-events: auto;">
					           총　<span id="total_price"></span> 원
					      </TD>
					      
					      <TD style="text-align: center; pointer-events: auto;" >
                          </TD>
					      
					      <TD style="text-align: center; width:100%; " > 
					      
				               <form id="form_checkout_select" action="../pay/payment_page.do">
							       <input type="hidden" id="memberno" name="memberno" value="1">
							       <input type="hidden" id="checkout_select" name="checkout_select" value="">
						           <button type="submit" style="width:25%; height:100%; margin: 0px; display: inline-block;">
						               <p>선택결제</p>
						           </button>
							   </form>
				               <form id="form_checkout_select" action="../pay/payment_page.do">
							       <input type="hidden" id="memberno" name="memberno" value="1">
							       <input type="hidden" id="checkout_select_all" name="checkout_select_all" value="">
						           <button type="submit"  style="width:25%; height:100%; margin: 0px; display: inline-block;">
						               <p>전체결제</p>
						           </button>
							   </form>
					      </TD>
					      
					    </TR>
					  </tbody>
					  </TABLE>
			</div>
		</div>
	</section>
	<!-- end actor -->
	
	


</body>

</html>