<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" /> 

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- JS -->
        
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <!-- JavaScript-->
    <!-- <script src="../js/jquery-3.3.1.min.js"></script> -->
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

    <!-- autocomoplete library import -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600%7CUbuntu:300,400,500,700" rel="stylesheet"> 
    
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
		$('#btn_delete_form').on('click', delete_form); 
		$('#btn_delete_proc').on('click', delete_proc); 
	});

	// ▶ 삭제 폼
	function delete_form() {
		$('#delete_warn_div').css('display', 'none');
		$('#delete_from_div').css('display', 'block');
		$('#pw_div').css('display', 'block');
		$('#btn_delete_form').css('display', 'none');
		$('#btn_delete_proc').css('display', 'block');
	}

	// ▶ 삭제 실행
	function delete_proc () {
	  
	  if ($('#pw').val() == '' || $('#pw2').val() == '' ){
		  alert('비밀번호를 입력해주세요'); 
		  return;
	  }
	  
	  if ($('#pw').val() != $('#pw2').val() ){
		  alert('비밀번호가 서로 일치하지 않습니다'); 
		  return;
	  }
	  alert('pw: ' + $('#pw').val()); 
	  alert('pw2: ' + $('#pw2').val());
	
	    $.ajax({
	        url : "./delete.do",
	        type : "post",
	        cache : false,
	        async : false,
	        dataType : "json",
	        data : {'id' : '${memberVO.id}', 'pw' : $('#pw').val()},
	        success : function(rdata) {
	            if (rdata.cnt >= 1) {
		            alert('회원 탈퇴가 완료되었습니다');
		            location.href="${root}/index.do";
	            } else {
	                alert('비밀번호를 확인해주세요');
	            }
	        },
	        error : function(request, status, error) {
	          alert('비밀번호를 확인해주세요');
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
	<section class="section section--first section--bg" data-bg="../img/section/section.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section__wrap">
						<!-- section title -->
						<h2 class="section__title">내 계정</h2>
						<!-- end section title -->

						<!-- breadcrumb -->
						<ul class="breadcrumb">
							<li class="breadcrumb__item"><a href="#">Home</a></li>
							<li class="breadcrumb__item breadcrumb__item--active">내 계정</li>
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
					    <form id = 'frm' name = 'frm' class="sign__form" >
					        <h3 class="faq__title">회원 탈퇴</h3>
							<div class="faq" style="width: 100%;">
							
								 <div class="sign__group" style="text-align: center; top: 0;">
	                                <img src="prof/${memberVO.memthumb}"  id="img" style ="width: 200px; border-radius: 50%; margin: 0px; text-align: center;" onclick=""> 
	                            </div>
							
                                <div class="sign__group"   id="delete_warn_div" style="magin: 0px;">
                                    <div class="  " style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 18px;  margin-right:0px ; text-align: center;">
                                        ${memberVO.nick}님, <br> 구매 내역과 좋아요 목록은 <br> 복구할 수 없어요!
                                    </div>
                                </div>

                                <div class="sign__group"  id="delete_from_div" style="magin: 0px; display:none;">
                                    <div class="  " style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 18px;  margin-right:0px ; text-align: center;">
                                        ${memberVO.nick }님, <br>비밀번호를 입력해주세요! <br> 다음에 또 만나요 :)
                                    </div>
                                </div>

                                <div  id="pw_div" style="display:none;">
	                                <div class="sign__group" >
	                                    <input type="password"  id='pw' name='pw' class=" sign__input " style = "font-size: 12px;  " placeholder="여기에 입력해주세요" > <br>
	                                </div>
	                                <div class="sign__group"  >
	                                    <input type="password"  id='pw2' name='pw2' class=" sign__input " style = "font-size: 12px;  " placeholder="다시 입력해주세요" >
	                                </div>
                                </div>
                                
                                <input type="hidden"  id='memberno' name='memberno'  value="${sessionScope.memberno }">
                                <input onkeyup="enterkey();" type="hidden"  id="enter_event" value="" />

                               
                                <div class="sign__group"  style="width: 100%; margin: 0px;" >
                                    <button class="sign__btn"  id="btn_delete_form" name="btn_delete_form"  type="button"  style = "width:100%; display: inline-block; margin: 1px;">괜찮아요</button>
                                    <button class="sign__btn"  id="btn_delete_proc" name="btn_delete_proc"  type="button"  style = "width:100%; display: none; margin: 1px;">확인</button>
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


</body>

</html>