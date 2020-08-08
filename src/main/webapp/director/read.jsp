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
	});


	// ▶ 수정 폼으로 변경 (태그 변경)
	function update_form (){
		document.getElementById("btn_update_form").style.display="none";
		document.getElementById("btn_update_proc").style.display = "inline";
		document.getElementById("btn_delete").style.display = "none";
		document.getElementById("btn_update_cancel").style.display = "inline";
	  
		$("input[name='dirnameen']").attr("readonly", false);
		$("input[name='dirnamekr']").attr("readonly", false);
		$("input[name='dirnation']").attr("readonly", false);
	}


	// ▶ 수정 실행
	function update_proc (){
		var frm = $('#frm');
		var params = $('#frm').serialize();
		// alert('params: '+ params);
		$.ajax({
			type : "post",
			url : "./update.do",
		    cache : false,
		    dataType : "json",
		    async : false,
		    data : params,
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


	// ▶ 삭제 실행
	function delete_proc (dirno){

		alert('dirno: ' + dirno);
	    $.ajax({
	      url: "./delete.do", 
	      type: "post",          
	      cache: false,          // 브러우저의 캐시영역 사용안함.
	      async: true,           // true: 비동기
	      dataType: "json",   
	      data: {'dirno':dirno}, 
	      success: function(rdata) {
	        var msg = ""; // 메시지 출력
	        if (rdata.cnt == 1) {
	            // $('#btn_dir_delete_frm_close').trigger("click"); // 삭제폼 닫기, click 강제 발생 
	            alert('삭제 성공');
	            location.href='./list.do'
	        } else {
	            // $('#btn_dir_delete_frm_close').trigger("click"); // 삭제폼 닫기, click 강제 발생 
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
	
	</script>
	

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
	<section class="section" style="padding-top: 10px;">
		<div class="container" >
			<div class="row" style="padding-top: 0px;">
				    <div class="sign__content" style="top: 0px;">
					    
					    <form id = 'frm' name = 'frm' class="sign__form" method='POST' action="./director/create.do" style="">
						
							<div class="sign__group" style="text-align: center; top: 0;">
							    <img src="prof/${directorVO.dirthumb} " style ="width: 200px; border-radius: 50%; margin: 0px; text-align: center;" alt=""> 
							</div>
							
							<div class="sign__group" >
							     <label  class="feature__title" style="display: inline; margin-right: 10px;">　번호　</label>
								<input type="text"  id='dirno' name='dirno' class="sign__input" value="${directorVO.dirno }" readonly="readonly">
							</div>
							
							<div class="sign__group">
								<label  class="feature__title" style="display: inline; margin-right: 10px;">　이름　</label>
								<input type="text"  id='dirnameen' name='dirnameen' class="sign__input" value="${directorVO.dirnameen }" readonly="readonly" placeholder="영문 이름"> <br>
								<label  class="feature__title" style="display: inline; margin-right: 10px;">　　　　</label>
								<input type="text"  id='dirnamekr' name='dirnamekr' class="sign__input" value="${directorVO.dirnamekr }" readonly="readonly" placeholder="한글 이름">
							</div>
							
							<div class="sign__group">
    							<label  class="feature__title" style="display: inline; margin-right: 10px;">　국적　</label>
								<input type="text"  id='dirnation' name='dirnation' class="sign__input" value="${directorVO.dirnation }" readonly="readonly" placeholder="국적">
							</div>
							
							<div class="sign__group">
    							<label  class="feature__title" style="display: inline; margin-right: 10px;">작품수　</label>
								<input type="text"  id='' name='' class="sign__input" value="${directorVO.dirno }" readonly="readonly">
							</div>
							
                            <div class="sign__group" style="width:100%;">
                                <button class="sign__btn" style="display: inline; width:49%; margin-right: 1px;" id='btn_update_form' name='btn_update_form' onclick="update_form();" type="button">수정</button>
								<button class="sign__btn" style="display: none ; width:49%; margin-right: 1px;" id='btn_update_proc' name='btn_update_proc' onclick="update_proc();" type="button">저장</button>
								<button class="sign__btn" style="display: inline; width:49%; margin-left: 1px; " id='btn_delete' name='btn_delete'  onclick="delete_proc('${directorVO.dirno}');" type="button" >삭제</button> 
								<button class="sign__btn" style="display: none; width:49%; margin-left: 1px; " id='btn_update_cancel' name='btn_update_cancel'  onclick="window.location.reload();" type="button" >취소</button> 
                            </div>
						</form>
					</div >
			</div>
		</div>
	</section>
	<!-- end faq -->
	
	<!-- JS -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.mousewheel.min.js"></script>
	<script src="js/jquery.mCustomScrollbar.min.js"></script>
	<script src="js/wNumb.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/plyr.min.js"></script>
	<script src="js/jquery.morelines.min.js"></script>
	<script src="js/photoswipe.min.js"></script>
	<script src="js/photoswipe-ui-default.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>