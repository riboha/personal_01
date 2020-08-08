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
	  $('#btn_create').on('click', create);
		
	});

	
	function create () {

	   // $('#btn_create').click(function(){
		alert('실행');
		var formData = new FormData(frm);
		
		alert('formData: '+ formData);

		$.ajax({
			url : "./create.do",
			type : "post",
		    cache : false,
		    async : false,
		    dataType : "json",
		    processData: false, // multifile 객체 전송시 필요
		    contentType: false, // multifile 객체 전송시 필요   
		    data : formData,
		    success : function(rdata) {
		        if (rdata.cnt >= 1) {
			        alert('등록 성공');
			        location.href='${root}/movie/film/read.do?filmno='+rdata.dirno;
			    } else {
			        alert('등록 실패');
			        // location.href='${root}/movie/director/list.do';
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
	<section class="section">
		<div class="container">
			<div class="row">
				<div class="col-12">
				    <div class="sign__content">
					    <form id = 'frm' name = 'frm' class="sign__form" method='POST' action="./create.do" enctype="multipart/form-data">
					        <h3 class="faq__title">감독 등록</h3>
							<div class="faq">
			                    <div class="sign__group">
			                        <input type="text"  id='dirnamekr' name='dirnamekr' class="sign__input" placeholder="한글 이름">
			                    </div>
								<div class="sign__group">
									<input type="text" id='dirnameen' name='dirnameen'  class="sign__input" placeholder="영문 이름">
								</div>
								<div class="sign__group">
									<input type="text" id='dirnation' name='dirnation' class="sign__input" placeholder="국적">
								</div>
								<div class="sign__group">
									<input type="file" id='dirphotoMF' name='dirphotoMF' class="sign__input"  placeholder="프로필 사진">
								</div>
								<div class="sign__group">
    								<button class="sign__btn"  id='btn_create' name="btn_create"  type="button" >등록</button>
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