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
  $(".clickable-row").click(function() {
      window.location = $(this).data("href");
    });
    
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
					    <col style='width: 25%;'/>
					    <col style='width: 10%;'/>
					    <col style='width: 15%;'/>    
					    <col style='width: 25%;'/>
					    <col style='width: 5%;'/>
					    <col style='width: 5%;'/>
					  </colgroup>
					  
					  <thead>  
					  <TR >
					    <TH style="text-align: center;"><span>#</span></TH>
					    <TH style="text-align: center;">제목</TH>
					    <TH style="text-align: center;">언어</TH>
					    <TH style="text-align: center;">감독</TH>
					    <TH style="text-align: center;">배우</TH>
					    <TH style="text-align: center;">개봉</TH>
					    <TH style="text-align: center;">길이</TH>
					    <TH style=""></TH>
					  </TR>
					  </thead>    
					          
					  <tbody>
					  <c:forEach var="VO" items="${list }">  <!-- request 객체에 접근 -->
                        <c:set var="filmno" value="${VO.filmno}" />
                        
					    <TR >
					      <TD class='clickable-row' data-href= "./read.do?filmno=${filmno }" style="text-align: center;"><span style="margin: 0px;">${filmno}</span></TD>
					      <TD class='clickable-row' data-href= "./read.do?filmno=${filmno }" style="text-align: center;"><span style="margin: 0px;">${VO.titlekr}<br>${VO.titleen}</span></TD>
					      <TD class='clickable-row' data-href= "./read.do?filmno=${filmno }" style="text-align: center;"><span style="margin: 0px;">${VO.lan}</span></TD>
					      <TD class='clickable-row' data-href= "./read.do?filmno=${filmno }" style="text-align: center;"><span style="margin: 0px;">${VO.dirno}</span></TD>
					      <TD class='clickable-row' data-href= "./read.do?filmno=${filmno }" style="text-align: center;"><span style="margin: 0px;">CAST</span></TD>
					      <TD class='clickable-row' data-href= "./read.do?filmno=${filmno }" style="text-align: center;"><span style="margin: 0px;">${VO.year}</span></TD>
					      <TD class='clickable-row' data-href= "./read.do?filmno=${filmno }" style="text-align: center;"><span style="margin: 0px;">${VO.len}</span></TD>
					      <TD style="text-align: center;">
						      <button onclick="location.href='./read_customer.do?filmno=${filmno}'"  id="read_customer" name="read_customer" style="width:25%; height:100%; margin: 0px; display: inline-block;"><span class=" glyphicon glyphicon-search"></span></button>
					      </TD>             
					    </TR>
					  </c:forEach>
					  </tbody>
					  </TABLE>
			</div>
		</div>
	</section>
	<!-- end faq -->


</body>

</html>