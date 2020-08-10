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
	$(function() {
		$(".clickable-row").click(function() {
			window.location = $(this).data("href");
		});
		$('#btn_checkout_select').on('click', checkout_select); //선택 결제
		$('#btn_checkout_all').on('click', checkout_all); // 전체 결제
		
		
	});


  // ▶ 장르 레코드 삭제 실행
  function genre_delete_proc(genreno) {

      alert('genreno: ' + genreno);
      // return;
      $.ajax({
        url: "./delete.do", 
        type: "post",          
        cache: false,          // 브러우저의 캐시영역 사용안함.
        async: true,           // true: 비동기
        dataType: "json",   
        data: 
            { 'genreno' : genreno
            }, 
        success: function(rdata) {
          var msg = ""; // 메시지 출력
          if (rdata.cnt == 1) {
              alert('삭제 성공');
              window.location.reload()
          } else {
              alert('삭제 실패');
              window.location.reload()
          }   
        },
        // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
        error: function(request, status, error) { // callback 함수
          var msg = 'ERROR request.status: '+request.status + '/ ' + error;
          console.log(msg); // Chrome에 출력
        }
      });
  }

  // ▶ 선택 결제
  function checkout_select () {
    alert('checkout_select');
  }

  var checkouts  = []; 
  
  $("input[id^='pay_proc_']:checked").each(function(){
    checkouts.push($(this).val());
    });
    alert('checkouts: ' + checkouts);


    
  // ▶ 전체 결제
  function checkout_all () {
    alert('checkout_all');
    var checkouts  = []; 

    // $("input[name='sport']:checked").
    // checkouts.push($("input[id^='pay_proc_']:checked").val());

    alert('checkouts: ' + checkouts);

    return;

    $('input[id^="pay_proc_"]');

    $.ajax({
      url : "../pay/create.do",
      type : "post",
      cache : false,
      async : false,
      processData: false, // multifile 객체 전송시 필요
      contentType: false, // multifile 객체 전송시 필요   
      dataType : "json",
      data : checkouts,
      success : function(rdata) {
          if (rdata.cnt >= 1) {
              alert('등록 성공');
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

    
    

    
    

    
  }
  

/*   $('#selectall').change(function () {
    alert('chagne 실행');
	    if ($(this).prop('checked')) {
	        $('input:checkbox[id^="pay_proc_"]').prop('checked', true);
	    } else {
		    $('input:checkbox[id^="pay_proc_"]').prop('checked', false);
	    }
	}); */
		
	// $('#selectall').trigger('change');
	

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
					    <col style='width: 15%;'/>
					    <col style='width: 25%;'/>
					  </colgroup>
					  
					  <thead>  
					  <TR >
					    <TH style="text-align: center;"> 
					          <div class=" sign__group--checkbox" style = "width: 80%; display:inline; " >
                                   <input id="selectall" name="selectall" type="checkbox" checked="checked" value="${filmno }"> 
                                   <label for="selectall">　</label>
                              </div>
					    </TH>
					    <TH style="text-align: center;">영화</TH>
					    <TH style="text-align: center;">가격</TH>
					    <TH style="text-align: center;"></TH>
					  </TR>
					  </thead>    
					          
					  <tbody>
					  <c:forEach var="VO" items="${list }">  <!-- refaqt 객체에 접근 -->
                        <c:set var="cartno" value="${VO.cartno}" />
                        <c:set var="filmno" value="${VO.filmno}" />
                        
					    <TR >
					      <TD class=" " style="text-align: center;">
    					      <div class=" sign__group--checkbox" style = "width: 80%; display:inline; " >
	       				           <input id="pay_proc_${filmno }" name="checkout"  type="checkbox" checked="checked" value="${filmno }"> 
	       				           <label for="pay_proc_${filmno }" >　</label>
	       				      </div>
					      </TD>
					      <TD style="text-align: center;" class='clickable-row' data-href= "../film/read.do?filmno=${filmno }">
					           <span style="margin: 0px;">${filmno }</span>
					      </TD>
					      <TD style="text-align: center;">
					           <span style="margin: 0px;">  </span>
					      </TD>
					      <TD style="text-align: center;"> 
                              <button onclick="pay_proc('${filmno}')" id="btn_pay_proc_${filmno }"  name="btn_delete_proc_${filmno }"  style="width:25%; height:100%; margin: 0px; display: inline-block;">구매</button>
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
					           총　　건
					      </TD>
					      
					      <TD style="text-align: center; pointer-events: auto;">
					           총　　원
					      </TD>
					      
					      <TD style="text-align: center; pointer-events: auto;" >
                          </TD>
					      
					      <TD style="text-align: center; width:100%; " > 
					           <button id="btn_checkout_select"  name="btn_checkout_select" style="width:25%; height:100%; margin: 0px; display: inline-block;">
					               <p>선택결제</p>
					           </button>
					           <button id="btn_checkout_all"  name="btn_checkout_all"  style="width:25%; height:100%; margin: 0px; display: inline-block;">
					               <p>전체결제</p>
					           </button>
					      </TD>
					      
					    </TR>
					  </tbody>
					  </TABLE>
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