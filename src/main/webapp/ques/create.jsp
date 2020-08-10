<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600%7CUbuntu:300,400,500,700" rel="stylesheet"> 
	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	    
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
	
	<!-- Favicons -->
	<link rel="icon" type="image/png" href="icon/favicon-32x32.png" sizes="32x32">
	<link rel="apple-touch-icon" href="icon/favicon-32x32.png">
	<link rel="apple-touch-icon" sizes="72x72" href="icon/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="icon/apple-touch-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="144x144" href="icon/apple-touch-icon-144x144.png">
	
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="Dmitry Volkov">
	<title>FlixGo â Online Movies, TV Shows & Cinema HTML Template</title>
		
	<script type="text/javascript">
  $(function() {
    $('#btn_update_form').on('click', update_form); 
    $('#btn_update_proc').on('click', update_proc); 
    
});

    
  // ▶ 문의 레코드 수정 폼
  function update_form () {

      alert('실행');
  $("input[name='questitle']").attr("readonly", false);
  $("input[name='qcateno']").attr("readonly", false);
  $("textarea[name='quescontent']").attr("readonly", false);
  $("input[name='payno']").attr("readonly", false);

  document.getElementById("btn_update_form").style.display = "none";
  document.getElementById("btn_update_proc").style.display = "inline-block";
  document.getElementById("btn_update_proc").style.width = "49%";
  // document.getElementById("posterMFdiv").style.display = "inline";
  document.getElementById("btn_delete").style.display = "none";
  
  document.getElementById("btn_cancel").style.width = "49%";
  document.getElementById("btn_cancel").onclick = "window.location.reload();";

  // $('#btn_cancel').attr("onclick",  "window.location.reload();");

  }


  // ▶ 문의 레코드 수정 실행
  function update_proc () {

     // $('#btn_create').click(function(){
      // var frm = $('#frm')[0];
      var formData = new FormData(frm);
      
      alert('formData: '+ formData);

      $.ajax({
          url : "./update.do",
          type : "post",
          cache : false,
          async : false,
          processData: false, // multifile 객체 전송시 필요
          contentType: false, // multifile 객체 전송시 필요   
          dataType : "json",
          data : formData,
          success : function(rdata) {
              if (rdata.cnt >= 1) {
                  alert('수정 성공');
                  window.location.reload();
              } else {
                  alert('수정 실패');
                  window.location.reload();
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

  // ▶ 영화 레코드 삭제   
  function delete_proc () {

      var quesno = ${quesVO.quesno};
      alert('quesno; ' + quesno);
      $.ajax({
        url: "./delete.do", 
        type: "post",          
        cache: false,          // 브러우저의 캐시영역 사용안함.
        async: true,           // true: 비동기
        dataType: "json",   
        data: {'quesno':quesno}, 
        success: function(rdata) {
          var msg = ""; // 메시지 출력
          if (rdata.cnt == 1) {
              alert('삭제 성공');
              location.href='./list.do'
          } else {
              alert('삭제 실패');
              window.location.reload();
          }   
        },
        error: function(request, status, error) { // callback 함수
          var msg = 'ERROR request.status: '+request.status + '/ ' + error;
          console.log(msg); // Chrome에 출력
        }
      });
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
						<h2 class="section__title">FAQ</h2>
						<!-- end section title -->

						<!-- breadcrumb -->
						<ul class="breadcrumb">
							<li class="breadcrumb__item"><a href="#">Home</a></li>
							<li class="breadcrumb__item breadcrumb__item--active">FAQ</li>
						</ul>
						<!-- end breadcrumb -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end page title -->

	<!-- faq -->
	<section class="section">
		<div class="container">
			<div class="row">
				<div class="col-12">
				    <div class="sign__content">
					    <form id = 'frm' name = 'frm' class="sign__form" method='POST' action="./create.do" >
					        <h3 class="faq__title">문의 등록</h3>
							<div class="faq" style="width: 100%;">
							
							    <div class="sign__group" >
                                    <label class="feature__text  sign__input "  
                                            style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 12px;  margin: 0px ; padding: 10px; display:inline; " > 　제목　 </label>
                                    <input type="text"  id='questitle' name='questitle' class=" sign__input " style = "display:inline;  font-size: 12px;  "  placeholder="" >
    							</div>
    							
							    <div class="sign__group" >
                                    <label class="feature__text  sign__input "  
                                            style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 12px;  margin: 0px ; padding: 10px; display:inline; " > 카테고리 </label>
                                    <input type="text"  id='qcateno' name='qcateno' class=" sign__input " style = "display:inline;  font-size: 12px;  "  placeholder="" >
    							</div>
                                    
							    <div class="sign__group" >
                                    <label class="feature__text  sign__input "  
                                            style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 12px;  margin: 0px ; padding: 10px; display:inline; " > 　내용　 </label>
                                    <textarea  class="sign__input "  id='quescontent' name='quescontent'  style ="height: 100px;  font-size: 12px;  " rows="" cols=""></textarea>        
                                    <!-- <input type="text"  id='keyword' name='keyword' class=" sign__input " style = "display:inline;"  placeholder="" > -->
							    </div>
    							
							    <div class="sign__group" >
                                    <label class="feature__text  sign__input "  
                                            style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 12px;  margin: 0px ; padding: 10px; display:inline; " > 결제내역 </label>
                                    <input type="text"  id='payno' name='payno' class=" sign__input " style = "display:inline;  font-size: 12px;  "  placeholder="" >
    							</div>
    							
                                <input type="hidden"  id='memberno' name='payno'  value="1">
							    
							    <div class="sign__group"  style="width: 100%; margin: 0px;" >
                                    <button class="sign__btn"  id='btn_create' name="btn_create"  type="button"  style = "width:49%; display: inline; margin: 1px; " >등록</button>
                                    <button class="sign__btn"  id='btn_create' name="btn_create"  type="button"  style = "width:49%; display: inline; margin: 1px; " 
                                                onclick="location.href='./list.do'"> 목록 </button>
                                </div>
							    
    						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end faq -->
	
<%--     <jsp:include page="/menu/partner.jsp" flush='false' />
    <jsp:include page="/menu/footer.jsp" flush='false' /> --%>

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