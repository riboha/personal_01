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

	var check_nick_result = 1; // 닉네임 중복 체크 여부
	var check_tel_result = 1; // 전화번호 중복 체크 여부
	var check_email_result = 1; // 이메일 중복 체크 여부
	
	$(function() {
		$('#btn_update_form').on('click', update_form); 
		$('#btn_update_proc').on('click', update_proc); 
		$('#btn_delete').on('click', delete_proc); 

		$( "#birth" ).datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true, 
			changeYear: true
	    });
	});

		
	  // ▶ 회원 레코드 수정 모드 폼
	  function update_form () {
		  // readonly → X
		  $('#nick').attr("readonly", false);
		  $('#birth').attr("readonly", false);
		  $('#tel').attr("readonly", false);
		  $('#email').attr("readonly", false);
	
		  // display:'none' ↔ display:'block' 
		  $('#pw_div').css('display', 'block');
		  $('#pw_new_div').css('display', 'block');
		  $('#pw_new2_div').css('display', 'block');
		  $('#mempicMF_div').css('display', 'block');
		  
		  $('#pnt_div').css('display', 'none');
	
		  // background-color: 'transparent' → rgb(43, 43, 49)
		  // 왜 inherit이 안먹을까
		  $('#nick').css('background-color', 'rgb(43, 43, 49)');
		  $('#tel').css('background-color', 'rgb(43, 43, 49) ');
		  $('#email').css('background-color', 'rgb(43, 43, 49)');
		  $('#birth').css('background-color', 'rgb(43, 43, 49)');
	
		  $('#btn_update_form').css('display', 'none');
		  $('#btn_update_proc').css({'display': 'inline', 'width': '100%'});
		  $('#btn_delete').css('display', 'none');
		  $('#btn_cancel').css('width', '49%');
		  $('#btn_cancel').attr("onclick",  "window.location.reload();");
		  
		  $('#img').attr("onclick",  "delete_img();");
	  }

	  // ▶ 닉네임 실시간 중복 체크
	  function check_nick () {
		  if ($('#nick').val() == '${VO.nick}') { return; }

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
		      // async : false,
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

	  document.querySelector("tel").addEventListener("keypress", function (e) {
	    var allowedChars = '0123456789.';
	    function contains(stringValue, charValue) {
	        return stringValue.indexOf(charValue) > -1;
	    }
	    var invalidKey = e.key.length === 1 && !contains(allowedChars, e.key)
	            || e.key === '.' && contains(e.target.value, '.');
	    invalidKey && e.preventDefault();});
    
	  // ▶ 전화번호 실시간 중복 체크
	  function check_tel () {

		  if ($('#tel').val() == '${VO.tel}') {
			  check_tel_result = 1;
			  return;
		  }

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
		  if ($('#email').val() == '${VO.email}') { return; }

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

	
	  // ▶ 회원 레코드 수정 실행
	  function update_proc () {

		  if (check_nick_result == 0) {alert('닉네임을 확인해주세요'); return; }
		  if (check_tel_result == 0) {alert('전화번호를 확인해주세요'); return; }
		  if (check_email_result == 0) {alert('이메일을 확인해주세요'); return; }

		  if ($('#tel').val()=='') { alert('전화번호를 입력해주세요'); return; }
		  if ($('#email').val()=='') { alert('이메일을 입력해주세요'); return; }
		  if ($('#nick').val()=='') { alert('닉네임을 입력해주세요'); return; }
		  if ($('#birth').val()=='') { alert('생일을 입력해주세요'); return; }

		  // 신규 비밀번호 입력 여부
	      if ($('#pw_new').val() != '' || $('#pw_new2').val() != '') {
	          if ($('#pw_new').val() != $('#pw_new2').val()) {
	              alert('신규 비밀번호가 일치하지 않습니다.');
	              return;
	          } else {
	              $('#pw').val($('#pw_new').val());
	          }
	      } else { 
		      $('#pw').val($('#pw_old').val());
	      }

		  // ▶ 기존 비밀번호 일치 확인
		  if ($('#pw_old').val() == '') {
			  alert('기존 비밀번호를 입력해주세요.'); return;
		  } else {
			  $.ajax({
				  url : "./check_pw_proc.do",
		          type : "post",
		          cache : false,
		          async : false,
		          dataType : "json",
		          data : {'id': '${VO.id}', 'pw' : $('#pw_old').val()},
		          success : function(rdata) {
		              if (rdata.count >= 1) {
			              // alert('기존 비밀번호 일치 확인');
		              } else {
			              alert('기존 비밀번호를 확인해주세요');
			              return false;
		              }
		          },
		          error : function(request, status, error) {
			          alert('기존 비밀번호를 확인해주세요');
		              var msg = 'ERROR<br><br>';
		              msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
		              msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
		              console.log(msg);
		              return false;
		          }
		      });
		  }

		  var frm = $('#frm')[0];
		  var formData = new FormData(frm);
		  
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
	                  alert('회원정보 수정 성공');
	                  window.location.reload();
	              } else {
	                  alert('회원정보 수정 실패');
	                  // window.location.reload();
	              }
	          },
	          error : function(request, status, error) {
                  alert('회원정보 수정 실패');
	              var msg = 'ERROR<br><br>';
	              msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
	              msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
	              console.log(msg);
	          }
	      });
	  }
	
	  // ▶ 회원 레코드 삭제   
	  function delete_proc () {
		  if (confirm('회원을 삭제할까요?')) {
		      $.ajax({
		        url: "./delete.do", 
		        type: "post",          
		        cache: false,
		        async: true,
		        dataType: "json",   
		        data: {'memberno':'${VO.memberno}'}, 
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
		        error: function(request, status, error) { 
		          var msg = 'ERROR request.status: '+request.status + '/ ' + error;
		          console.log(msg); 
		        }
		      });
			}
	  }

	  // ▶ 프로필 사진 삭제
	  function delete_img () {
	    if (confirm('프로필 사진을 삭제할까요?')) {
			$.ajax({
			    url: "./delete_img.do", 
			    type: "post",          
			    cache: false,          
			    async: true,           
			    dataType: "json",   
			    data: {'memberno':'${VO.memberno}'}, 
			    success: function(rdata) {
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
						<h2 class="section__title">회원 정보</h2>
						<!-- end section title -->

						<!-- breadcrumb -->
						<ul class="breadcrumb">
							<li class="breadcrumb__item"><a href="#">Home</a></li>
							<li class="breadcrumb__item breadcrumb__item--active">회원 정보</li>
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
					    <form id = 'frm' name = 'frm' class="sign__form" method='POST' enctype="multipart/form-data">
					        <h3 class="faq__title">회원 조회</h3>
							<div class="faq" style="width: 100%;">
							
								 <div class="sign__group" style="text-align: center; top: 0;">
	                                <img src="prof/${VO.memthumb}"  id="img" style ="width: 200px; border-radius: 50%; margin: 0px; text-align: center;" onclick=""> 
	                            </div>
	                           
                                <div class="sign__group"  >
                                    <label class="feature__text  sign__input"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">아이디</label>
                                    <input type="text"  id='id' name='id' class="sign__input"  style="margin: 0px; font-size:15px; background-color: transparent;"  value="${VO.id }" readonly="readonly">
                                </div>

                                <div class="sign__group"  id="pw_div" style="display:none;">
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">기존 비밀번호</label>
                                    <input type="text"  id='pw_old' name='pw_old' class="sign__input" style="margin: 0px; font-size:15px;" required="required">
                                </div>
                                
                                <div class="sign__group"  id="pw_new_div" style="display:none;">
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">신규 비밀번호</label>
                                    <input type="text"  id='pw_new' name='pw_new' class="sign__input"  style="margin: 0px; font-size:15px;" value="" >
                                </div>

                                <div id="pw_new2_div" class="sign__group" style="display:none;">
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">신규 비밀번호 확인</label>
                                    <input type="text"  id='pw_new2' name='pw_new2' class="sign__input"  style="margin: 0px; font-size:15px;" value="" >
                                </div>
                                
                                <div id="nick_div" class="sign__group" style="">
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">닉네임</label>
                                    <input type="text"  id='nick' name='nick' class="sign__input"  style="background-color: transparent; font-size: 15px;" value="${VO.nick }" oninput="check_nick();" readonly="readonly">
                                </div>
                                <div id="check_nick_div" class="sign__group" style="margin-bottom:0px; display:none;">
	                                <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); margin:0px;  float: left; width:150px;"></label>
                                    <input type="text"  id='check_nick_msg' name='check_nick_msg' class="sign__input"  style="background-color:transparent; font-size:12px;" value="" readonly="readonly">
                                </div>
                                
                                <div class="sign__group" >
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">생년월일</label>
                                    <input type="text"  id='birth' name='birth' class="sign__input"  style="background-color: transparent; font-size: 15px;" value="${VO.birth.substring(0,10) }" >
                                </div>
                                
                                <div id="tel_div" class="sign__group" >
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">전화번호</label>
                                    <input type="text"  id='tel' name='tel' class="sign__input"  style="background-color: transparent; font-size: 15px;"  value="${VO.tel }"  oninput="check_tel();" readonly="readonly">
                                </div>
                                <div id="check_tel_div" class="sign__group" style="margin-bottom:0px; display:none;">
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); margin:0px;  float: left; width:150px;"></label>
                                    <input type="text"  id='check_tel_msg' name='check_tel_msg' class="sign__input"  style="background-color:transparent; font-size:12px;" value="" readonly="readonly">
                                </div>
                                
                                <div id="email_div" class="sign__group" >
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">이메일</label>
                                    <input type="text"  id='email' name='email' class="sign__input"  style="background-color: transparent; font-size: 15px;"  value="${VO.email }" oninput="check_email();" readonly="readonly" >
                                </div>
                                <div id="check_email_div" class="sign__group" style="margin-bottom:0px; display:none;">
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); margin:0px;  float: left; width:150px;"></label>
                                    <input type="text"  id='check_email_msg' name='check_email_msg' class="sign__input"  style="background-color:transparent; font-size:12px;" value="" readonly="readonly">
                                </div>
                                
                                <div class="sign__group"  id="pnt_div">
                                    <label class="feature__text  sign__input  col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">포인트</label>
                                    <input type="text"  id='pnt' name='pnt' class="sign__input"  style = "font-size: 15px; background-color: transparent;" value="${VO.pnt }" readonly="readonly">
                                </div>
                                
                                <div class="sign__group" id='mempicMF_div' style = "display:none; ">
                                    <label class="feature__text  sign__input col-xs-1"  
                                            style="background-color:transparent; color:rgba(255,255,255,0.7); font-size:15px; margin:0px; padding:10px;  float: left; width:150px;">프로필</label>
                                    <input type="file"  id='mempicMF' name='mempicMF' class="sign__input"  style="background-color: transparent; font-size: 15px;" value=''>
                                </div>

                                <input type="hidden"  id='memberno' name='memberno'  value="${VO.memberno }">
                                <input type="hidden"  id='pw' name='pw'  value="">
                               
                                
                                <div class="sign__group"  style="width: 100%; margin: 0px;" >
                                    <button class="sign__btn"  id='btn_update_form' name="btn_update_form"  type="button"  style = "width:100%; display: inline; margin: 0px;">수정</button>
                                    <button class="sign__btn"  id='btn_update_proc' name="btn_update_proc"  type="button"  style = "width:100%; display: none; margin: 0px;">저장</button>
                                    <!-- <button class="sign__btn"  id='btn_delete' name="btn_delete"  type="button"  style = "width:32%; display: inline-block; margin: 1px;">탈퇴</button>
                                    <button class="sign__btn"  id='btn_cancel' name="btn_cancel"  type="button"  style = "width:32%; display: inline-block; margin: 1px; " onclick="location.href='./list.do'"> 취소 </button> -->
                                </div>

                                <br>

                                <div class="">
                                    <span class="sign__text" style="float:right;"> 회원 탈퇴는<a href="./delete.do?memberno=${VO.memberno }"> 여기</a>를 누르세요.</span>
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