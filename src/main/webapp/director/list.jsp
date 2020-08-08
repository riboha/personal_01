<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	      
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
      
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600%7CUbuntu:300,400,500,700" rel="stylesheet"> 
	
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
	<link rel="stylesheet" href="../css/breadcrumb.css">
	

	
	<!-- Favicons -->
	<link rel="icon" type="image/png" href="icon/favicon-32x32.png" sizes="32x32">
	<link rel="apple-touch-icon" href="icon/favicon-32x32.png">
	<link rel="apple-touch-icon" sizes="72x72" href="icon/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="icon/apple-touch-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="144x144" href="icon/apple-touch-icon-144x144.png">
	
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="Dmitry Volkov">
	<title>FlixGo</title>
		
	<script type="text/javascript">
	$(function() {
	  // $('#dir_delete_btn').on('click', dir_delete); 
	  // $('#dir_update_btn').on('click', dir_update);
		
	});

	// ▶ 등록
	function create (){
		var frm = $('#frm');
		var params = $('#frm').serialize();
		alert('params: '+ params);

		$.ajax({
			type : "post",
			url : "./create.do",
		    cache : false,
		    dataType : "json",
		    async : false,
		    data : params,
		    success : function(rdata) {
		        if (rdata.cnt >= 1) {
			        alert('등록 성공');
			    } else {
			        alert('등록 실패');
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

	// ▶ 리뷰 삭제 비밀번호 입력 레이어 호출
	function dir_delete(dirno) {
	    alert('삭제 레이어 dirno: ' + dirno);
	    var dir_delete_frm = $('#dir_delete_frm');
	    $('#dirno', dir_delete_frm).val(dirno); // 삭제할 댓글 번호 저장

	    dir_delete_proc(dirno);

	    
	    // $('#dir_delete_modal').modal();               // 삭제폼 다이얼로그 출력
	}

	//▶ 감독 레코드 삭제
	function dir_delete_proc(dirno) {
	    // var params =$('#dir_delete_frm').serialize();
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
		        window.location.reload()
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
 
 
	<!-- ▼ 감독 삭제 비밀번호 입력 레이어 Modal 'dir_delete_modal' ▼-->
	<div class="modal fade" id="dir_delete_modal" role="dialog">
	  <div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">×</button>
	        <h4 class="modal-title">감독 삭제</h4><!-- 제목 -->
	      </div>
	      <div class="modal-body">
	        <form name='dir_delete_frm' id='dir_delete_frm'>
	          <input type='hidden' name='dirno' id='dirno' value=''>
	          <DIV id='modal_panel_delete_msg' style='color: #AA0000; font-size: 1.1em;'>
	           해당 감독의 레코드가 모두 삭제됩니다.
	          </DIV>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type='button' class='btn btn-danger' 
	                     onclick="dir_delete_proc(dir_delete_frm.dirno.value);">삭제</button>
	        <button type="button" class="btn btn-default" data-dismiss="modal" 
	                     id='btn_dir_delete_frm_close'>Close</button>
	      </div>
	    </div>
	  </div>
	</div> 

	<!-- page title -->
	<section class="section section--first section--bg" data-bg="../img/section/section.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section__wrap">
						<!-- section title -->
						<h2 class="section__title">Director List</h2>
						<!-- end section title -->
						
						  <!-- breadcrumb -->
                        <ul class="breadcrumb">
                            <li class="breadcrumb__item"><a href="./create.do"> 등록 </a></li>
                            <li class="breadcrumb__item breadcrumb__item--active">검색</li>
                        </ul>
                        <!-- end breadcrumb -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end page title -->

	<!-- director lsit -->
	<section class="">
		<div class="container">
			<div class="accordion__list">
			
			      <TABLE style = "width:100%; margin: 30px 25px;">
					  <colgroup>
					    <col style="width: 5%;"/>
					    <col style='width: 20%;'/>
					    <col style='width: 10%;'/>
					    <col style='width: 15%;'/>    
					    <col style='width: 20%;'/>
					    <col style='width: 15%;'/>
					  </colgroup>
					  
					  <thead>  
					  <TR >
					    <TH style="text-align: center;"><span>#</span></TH>
					    <TH style="text-align: center;">이름</TH>
					    <TH style="text-align: center;">작품수</TH>
					    <TH style="text-align: center;">국적</TH>
					    <TH style="text-align: center;"></TH>
					    <TH style=""></TH>
					  </TR>
					  </thead>    
					          
					  <tbody>
					  <c:forEach var="VO" items="${list }">  <!-- request 객체에 접근 -->
                        <c:set var="dirno" value="${VO.dirno}" />
					    <TR>
					      <TD style="text-align: center;"><span style="margin: 0px;">${dirno}</span></TD>
					      <TD style="text-align: center;">${VO.dirnamekr} <br> ${VO.dirnameen} </TD>
					      <TD style="text-align: center;">0</TD>
					      <TD style="text-align: center;">${VO.dirnation}</TD>
					      <TD style="text-align: center;">0</TD>
					      <TD style="text-align: center;">
						      <button onclick="location.href='read.do?dirno=${dirno}'" id="dir_update_btn" style="width:25%; height:100%; margin: 0px; display: inline-block;"><span class=" glyphicon glyphicon-search"></span></button>
						      <button onclick="dir_delete('${dirno}')" style="width:25%; height:100%; margin: 0px; display: inline-block;"><span class="glyphicon glyphicon-trash"></span></button>
					      </TD>             
					    </TR>
					  </c:forEach>
					  </tbody>
					  </TABLE>
			</div>
		</div>
	</section>
	<!-- end faq -->
	
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