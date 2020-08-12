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
	var genrelist =  [];
	$("input:checkbox[name=genrevolist]:checked").each(function(){
	  genrelist.push($(this).val());
    });
  alert('genrelist' + genrelist);
	   // $('#btn_create').click(function(){
		var frm = $('#frm')[0];
		var formData = new FormData(frm);
		
		alert('formData: '+ formData);


		$.ajax({
			url : "./create.do",
			type : "post",
		    cache : false,
		    async : false,
	        processData: false, // multifile 객체 전송시 필요
	        contentType: false, // multifile 객체 전송시 필요   
		    dataType : "json",
		    data : {"formData": formData, "genrelist" : genrelist},
		    success : function(rdata) {
		        if (rdata.cnt >= 1) {
			        alert('등록 성공');
			        location.href='${root}/movie/film/read.do?filmno='+rdata.filmno;
			    } else {
			        alert('등록 실패');
			        // location.href='${root}/movie/film/list.do';
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
					    <form id = 'frm' name = 'frm' class="sign__form" style="width:100%;" method='POST' action="./create.do" enctype="multipart/form-data" >
					        <h3 class="faq__title">영화 등록</h3>
							<div class="faq" style="width:100%;">
							
							     <!-- 
			                    <div class="sign__group" >
				                    <label class="col-md-2 feature__text  sign__input "  
				                            style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 18px;  margin: 0px ; padding: 10px; display:inline; " > 영문 제목 </label>
			                        <input type="text"  id='titleen' name='titleen' class=" sign__input " style = "width: 80%; display:inline;"  placeholder="" >
			                    </div>
			                    <div class="sign__group " >
				                    <label class=" col-md-2 feature__text  sign__input "   style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 한글 제목 </label>
			                        <input type="text"  id='titlekr' name='titlekr' class="sign__input " style = "width: 80%; display:inline;"   placeholder="">
			                    </div>
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 언어 </label>
			                        <input type="text"  id='lan' name='lan' class="sign__input" style = "width: 80%; display:inline;" placeholder="">
			                    </div>
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7); width: 80%;" > 년도 </label>
			                        <input type="text"  id='year' name='year' class="sign__input" style = "width: 80%; display:inline;" placeholder="">
			                    </div>
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 길이 </label>
			                        <input type="text"  id='len' name='len' class="sign__input" style = "width: 80%; display:inline;"  placeholder="">
			                    </div>
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 연령가 </label>
			                        <input type="text"  id='restrict' name='restrict' class="sign__input" style = "width: 80%; display:inline;" placeholder="">
			                    </div>
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 감독 </label>
			                        <input type="text"  id='dirno' name='dirno' class="sign__input" style = "width: 80%; display:inline;" placeholder="">
			                    </div>
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 내용 </label>
								    <textarea id='summary' name='summary'  class="sign__input"  style = "width: 80%; display:inline;" rows="60" cols="60" placeholder=""></textarea>
								</div>
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > Youtube </label>
			                        <input type="text"  id='youtube' name='youtube' class="sign__input" style = "width: 80%; display:inline;" placeholder="">
			                    </div>
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > URL </label>
			                        <input type="text"  id='url' name='url' class="sign__input" style = "width: 80%; display:inline;" placeholder="">
			                    </div>
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 포스터 </label>
			                        <input type="file"  id='posterMF' name='posterMF' class="sign__input" style = "width: 80%; display:inline;" placeholder="">
			                    </div>

	                            <div class="sign__group " >
			                        <label class="col-md-2  feature__text  sign__input"   style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 지원 언어 </label>
		                            <div class="sign__group sign__group--checkbox" style = "width: 80%; display:inline;" >
		                                <input id="kr" name="kr" type="checkbox" checked="checked" value="1"> <label for="kr">KR</label>
		                                <input id="en" name="en" type="checkbox" checked="checked" value="1"> <label for="en">EN</label> ;
		                                <input id="es" name="es" type="checkbox" checked="checked" value="1"> <label for="es">ES</label> 
		                                <input id="fr" name="fr" type="checkbox" checked="checked" value="1"> <label for="fr">FR</label> 
		                                <input id="pt" name="pt" type="checkbox" checked="checked" value="1"> <label for="pt">PT</label> 
		                                <input id="rs" name="rs" type="checkbox" checked="checked" value="1"> <label for="rs">RS</label>
		                                <input id="ar" name="ar" type="checkbox" checked="checked" value="1"> <label for="ar">AR</label>
		                                <input id="hi" name="hi" type="checkbox" checked="checked" value="1"> <label for="hi">HI</label>
		                                <input id="de" name="de" type="checkbox" checked="checked" value="1"> <label for="de">DE</label>
		                                <input id="jp" name="jp" type="checkbox" checked="checked" value="1"> <label for="jp">JP</label>
		                                <input id="ch" name="ch" type="checkbox" checked="checked" value="1"> <label for="ch">CH</label>
		                            </div>
	                            </div>
	                            
	                            <div class="sign__group " >
	                                <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 지원 화질 </label>
		                            <div class="sign__group sign__group--checkbox" style = "width: 80%; display:inline; " >
	                                    <input id="q576" name="q576" type="checkbox" checked="checked" value="1"> <label for="q576">576</label>
	                                    <input id="q720" name="q720" type="checkbox" checked="checked" value="1"> <label for="q720">720</label>　
	                                    <input id="q1024" name="q1024" type="checkbox" checked="checked" value="1"> <label for="q1024">1024</label>　
	                                    <input id="q1440" name="q1440" type="checkbox" checked="checked" value="1"> <label for="q1440">1440</label>
	                                </div>      
                                </div>      
                                 -->
	                            <div class="sign__group " >
	                            <label class="col-md-2  feature__text "  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 장르 </label>
		                            <div class="sign__group sign__group--checkbox" style = "width: 80%; display:inline; " >
		                            <c:forEach var="list" items="${genreVO_list }">
		                            <c:set var="genreno" value="${list.genreno }"/>
		                            <c:set var="genrename" value="${list.genrename }"/>
	                                    <input id="${genrename }" name="genrevolist" type="checkbox"  value="${genreno }"> <label for="${genrename }">${genrename }</label>  　
		                            </c:forEach>
	                                </div>      
                                </div>      
                                
                                <br>
                                <br>
			                    <div class="col-md-12 sign__group " style="width: 100%; ">
    								<button class="sign__btn"  id='btn_create' name="btn_create"  type="button"  style = "width:49%; display: inline-block; margin: 3px;">등록</button>
    								<button class="sign__btn"  id='btn_create' name="btn_create"  type="button"  style = "width:49%; display: inline-block; margin: 3px; " 
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