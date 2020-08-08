<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" /> 


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
	<link rel="icon" type="${root }/image/png" href="icon/favicon-32x32.png" sizes="32x32">
	<link rel="apple-touch-icon" href="icon/favicon-32x32.png">
	<link rel="apple-touch-icon" sizes="72x72" href="${root }/icon/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="${root }/icon/apple-touch-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="144x144" href="${root }/icon/apple-touch-icon-144x144.png">
	
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="author" content="Dmitry Volkov">
	
	
	<title>FlixGo</title>
		
	<script type="text/javascript">
	$(function() {
	  // $('#dir_delete_btn').on('click', dir_delete); 
	  // $('#dir_update_btn').on('click', dir_update);
		
	});

	//▶ 장르 레코드 수정 폼
	function genre_update_form(genreno) {
	    // var params =$('#dir_delete_frm').serialize();
	    alert('genreno: ' + genreno);
	    document.getElementById("genrename_show_"+genreno).style.display="none";
	    document.getElementById("genrename_"+genreno).style.display = "block";

	    document.getElementById("btn_update_form_" + genreno) .style.display = "none";
	    document.getElementById("btn_delete_proc"+ genreno).style.display = "none";
	    document.getElementById("btn_update_proc_" + genreno).style.display = "inline-block";

	    

	}
	
	//▶ 장르 레코드 수정 실행
	function genre_update_proc(genreno) {

		var genrename = document.getElementById('genrename_' + genreno).value;
		var genreseq = document.getElementById('genreseq_' + genreno).value;

		alert('genreno: ' + genreno);
		alert('genrename: ' + genrename);
		alert('genreseq: ' + genreseq);
	    // return;
		$.ajax({
	      url: "./update.do", 
	      type: "post",          
	      cache: false,          // 브러우저의 캐시영역 사용안함.
	      async: true,           // true: 비동기
	      dataType: "json",   
	      data: 
		      { 'genreno' : genreno,
	            'genrename' : genrename,
	            'genreseq' : genreseq
		      }, 
	      success: function(rdata) {
	        var msg = ""; // 메시지 출력
	        if (rdata.cnt == 1) {
		        alert('수정 성공');
		        window.location.reload()
	        } else {
		        alert('수정 실패');
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
	
	//▶ 장르 레코드 삭제 실행
	function genre_delete_proc(genreno) {

		alert('genreno: ' + genreno);
	    // return;
		$.ajax({
	      url: "./delete.do", 
	      type: "post",          
	      cache: false,          // 브러우저의 캐시영역 사용안함.
	      async: true,           // true: 비동기
	      dataType: "json",   
	      data: 
		      { 'genreno' : genreno
		      }, 
	      success: function(rdata) {
	        var msg = ""; // 메시지 출력
	        if (rdata.cnt == 1) {
		        alert('삭제 성공');
		        window.location.reload()
	        } else {
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
						<h2 class="section__title">Genre List</h2>
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
					    <TH style="text-align: center;">장르명</TH>
					    <TH style="text-align: center;">영화수</TH>
					    <TH style="text-align: center;"></TH>
					    <TH style="text-align: center;"></TH>
					    <TH style=""></TH>
					  </TR>
					  </thead>    
					          
					  <tbody>
					  <c:forEach var="VO" items="${list }">  <!-- request 객체에 접근 -->
                        <c:set var="genreno" value="${VO.genreno}" />
					    <TR>
					      <TD style="text-align: center;"><span style="margin: 0px;">${VO.genreno}</span></TD>
					      <TD style="text-align: center;">
					       <div id="genrename_show_${genreno}"  style="display:block;" >${VO.genrename}</div>
					       <form name="frm_${genreno }"  id="frm_${genreno }" action="./update.do">
						       <input type="text" 
						                   style="background-color: rgba(255,255,255,0.08); border: none; border-bottom: none; font-family: 'Open Sans', sans-serif; font-size: 14px; display:none;" 
						                   id="genrename_${genreno}" name="genrename" value="${VO.genrename}" >
					           <input type="hidden" id="genreseq_${genreno}" name="genreseq_${genreno}"  value="${VO.genreseq}" >	                   
					           <input type="hidden" id="genreno_${genreno}" name="genreno_${genreno}" value="${genreno}" >	                   
					       </form>
					      </TD>
					      <TD style="text-align: center;"></TD>
					      <TD style="text-align: center;"></TD>
					      <TD style="text-align: center;">0</TD>
					      <TD style="text-align: center;">
						      <button onclick="genre_update_form('${genreno}')"  id="btn_update_form_${genreno }" name="btn_update_form" style="width:25%; height:100%; margin: 0px; display: inline-block;"><span class=" glyphicon glyphicon-pencil"></span></button>
						      <button onclick="genre_delete_proc('${genreno}')" id="btn_delete_proc_${genreno }"  name="btn_delete_proc_${genreno }"  style="width:25%; height:100%; margin: 0px; display: inline-block;"><span class="glyphicon glyphicon-trash"></span></button>
						      <button onclick="genre_update_proc('${genreno}')" id="btn_update_proc_${genreno }" name="btn_update_proc" style="width:25%; height:100%; margin: 0px; display: none;"><span class="glyphicon glyphicon-check"></span></button>
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

</body>

</html>