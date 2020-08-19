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

</head>


<body class="body">
 <jsp:include page="../menu/header.jsp" flush='false' />
 
	<!-- page title -->
	<section class="section section--first section--bg" data-bg="${root }/img/section/section.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section__wrap">
						<!-- section title -->
						<h2 class="section__title">구매 내역</h2>
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
			         
			      <%--TABLE 1: Paytotal --%>
			      <TABLE style = "width:100%; margin: 30px 25px;">
					  <colgroup>
					    <col style="width: 5%;"/>
					    <col style='width: 20%;'/>
					    <col style='width: 10%;'/>
					    <col style='width: 10%;'/>
					    <col style='width: 10%;'/>
					    <col style='width: 15%;'/>
					    <col style='width: 25%;'/>
					  </colgroup>
					  
				     <thead>  
					  <TR >
					    <TH style="text-align: center;">번호</TH>
					    <TH style="text-align: center;">금액</TH>
					    <TH style="text-align: center;">적립</TH>
					    <TH style="text-align: center;">결제</TH>
					    <TH style="text-align: center;">날짜</TH>
					    <TH style="text-align: center;"></TH>
					  </TR>
					  </thead>    
					          
					  <tbody>
					  <c:forEach var="list_paytotal" items="${list_paytotal }">  <!-- request 객체에 접근 -->
                    <%--     <c:set var="cartno" value="${list.cartno}" />
                        <c:set var="filmno" value="${list.filmno}" /> --%>
                        
					    <TR >
                          <TD class=" " style="text-align: center;" >
                                <span style="margin: 0px;">${list_paytotal.payno }</span>
                          </TD>
					      <TD style="text-align: center;" >
					           <span style="margin: 0px;">${list_paytotal.pricetotalfinal }</span>
					      </TD>
					      <TD style="text-align: center;">
					           <span style="margin: 0px;"> ${list_paytotal.pntsave } </span>
					      </TD>
					      <TD style="text-align: center;">
					           <span style="margin: 0px;"> ${list_paytotal.method } </span>
					      </TD>
					      <TD style="text-align: center;">
					           <span style="margin: 0px;"> ${list_paytotal.paytotaldate } </span>
					      </TD>
					      <TD style="text-align: center;"> 
                              <button onclick="checkout_proc('${list_paytotal.paytotalno }')" id="btn_checkout_proc_${list_paytotal.paytotalno }"  name="btn_checkout_proc_${list_paytotal.paytotalno }"  style="width:25%; height:100%; margin: 0px; display: inline-block;">결제</button>
                              <button onclick="delete_proc('${list_paytotal.paytotalno }')" id="btn_delete_proc_${list_paytotal.paytotalno }"  name="btn_delete_proc_${list_paytotal.paytotalno }"  style="width:25%; height:100%; margin: 0px; display: inline-block;">삭제</button>
					      </TD>
					    </TR>
					    
					    <tr>
					    </tr>

                      
					    
					  </c:forEach>
					  </tbody>
					  </TABLE>
					  
			</div>
		</div>
	</section>
	<!-- end actor -->
	
	


</body>

</html>