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
		$('#btn_update_form').on('click', update_form); 
		$('#btn_update_proc').on('click', update_proc); 
		$('#btn_delete').on('click', delete_proc); 
	});

		
	  // ▶ 레코드 수정 폼
	  function update_form () {

	  $("input[name='actornameen']").attr("readonly", false);
	  $("input[name='actornamekr']").attr("readonly", false);
	  $("input[name='birth']").attr("readonly", false);
	  $("input[name='nation']").attr("readonly", false);
	
	  document.getElementById("actorpicMF_div").style.display = "block";

	  document.getElementById("btn_update_form").style.display = "none";
	  document.getElementById("btn_update_proc").style.display = "inline-block";
	  document.getElementById("btn_update_proc").style.width = "49%";
	  document.getElementById("btn_delete").style.display = "none";
	  
	  document.getElementById("btn_cancel").style.width = "49%";
	
	  $('#btn_cancel').attr("onclick",  "window.location.reload();");
	  $('#img').attr("onclick",  "delete_img();");
	
	  }

	  // ▶ 레코드 수정 실행
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
	
	  // ▶ 레코드 삭제   
	  function delete_proc () {

		  alert('실행');
		  
	      var actorno = ${VO.actorno};
	      alert('actorno; ' + actorno);
	      $.ajax({
	        url: "./delete.do", 
	        type: "post",          
	        cache: false,          // 브러우저의 캐시영역 사용안함.
	        async: true,           // true: 비동기
	        dataType: "json",   
	        data: {'actorno':actorno}, 
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

	  function delete_img () {
		  alert('이미지 삭제 실행'); 
		  var actorno = ${VO.actorno};
		  
		  $.ajax({
	        url: "./delete_img.do", 
	        type: "post",          
	        cache: false,          // 브러우저의 캐시영역 사용안함.
	        async: true,           // true: 비동기
	        dataType: "json",   
	        data: {'actorno':actorno}, 
	        success: function(rdata) {
	          if (rdata.cnt == 1) {
	              alert('삭제 성공');
	              window.location.reload();
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

	// 좋아하는 배우 등록
    function fav () {
      if (confirm('좋아하는 배우로 등록할까요?')) {

        $.ajax({
          url : "../actorfav/create.do",
          type : "post",
          cache : false,
          async : false,
          dataType : "json",
          data :  {'actorno' : ${VO.actorno} },
          success : function(rdata) {
            if (rdata.needsignin == 0) {
              alert('로그인 해주세요');
              return false;
              
            } else {
              if (rdata.duplicate >= 1) {
                alert('이미 등록된 배우입니다');
                return false;
                
              } else {
                if (rdata.cnt == 0) {
                  alert('좋아하는 배우 등록 실패');
                  return false;
                  
                } else {
                  alert('좋아하는 영화 등록 성공');
                  
                  if (confirm('좋아하는 배우 목록으로 갈까요?')) {
                    location.href='../member/list_fav.do?member';
                  } else {
                    window.location.reload();
                  }
                  
                }
              }
            }
            
          },
          error : function(request, status, error) {
            alert('등록 실패');
              var msg = 'ERROR<br><br>';
              msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
              msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
              console.log(msg);
          }
        });
        
      }
    };

    function filmography () {
      alert('filmography'); 
    };

	
	</script>
	

</head>
<body class="body">
 <jsp:include page="../menu/header.jsp" flush='false' />

	<!-- page title -->
	<section class="section section--first section--bg" data-bg="../img/section/section.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section__wrap">
						<!-- section title -->
						<h2 class="section__title">배우 조회</h2>
						<!-- end section title -->

						<!-- breadcrumb -->
						<ul class="breadcrumb">
							<li class="breadcrumb__item"><a href="#">Home</a></li>
							<li class="breadcrumb__item breadcrumb__item--active"></li>
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
					        <h3 class="faq__title">배우 조회</h3>
							<div class="faq" style="width: 100%;">
							
								<div class="sign__group" style="text-align: center; top: 0;">
								    <img src="prof/${VO.actorthumb}"  id="img" style ="width: 300px; border-radius: 50%; margin: 0px; text-align: center;" onclick=""> 
	                            </div>
	                                                           
                                <!-- <div class="details__devices">
                                    <span class="details__devices-title"></span>
                                    <ul class="details__devices-list">
                                        <li><i class="icon ion-ios-heart" id="btn_pay" onclick="fav();"></i><span>좋아해요</span></li>
                                    </ul>
                                </div> -->
                                
                                <div class="details__devices" style="margin: 10px;  text-align: center;">
                                    <ul class="details__devices-list" style="padding: 0px; text-align: center;">
                                        <li><i class="icon ion-ios-heart" id="btn_pay" onclick="fav();" style="margin-left: 10px; margin-right: 10px; text-align: center;"></i><span>좋아해요</span></li>
                                        <li><i class="icon ion-ios-film" id="btn_pay" onclick="filmography();" style="margin-left: 10px; margin-right: 10px; text-align: center;"></i><span>작품보기</span></li>
                                    </ul>
                                </div>
                                
	                            
							
                                <div class="sign__group" >
                                    <label class="feature__text  sign__input "  
                                            style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 12px;  margin: 0px ; padding: 10px; display:inline; " >한글이름</label>
                                    <input type="text"  id='actornamekr' name='actornamekr' class=" sign__input " style = "display:inline;  font-size: 12px;  "  value="${VO.actornamekr }" readonly="readonly">
                                </div>
                                
                                <div class="sign__group" >
                                    <label class="feature__text  sign__input "  
                                            style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 12px;  margin: 0px ; padding: 10px; display:inline; " >영문이름</label>
                                    <input type="text"  id='actornameen' name='actornameen' class=" sign__input " style = "display:inline;  font-size: 12px;  " value="${VO.actornameen }"  readonly="readonly">
                                </div>
                                <div class="sign__group" >
                                    <label class="feature__text  sign__input "  
                                            style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 12px;  margin: 0px ; padding: 10px; display:inline; " >　생일　</label>
                                    <input type="text"  id='birth' name='birth' class=" sign__input " style = "display:inline;  font-size: 12px;  " value="${VO.birth.substring(0, 10) }"  readonly="readonly">
                                </div>
                                
                                <div class="sign__group" >
                                    <label class="feature__text  sign__input "  
                                            style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 12px;  margin: 0px ; padding: 10px; display:inline; " >　국적　</label>
                                    <input type="text"  id='nation' name='nation' class=" sign__input " style = "display:inline;  font-size: 12px;  " value="${VO.nation }"  readonly="readonly" >
                                </div>
                                
                                <div class="sign__group" id='actorpicMF_div' style = "display:none; ">
                                    <label class="feature__text  sign__input "  
                                            style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 12px;  margin: 0px ; padding: 10px; display:inline; "  >　프로필</label>
                                    <input type="file"  id='actorpicMF' name='actorpicMF' class=" sign__input " style = "display:inline;  font-size: 12px;  " readonly="readonly">
                                </div>

                                <input type="hidden"  id='actorno' name='actorno'  value="${VO.actorno }">

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
	
	<jsp:include page="../menu/partner.jsp" flush='false' />
    <jsp:include page="../menu/footer.jsp" flush='false' />


</body>

</html>