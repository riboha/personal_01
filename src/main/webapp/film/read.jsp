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


    // ▶ 영화 레코드 수정 폼
	function update_form () {
    $("input[name='titleen']").attr("readonly", false);
    $("input[name='titlekr']").attr("readonly", false);
    $("input[name='lan']").attr("readonly", false);
    $("input[name='year']").attr("readonly", false);
    $("input[name='len']").attr("readonly", false);
    $("input[name='restrict']").attr("readonly", false);
    $("input[name='dirno']").attr("readonly", false);
    $("input[name='summary']").attr("readonly", false);
    $("input[name='youtube']").attr("readonly", false);
    $("input[name='url']").attr("readonly", false);
    // ("input[name='posterMF']").attr("readonly", false);

    document.getElementById("btn_update_form").style.display = "none";
    document.getElementById("btn_update_proc").style.display = "inline-block";
    document.getElementById("btn_update_proc").style.width = "49%";
    // document.getElementById("posterMFdiv").style.display = "inline";
    document.getElementById("btn_delete").style.display = "none";
    
    document.getElementById("btn_cancel").style.width = "49%";
    document.getElementById("btn_cancel").onclick = "window.location.reload();";
    document.getElementById("btn_cancel").onclick = "window.location.reload();";

    $('#btn_cancel').attr("onclick",  "window.location.reload();");

	}


    // ▶ 영화 레코드 수정 실행
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

		var filmno = ${filmVO.filmno};
		alert('filmno; ' + filmno);
		$.ajax({
	      url: "./delete.do", 
	      type: "post",          
	      cache: false,          // 브러우저의 캐시영역 사용안함.
	      async: true,           // true: 비동기
	      dataType: "json",   
	      data: {'filmno':filmno}, 
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
	<section class="section section--first section--bg" data-bg="img/section/section.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section__wrap">
						<!-- section title -->
						<h2 class="section__title">영화 조회</h2>
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
					    <form id = 'frm' name = 'frm' class="sign__form" style="width:100%;" method='POST' action="./update.do" enctype="multipart/form-data" >
							<div class="faq" style="width:100%;">
							    <div class="sign__group" style="text-align: center; top: 0;">
                                    <img src="poster/${filmVO.poster} " style ="margin: 0px; width:35%; text-align: center;" alt=""> 
                                </div>
			                    <div class="sign__group" >
			                        <input type="hidden"  id='filmno' name='filmno' class=" sign__input " style = "width: 80%; display:inline;" value="${filmVO.filmno }" required="required" >
			                    </div>
			                    <div class="sign__group" >
				                    <label class="col-md-2 feature__text  sign__input "  
				                            style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 18px;  margin: 0px ; padding: 10px; display:inline; " > 영문 제목 </label>
			                        <input type="text"  id='titleen' name='titleen' class=" sign__input " style = "width: 80%; display:inline;" value="${filmVO.titleen }" required="required" readonly="readonly">
			                    </div>
			                    
			                    <div class="sign__group " >
				                    <label class=" col-md-2 feature__text  sign__input "   style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 한글 제목 </label>
			                        <input type="text"  id='titlekr' name='titlekr' class="sign__input " style = "width: 80%; display:inline;" value="${filmVO.titlekr }"  required="required" readonly="readonly">
			                    </div>
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 언어 </label>
			                        <input type="text"  id='lan' name='lan' class="sign__input" style = "width: 80%; display:inline;" value="${filmVO.lan }"  required="required" readonly="readonly">
			                    </div>
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7); width: 80%;" > 년도 </label>
			                        <input type="text"  id='year' name='year' class="sign__input" style = "width: 80%; display:inline;" value="${filmVO.year }"  required="required" readonly="readonly">
			                    </div>
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 길이 </label>
			                        <input type="text"  id='len' name='len' class="sign__input" style = "width: 80%; display:inline;" value="${filmVO.len }"  required="required" readonly="readonly">
			                    </div>
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 연령가 </label>
			                        <input type="text"  id='restrict' name='restrict' class="sign__input" style = "width: 80%; display:inline;" value="${filmVO.restrict }"  required="required" readonly="readonly">
			                    </div>
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 감독 </label>
			                        <input type="text"  id='dirno' name='dirno' class="sign__input" style = "width: 80%; display:inline;" value="${filmVO.dirno }"  required="required" readonly="readonly">
			                    </div>
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 내용 </label>
								    <textarea id='summary' name='summary'  class="sign__input"  style = "width: 80%; display:inline;" rows="60" cols="60"  required="required" readonly="readonly">${filmVO.summary }</textarea>
								</div>
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > Youtube </label>
			                        <input type="text"  id='youtube' name='youtube' class="sign__input" style = "width: 80%; display:inline;" value="${filmVO.youtube }"  readonly="readonly">
			                    </div>
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > URL </label>
			                        <input type="text"  id='url' name='url' class="sign__input" style = "width: 80%; display:inline;" value="${filmVO.url }"  readonly="readonly">
			                    </div>
			                    <div class="sign__group "  id='posterMFdiv'  >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 포스터 </label>
			                        <input type="file"  id='posterMF' name='posterMF' class="sign__input" style = "width: 80%;  display:inline;" value=""  >
			                    </div>

	                            <div class="sign__group " >
			                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 지원 언어 </label>
		                            <div class="sign__group sign__group--checkbox" style = "width: 80%; display:inline;">
		                                <input id="kr" name="kr" type="checkbox" value="${languageVO.kr }"> <label for="kr">KR</label>　
		                                <input id="en" name="en" type="checkbox" checked="checked" value="${languageVO.en }"> <label for="en">EN</label> 　
		                                <input id="es" name="es" type="checkbox" checked="checked" value="${languageVO.es }"> <label for="es">ES</label> 　
		                                <input id="fr" name="fr" type="checkbox" checked="checked" value="${languageVO.fr }"> <label for="fr">FR</label> 　
		                                <input id="pt" name="pt" type="checkbox" checked="checked" value="${languageVO.pt }"> <label for="pt">PT</label> 　
		                                <input id="rs" name="rs" type="checkbox" checked="checked" value="${languageVO.rs }"> <label for="rs">RS</label> 　
		                                <input id="ar" name="ar" type="checkbox" checked="checked" value="${languageVO.ar }"> <label for="ar">AR</label> 　
		                                <input id="hi" name="hi" type="checkbox" checked="checked" value="${languageVO.hi }"> <label for="hi">HI</label> 　
		                                <input id="de" name="de" type="checkbox" checked="checked" value="${languageVO.de }"> <label for="de">DE</label> 　
		                                <input id="jp" name="jp" type="checkbox" checked="checked" value="${languageVO.jp }"> <label for="jp">JP</label> 　
		                                <input id="ch" name="ch" type="checkbox" checked="checked" value="${languageVO.ch }"> <label for="ch">CH</label>
		                            </div>
	                            </div>
	                            
	                            <div class="sign__group " >
	                            <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 지원 화질 </label>
		                            <div class="sign__group sign__group--checkbox" style = "width: 80%; display:inline; margin:0px; padding: 0px;" >
	                                    <input id="q576" name="quality" type="checkbox" checked="checked" value="${qualityVO.q576 }"> <label for="q576">576</label> 　
	                                    <input id="q720" name="quality" type="checkbox" checked="checked" value="${qualityVO.q720 }"> <label for="q720">720</label> 　
	                                    <input id="q1024" name="quality" type="checkbox" checked="checked" value="${qualityVO.q1024 }"> <label for="q1024">1024</label> 　
	                                    <input id="q1440" name="quality" type="checkbox" checked="checked" value="${qualityVO.q1440 }"> <label for="q1440">1440</label>
	                                </div>      
                                </div>      

			                    <div class="col-md-12 sign__group " style="width: 100%; ">
    								<button class="sign__btn"  id='btn_update_form' name="btn_update_form"  type="button"  style = "width:32%; display: inline-block; margin: 3px;">수정 모드</button>
    								<button class="sign__btn"  id='btn_update_proc' name="btn_update_proc"  type="button"  style = "width:32%; display: none; margin: 3px;">수정 저장</button>
    								<button class="sign__btn"  id='btn_delete' name="btn_delete"  type="button"  style = "width:32%; display: inline-block; margin: 3px;">삭제</button>
    								<button class="sign__btn"  id='btn_cancel' name="btn_cancel"  type="button"  style = "width:32%; display: inline-block; margin: 3px; " onclick="location.href='./list.do'"> 취소 </button>
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