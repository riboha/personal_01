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

	//▶ 레코드 수정 폼
	function update_form(awardno) {
	    alert('awardno: ' + awardno);
	    
	    document.getElementById("awardseq_show_"+awardno).style.display="none";
	    document.getElementById("film_show_"+awardno).style.display="none";
	    document.getElementById("year_show_"+awardno).style.display="none";
	    document.getElementById("awardname_show_"+awardno).style.display="none";
	    document.getElementById("prize_show_"+awardno).style.display="none";
	    
	    document.getElementById("awardseq_"+awardno).style.display = "block";
	    document.getElementById("film_"+awardno).style.display = "block";
	    document.getElementById("year_"+awardno).style.display = "block";
	    document.getElementById("awardname_"+awardno).style.display = "block";
	    document.getElementById("prize_"+awardno).style.display = "block";

	    document.getElementById("btn_update_form_" + awardno) .style.display = "none";
	    document.getElementById("btn_delete_proc_"+ awardno).style.display = "none";
	    document.getElementById("btn_update_proc_" + awardno).style.display = "inline-block";

	}
	
	//▶ 레코드 수정 실행
	function update_proc(awardno) {

		var awardseq = document.getElementById('awardseq_' + awardno).value;
		var year = document.getElementById('year_' + awardno).value;
		var awardname = document.getElementById('awardname_' + awardno).value;
		var prize = document.getElementById('prize_' + awardno).value;

		alert('진입');
		$.ajax({
	      url: "./update.do", 
	      type: "post",          
	      cache: false,          // 브러우저의 캐시영역 사용안함.
	      async: true,           // true: 비동기
	      dataType: "json",   
	      data: 
		      { 'awardseq' : awardseq,
	            'awardno' : awardno,
	            'year' : year,
	            'awardname' : awardname,
	            'prize' : prize,
		      }, 
	      success: function(rdata) {
	        if (rdata.cnt == 1) {
		        alert('수정 성공');
		        window.location.reload();
	        } else {
		        alert('수정 실패');
		        window.location.reload();
	        }   
	      },
	      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
	      error: function(request, status, error) { // callback 함수
	        alert('수정 실패: 에러');
	        var msg = 'ERROR request.status: '+request.status + '/ ' + error;
	        console.log(msg); // Chrome에 출력
	      }
	    });
	}
	
	//▶ 레코드 삭제 실행
	function delete_proc(awardno) {

		alert('awardno: ' + awardno);
	    // return;
		$.ajax({
	      url: "./delete.do", 
	      type: "post",          
	      cache: false,          // 브러우저의 캐시영역 사용안함.
	      async: true,           // true: 비동기
	      dataType: "json",   
	      data: 
		      { 'awardno' : awardno
		      }, 
	      success: function(rdata) {
	        if (rdata.cnt == 1) {
		        alert('삭제 성공');
		        window.location.reload();
	        } else {
		        alert('삭제 실패');
		        window.location.reload();
	        }   
	      },
	      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
	      error: function(request, status, error) { // callback 함수
		      alert('삭제 실패');
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
	<section class="section section--first section--bg" data-bg="../img/section/section.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section__wrap">
						<!-- section title -->
						<h2 class="section__title">Q Cate List</h2>
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
					    <col style="width: 10%;"/>
					    <col style='width: 25%;'/>
					    <col style='width: 25%;'/>
					    <col style='width: 25%;'/>
					    <col style='width: 15%;'/>
					  </colgroup>
					  
					  <thead>  
					  <TR >
					    <TH style="text-align: center;"><span>#</span></TH>
					    <TH style="text-align: center;">출력 순서</TH>
					    <TH style="text-align: center;">제목</TH>
					    <TH style="text-align: center;">아이콘</TH>
					    <TH style="text-align: center;"></TH>
					  </TR>
					  </thead>    
					          
					  <tbody>
					  <c:forEach var="VO" items="${list }">  <!-- request 객체에 접근 -->
                        <c:set var="qcateno" value="${VO.qcateno}" />
                        
					    <TR>
					      <TD style="text-align: center;">
					           <span style="margin: 0px;">${qcateno}</span>
					      </TD>
					      
					      <TD style="text-align: center;">
					           <%-- <span style="margin: 0px;">${VO.keywordseq}</span> --%>
						       <div id="awardseq_show_${qcateno}"  style="display:block; margin: 0px;" >${VO.qcateseq}</div>
					           <input type="number" style="background-color: rgba(255,255,255,0.08); border: none; border-bottom: none; font-family: 'Open Sans', sans-serif; font-size: 14px; display:none; margin: 0px;" 
                                           id="awardseq_${qcateno}" name="awardseq_${qcateno}"  value="${VO.qcateseq}" min="1" >
					      </TD>
					      
					      <TD style="text-align: center;">
						       <div id="film_show_${qcateno}"  style="display:block;" >${VO.qcatetitle}</div>
						       <input type="text" style="background-color: rgba(255,255,255,0.08); border: none; border-bottom: none; font-family: 'Open Sans', sans-serif; font-size: 14px; display:none;" 
						                   id="film_${qcateno}" name="film_${qcateno}"   value="${VO.qcateno}" >
					      </TD>
					      
					      <TD style="text-align: center;">
						       <div id="year_show_${qcateno}"  style="display:block;" >${VO.qcateicon}</div>
						       <input type="text" style="background-color: rgba(255,255,255,0.08); border: none; border-bottom: none; font-family: 'Open Sans', sans-serif; font-size: 14px; display:none;" 
						                   id="year_${qcateno}" name="year_${qcateno}"   value="${VO.qcateicon}" >
					      </TD>
					      
					      <TD style="text-align: center;">
						       <i class="icon ion-ios-${VO.qcateicon} feature__icon"></i>
						       <ion-icon name="airplane-outline"></ion-icon>
						       
					      </TD>
					      
					      
					      <TD style="text-align: center;">
						      <button onclick="update_form('${qcateno}')"  id="btn_update_form_${qcateno }" name="btn_update_form" style="width:25%; height:100%; margin: 0px; display: inline-block;"><span class=" glyphicon glyphicon-pencil"></span></button>
						      <button onclick="delete_proc('${qcateno}')" id="btn_delete_proc_${qcateno }"  name="btn_delete_proc_${qcateno }"  style="width:25%; height:100%; margin: 0px; display: inline-block;"><span class="glyphicon glyphicon-trash"></span></button>
						      <button onclick="update_proc('${qcateno}')" id="btn_update_proc_${qcateno }" name="btn_update_proc" style="width:25%; height:100%; margin: 0px; display: none;"><span class="glyphicon glyphicon-check"></span></button>
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