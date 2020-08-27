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

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
    <!-- jQuery Datepicker -->

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
    
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		
	<script type="text/javascript">
	$(function() {
	  $('#btn_create').on('click', create);
	});

	var check_id_result = 0; // 아이디 중복 체크 여부
	var check_nick_result = 0; // 닉네임 중복 체크 여부
	var check_tel_result = 0; // 전화번호 중복 체크 여부
	var check_email_result = 0; // 이메일 중복 체크 여부

	// ▶ 아이디 실시간 중복 체크
	function check_id () {
	    $('#check_id_div').css('display', 'block');
	    $('#id_div').css('margin-bottom', '0px');
	
	    if ($('#id').val().length == 0) {
	        $('#check_id_msg').val('아이디를 입력해주세요.');
	        $('#check_id_msg').css('color', 'red');
	        return;
	    }
	    $.ajax({
	        url : "./findduplicate_by_id.do",
	        type : "post",
	        cache : false,
	        dataType : "json",
	        data : {'id': $('#id').val()},
	        success : function(rdata) {
	            if (rdata.id_duplicated >= 1) {
	                $('#check_id_msg').val('사용중인 닉네임입니다.');
	                $('#check_id_msg').css('color', 'red');
	                check_id_result = 0;
	            } else {
	                $('#check_id_msg').val('사용 가능한 닉네임입니다.');
	                $('#check_id_msg').css('color', 'green');
	                check_id_result = 1;
	            }
	          },
	          error : function(request, status, error) {
	              var msg = 'ERROR<br><br>';
	              msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
	              msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
	              console.log(msg);
	              return false;
	          }
	      });
	}
	
	// ▶ 닉네임 실시간 중복 체크
	function check_nick () {
	    $('#check_nick_div').css('display', 'block');
	    $('#nick_div').css('margin-bottom', '0px');
	
	    if ($('#nick').val().length == 0) {
	        $('#check_nick_msg').val('닉네임을 입력해주세요.');
	        $('#check_nick_msg').css('color', 'red');
	        return;
	    }
	    
	    $.ajax({
	        url : "./findduplicate_by_nick.do",
	        type : "post",
	        cache : false,
	        dataType : "json",
	        data : {'nick': $('#nick').val()},
	        success : function(rdata) {
	            if (rdata.nick_duplicated >= 1) {
	                $('#check_nick_msg').val('사용중인 닉네임입니다.');
	                $('#check_nick_msg').css('color', 'red');
	                check_nick_result = 0;
	            } else {
	                $('#check_nick_msg').val('사용 가능한 닉네임입니다.');
	                $('#check_nick_msg').css('color', 'green');
	                check_nick_result = 1;
	            }
	          },
	          error : function(request, status, error) {
	              var msg = 'ERROR<br><br>';
	              msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
	              msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
	              console.log(msg);
	              return false;
	          }
	      });
	}
	
	// ▶ 전화번호 실시간 중복 체크
	function check_tel () {
	    $('#check_tel_div').css('display', 'block');
	    $('#tel_div').css('margin-bottom', '0px');
	
	    if ($('#tel').val().length >=12 || $('#tel').val().length <= 9) {
	        $('#check_tel_msg').val('알맞은 번호 형식이 아닙니다.');
	        $('#check_tel_msg').css('color', 'red');
	        check_tel_result = 0;
	        return; 
	    }
	    
	    $.ajax({
	        url : "./findduplicate_by_tel.do",
	        type : "post",
	        cache : false,
	        // async : false,
	        dataType : "json",
	        data : {'tel': $('#tel').val()},
	        success : function(rdata) {
	            if (rdata.tel_duplicated >= 1) {
	                $('#check_tel_msg').val('사용중인 번호입니다.');
	                $('#check_tel_msg').css('color', 'red');
	                check_tel_result = 0;
	            } else {
	                $('#check_tel_msg').val('사용 가능한 번호입니다.');
	                $('#check_tel_msg').css('color', 'green');
	                check_tel_result = 1;
	            }
	          },
	          error : function(request, status, error) {
	              var msg = 'ERROR<br><br>';
	              msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
	              msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
	              console.log(msg);
	              return false;
	          }
	      });
	}
	// ▶ 이메일 실시간 중복 체크
	function check_email () {
	    $('#check_email_div').css('display', 'block');
	    $('#email_div').css('margin-bottom', '0px');
	    
	    if ($('#email').val().length == 0) {
	        $('#check_email_msg').val('이메일을 입력해주세요.');
	        $('#check_email_msg').css('color', 'red');
	        return;
	    }
	    $.ajax({
	        url : "./findduplicate_by_email.do",
	        type : "post",
	        cache : false,
	        // async : false,
	        dataType : "json",
	        data : {'email': $('#email').val()},
	        success : function(rdata) {
	            if (rdata.email_duplicated >= 1) {
	                $('#check_email_msg').val('사용중인 메일입니다.');
	                $('#check_email_msg').css('color', 'red');
	                check_email_result = 0;
	            } else {
	                $('#check_email_msg').val('사용 가능한 메일입니다.');
	                $('#check_email_msg').css('color', 'green');
	                check_email_result = 1;
	            }
	          },
	          error : function(request, status, error) {
	              var msg = 'ERROR<br><br>';
	              msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
	              msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
	              console.log(msg);
	              return false;
	          }
	      });
	}


	// ▶ 회원 레코드 등록
	function create () {

		if (check_id_result == 0) {alert('아이디를 확인해주세요'); return; }
		if (check_nick_result == 0) {alert('닉네임을 확인해주세요'); return; }
	    if (check_tel_result == 0) {alert('전화번호를 확인해주세요'); return; }
	    if (check_email_result == 0) {alert('이메일을 확인해주세요'); return; }
	
	    if ($('#id').val()=='') { alert('아이디를 입력해주세요'); return; }
	    if ($('#pw').val()=='' || $('#pw2').val()==''  ) { alert('비밀번호를 입력해주세요'); return; }
	    if ($('#tel').val()=='') { alert('전화번호를 입력해주세요'); return; }
	    if ($('#email').val()=='') { alert('이메일을 입력해주세요'); return; }
	    if ($('#nick').val()=='') { alert('닉네임을 입력해주세요'); return; }
	    if ($('#birth').val()=='') { alert('생일을 입력해주세요'); return; }
	
        if ($('#pw').val() != $('#pw2').val()) { alert('비밀번호가 일치하지 않습니다.'); return; }

		var frm = $('#frm')[0];
		var formData = new FormData(frm);
		
		$.ajax({
			url : "./create.do",
			type : "post",
		    cache : false,
		    async : false,
	        processData: false, // multifile 객체 전송시 필요
	        contentType: false, // multifile 객체 전송시 필요   
		    dataType : "json",
		    data : formData,
		    success : function(rdata) {
		        if (rdata.cnt >= 1) {
			        alert('가입을 축하합니다!');
			        if (confirm('로그인 하러 갈까요?')) {
				        location.href="${root}/member/signin.do"
				    } else {
				        location.href="${root}/index.do"
					}
			    } else {
			        alert('가입 실패');
				}
		    },
		    error : function(request, status, error) {
			    alert('오류 발생. 고객 센터에 문의해주세요.');
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
						<h2 class="section__title">회원 가입</h2>
						<!-- end section title -->

						<!-- breadcrumb -->
						<ul class="breadcrumb">
							<li class="breadcrumb__item"><a href="#">Home</a></li>
							<li class="breadcrumb__item breadcrumb__item--active">회원 가입</li>
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
					        <h3 class="faq__title">회원 가입</h3>
							<div class="faq" style="width: 100%;">
							
							    <div id="id_div" class="sign__group" >
                                    <label class="feature__text  sign__input"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">아이디</label>
                                    <input type="text"  id='id' name='id' class="sign__input"  style="margin: 0px; font-size:15px;" oninput="check_id();" required="required">
                                </div>
                                <div id="check_id_div" class="sign__group" style="margin-bottom:0px; display:none;">
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); margin:0px;  float: left; width:150px;"></label>
                                    <input type="text"  id='check_id_msg' name='check_id_msg' class="sign__input"  style="background-color:transparent; font-size:12px;" value="" readonly="readonly">
                                </div>
    							
							    <div class="sign__group" >
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">비밀번호</label>
                                    <input type="text"  id='pw' name='pw' class="sign__input" style="margin: 0px; font-size:15px;" required="required">
                                </div>

							    <div class="sign__group" >
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">비밀번호 확인</label>
                                    <input type="text"  id='pw2' name='pw2' class="sign__input" style="margin: 0px; font-size:15px;" required="required">
                                </div>
    							
							    <div class="sign__group" style="">
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">닉네임</label>
                                    <input type="text"  id='nick' name='nick' class="sign__input"  style="font-size: 15px;" oninput="check_nick();" required="required">
                                </div>
                                <div id="check_nick_div" class="sign__group" style="margin-bottom:0px; display:none;">
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); margin:0px;  float: left; width:150px;"></label>
                                    <input type="text"  id='check_nick_msg' name='check_nick_msg' class="sign__input"  style="background-color:transparent; font-size:12px;" value="" readonly="readonly">
                                </div>
    							
							    <div class="sign__group" >
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">생년월일</label>
                                    <input type="text"  id='birth' name='birth' class="sign__input"  style="font-size: 15px;" required="required">
                                </div>
    							
							    <div id="tel_div" class="sign__group" >
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">전화번호</label>
                                    <input type="text"  id='tel' name='tel' class="sign__input"  style="font-size: 15px;"  value=""  oninput="check_tel();" >
                                </div>
                                <div id="check_tel_div" class="sign__group" style="margin-bottom:0px; display:none;">
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); margin:0px;  float: left; width:150px;"></label>
                                    <input type="text"  id='check_tel_msg' name='check_tel_msg' class="sign__input"  style="background-color:transparent; font-size:12px;" value="" readonly="readonly">
                                </div>

							    <div id="email_div" class="sign__group" >
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">이메일</label>
                                    <input type="text"  id='email' name='email' class="sign__input"  style="font-size: 15px;"oninput="check_email();"  >
                                </div>
                                <div id="check_email_div" class="sign__group" style="margin-bottom:0px; display:none;">
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); margin:0px;  float: left; width:150px;"></label>
                                    <input type="text"  id='check_email_msg' name='check_email_msg' class="sign__input"  style="background-color:transparent; font-size:12px;" value="" readonly="readonly">
                                </div>
    							
							    <div class="sign__group" >
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">프로필</label>
                                    <input type="file"  id='mempicMF' name='mempicMF' class=" sign__input " style = "display:inline; "  >
    							</div>

    							
							    
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


</body>

</html>