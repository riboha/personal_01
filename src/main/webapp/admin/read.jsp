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
		$('#btn_delete').on('click', delete_proc); 
		
	});

		
	  // ▶ 문의 레코드 수정 폼
	  function update_form () {
	  $("input[name='adminid']").attr("readonly", false);
	  $("input[name='adminpw']").attr("readonly", false);
	  $("input[name='admingrade']").attr("readonly", false);
	
	  document.getElementById("adminpw_show").style.display = "inline-block";

	  document.getElementById("btn_update_form").style.display = "none";
	  document.getElementById("btn_update_proc").style.display = "inline-block";
	  document.getElementById("btn_update_proc").style.width = "49%";
	  document.getElementById("btn_delete").style.display = "none";
	  
	  document.getElementById("btn_cancel").style.width = "49%";
	
	  $('#btn_cancel').attr("onclick",  "window.location.reload();");
	  $('#img').attr("onclick",  "delete_img();");
	
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

      alert('실행');
		  
	      var adminno = ${VO.adminno};
	      alert('adminno; ' + adminno);
	      $.ajax({
	        url: "./delete.do", 
	        type: "post",          
	        cache: false,          // 브러우저의 캐시영역 사용안함.
	        async: true,           // true: 비동기
	        dataType: "json",   
	        data: {'adminno':adminno}, 
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
					    <form id = 'frm' name = 'frm' class="sign__form" method='POST' action="./create.do"  enctype="multipart/form-data">
					        <h3 class="faq__title">관리자 조회</h3>
							<div class="faq" style="width: 100%;">
							
							    <div class="sign__group" >
                                    <label class="feature__text  sign__input "  
                                            style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 12px;  margin: 0px ; padding: 10px; display:inline; " >아이디</label>
                                    <input type="text"  id='adminid' name='adminid' class=" sign__input " style = "display:inline;  font-size: 12px;  " value="${VO.adminid }" readonly="readonly" >
                                </div>
                                
                                <div class="sign__group" id="adminpw_show" style = "display:none; ">
                                    <label class="feature__text  sign__input "  
                                            style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 12px;  margin: 0px ; padding: 10px; display:inline; " >비밀번호</label>
                                    <input type="text"  id='adminpw' name='adminpw' class=" sign__input " style = "display:inline;  font-size: 12px;  " value="${VO.adminpw }" readonly="readonly" >
                                </div>
                                
                                <div class="sign__group" >
                                    <label class="feature__text  sign__input "  
                                            style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 12px;  margin: 0px ; padding: 10px; display:inline; " >등급　</label>
                                    <input type="number"  id='admingrade' name='admingrade' class=" sign__input " style = "display:inline;  font-size: 12px;  " value="${VO.admingrade }"  readonly="readonly" >
                                </div>
                                
                                <input type="hidden"  id='adminno' name='adminno'  value="${VO.adminno }">
                                
                                <div class="sign__group"  style="width: 100%; margin: 0px;" >
                                    <button class="sign__btn"  id='btn_update_form' name="btn_update_form"  type="button"  style = "width:32%; display: inline-block; margin: 1px;">수정 모드</button>
                                    <button class="sign__btn"  id='btn_update_proc' name="btn_update_proc"  type="button"  style = "width:32%; display: none; margin: 1px;">수정 저장</button>
                                    <button class="sign__btn"  id='btn_delete' name="btn_delete"  type="button"  style = "width:32%; display: inline-block; margin: 1px;">삭제</button>
                                    <button class="sign__btn"  id='btn_cancel' name="btn_cancel"  type="button"  style = "width:32%; display: inline-block; margin: 1px; " onclick="location.href='./list.do'"> 취소 </button>
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