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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <!-- autocomoplete library import -->

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

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
    
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

	  /* $('#dirno').on('autocompleteSelect', function(event, node) {
	
	  }); */
  
  var dirno_var = 0;
  $("#dirname").change(function(){
    // selectedUser = "";
    // $("#userId").val("");
    alert('dirno_var: ' + dirno_var );
    $('#dirno').val(dirno_var);
  });

  $( "#dirname" ).autocomplete({
    source: function (request, response) {
      $.ajax({
        type: 'post',
        url: './search_auto.do',
        data: {'search_dir' : $( "#dirname" ).val()},
        dataType: "JSON",
        success: function (rdata) {
          response (
              $.map(rdata, function(item) {
                return {
                  label : item.dirnamekr + ' ' + item.dirnameen,
                  value : item.dirnamekr + ' ' + item.dirnameen,
                  dirnamekr : item.dirnamekr,
                  dirnameen : item.dirnameen,
                  dirno : item.dirno
                  }
              })
          );
        },
        select : function(event, ui) { // 아이템 선택시 발생하는 이벤트
          // $('#dirno').val(ui.item.dirno);
          dirno_var = dirno;
          // $('#dirname').val(ui.item.label);
          
          //사용자가 오토컴플릿이 만들어준 목록에서 선택을 하면 반환되는 객체
          /* console.log(ui); 
          console.log(ui.item.label);    
          console.log(ui.item.value); 
          console.log(ui.item.dirno);  */
        },
        focus: function (event, ui){
          return false;
        },
        minLength: 2,
        // autoFocus: true,
        // delay: 500,
        // disabled: true, // 자동완성 기능 끄기
        // position: {my: "right top", at: "right bottom"},
        /* close: function (event) {
          console.log(event);
        }, */
        error : function(request, status, error) {
          alert('auto_search error');
          var msg = 'ERROR<br><br>';
          msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
          msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
          console.log(msg);
        }
      });
    }
  });
/*   .autocomplete( "instance" )._renderItem = function( ul, item ) {    //요 부분이 UI를 마음대로 변경하는 부분
    return $( "<li>" )    //기본 tag가 li로 되어 있음 
    .append( "<div>" + item.value + "<br>" + item.label + "</div>" )    //여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
    .appendTo( ul ); 
};
 */

  
  $('#btn_update_form').on('click', update_form);
  $('#btn_update_proc').on('click', update_proc1);
  $('#btn_delete').on('click', delete_proc);
	
});


  // ▶ 영화 레코드 수정 폼
function update_form () {
  $("input[name='titleen']").attr("readonly", false);
  $("input[name='titlekr']").attr("readonly", false);
  $("input[name='lan']").attr("readonly", false);
  $("input[name='year']").attr("readonly", false);
  $("input[name='len']").attr("readonly", false);
  $("input[name='restrict']").attr("readonly", false);
  $("input[name='dirno']").attr("readonly", false);
  $("input[name='dirname']").attr("readonly", false);
  $("textarea[name='summary']").attr("readonly", false);
  $("textarea[name='youtube']").attr("readonly", false);

  $("input[name='day1']").attr("readonly", false);
  $("input[name='day3']").attr("readonly", false);
  $("input[name='day7']").attr("readonly", false);
  $("input[name='day30']").attr("readonly", false);
  $("input[name='dayperm']").attr("readonly", false);
  
  
  $("input[name='url']").attr("readonly", false);

  document.getElementById("btn_update_form").style.display = "none";
  document.getElementById("btn_update_proc").style.display = "inline-block";
  document.getElementById("btn_update_proc").style.width = "49%";
  document.getElementById("posterMFdiv").style.display = "inline";
  document.getElementById("btn_delete").style.display = "none";
  
  document.getElementById("btn_cancel").style.width = "49%";
  document.getElementById("btn_cancel").onclick = "window.location.reload();";
  document.getElementById("btn_cancel").onclick = "window.location.reload();";

  $('#btn_cancel').attr("onclick",  "window.location.reload();");

}


// ▶ 영화 레코드 수정 실행 1
function update_proc1 () {

   // $('#btn_create').click(function(){
	var frm = $('#frm')[0];
	var formData = new FormData(frm);
	
	alert('formData: '+ formData);

	$.ajax({
		url : "./update1.do",
		type : "post",
	    cache : false,
	    async : false,
        processData: false, // multifile 객체 전송시 필요
        contentType: false, // multifile 객체 전송시 필요   
	    dataType : "json",
	    data : formData,
	    success : function(rdata) {
	        if (rdata.cnt >= 1) {
		        update_proc2(rdata.filmno);
		        // alert('수정 성공');
		        // window.location.reload();
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

// ▶ 영화 레코드 수정 실행 2
function update_proc2 (filmno) {
  var genrelist =  [];
  var languagelist = [];
  var qualitylist = [];

  $("input:checkbox[name=genre]:checked").each(function(){
    genrelist.push($(this).val());
  });
  $("input:checkbox[name=language]:checked").each(function(){
    languagelist.push($(this).val());
  });
  $("input:checkbox[name=quality]:checked").each(function(){
    qualitylist.push($(this).val());
  });

  var params = { 'genrelist' : genrelist, 'languagelist' : languagelist, 'qualitylist' : qualitylist, 'filmno' : filmno};
  
	$.ajax({
		url : "./create2.do",
		type : "post",
	    cache : false,
	    async : false,
	    dataType : "json",
	    data : params,
	    success : function(rdata) {
	        if (rdata.cnt >= 1) {
		        alert('수정 성공');
		        window.location.reload();
		    } else {
		        alert('수정 실패');
		        // window.location.reload();
			}
	    },
	    error : function(request, status, error) {
	        alert('수정 실패');
	        var msg = 'ERROR<br><br>';
	        msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
	        msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
	        console.log(msg);
	    }
	});
}

// ▶ 영화 레코드 삭제   
function delete_proc () {

//체크박스 반영

	var filmno = ${filmVO.filmno};
	alert('filmno; ' + filmno);
	$.ajax({
      url: "./delete.do", 
      type: "post",          
      cache: false,          // 브러우저의 캐시영역 사용안함.
      async: true,           // true: 비동기
      dataType: "json",   
      data: {'filmno':filmno}, 
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
var kr = $('input:checkbox[id="kr"]').val();

// alert('kr: ' + kr);

$('input:checkbox[name="language"]').each(function() {

  alert('value:' + this.value);
  if(this.value == "1"){ //값 비교
         this.checked = true; //checked 처리
   }
});

$('input:checkbox[name="quality"]').each(function() {

  alert('value:' + this.value);
  if(this.value == "1"){ //값 비교
         this.checked = true; //checked 처리
   }
});

	</script>
	

</head>
<body class="body">
 <jsp:include page="/menu/header.jsp" flush='false' />

	<!-- page title -->
	<section class="section section--first section--bg" data-bg="${root }/img/section/section.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section__wrap">
						<!-- section title -->
						<h2 class="section__title">영화 조회</h2>
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
					    <form id = 'frm' name = 'frm' class="sign__form" style="width:100%;" method='POST' action="./update.do" enctype="multipart/form-data" >
							<div class="faq" style="width:100%;">
							    <div class="sign__group" style="text-align: center; top: 0;">
                                    <img src="poster/${filmVO.poster} " style ="margin: 0px; width:35%; text-align: center;" alt=""> 
                                </div>
			                    
			                    <input type="hidden"  id='filmno' name='filmno' class=" sign__input " style = "width: 80%; display:inline;" value="${filmVO.filmno }" required="required" >
			                    
			                    <div class="sign__group" >
				                    <label class="col-md-2 feature__text  sign__input "  
				                            style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 18px;  margin: 0px ; padding: 10px; display:inline; " > 영문 제목 </label>
			                        <input type="text"  id='titleen' name='titleen' class=" sign__input " style = "width: 80%; display:inline;" value="${filmVO.titleen }" required="required" readonly="readonly">
			                    </div>
			                    
			                    <div class="sign__group " >
				                    <label class=" col-md-2 feature__text  sign__input "   style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 한글 제목 </label>
			                        <input type="text"  id='titlekr' name='titlekr' class="sign__input " style = "width: 80%; display:inline;" value="${filmVO.titlekr }"  required="required" readonly="readonly">
			                    </div>
			                    
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 언어 </label>
			                        <input type="text"  id='lan' name='lan' class="sign__input" style = "width: 80%; display:inline;" value="${filmVO.lan }"  required="required" readonly="readonly">
			                    </div>
			                    
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7); width: 80%;" > 년도 </label>
			                        <input type="number"  id='year' name='year' class="sign__input" style = "width: 80%; display:inline;" value="${filmVO.year }"  required="required" readonly="readonly">
			                    </div>
			                    
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 길이 </label>
			                        <input type="number"  id='len' name='len' class="sign__input" style = "width: 80%; display:inline;" value="${filmVO.len }"  required="required" readonly="readonly">
			                    </div>
			                    
			                    
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 연령가 </label>
			                        <input type="number"  id='restrict' name='restrict' class="sign__input" style = "width: 80%; display:inline;" value="${filmVO.restrict }"  required="required" readonly="readonly">
			                    </div>

			                    
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 감독 </label>
			                        <input type="text"  id='dirname' name='dirname' class="sign__input" style = "width: 80%; display:inline;" value=""  required="required" readonly="readonly">
			                        <input type="text"  id='dirno' name='dirno' class="sign__input" style = "width: 80%; display:inline;" value=""  required="required" readonly="readonly">
			                    </div> 
			                    
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 내용 </label>
								    <textarea id='summary' name='summary'  class="sign__input"  style = "width: 80%; display:inline;" rows="60" cols="60"  required="required" readonly="readonly">${filmVO.summary }</textarea>
								</div>

			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > Youtube </label>
								    <textarea id='youtube' name='youtube'  class="sign__input"  style = "width: 80%; display:inline;" rows="120" cols="60"  required="required" readonly="readonly">${filmVO.youtube }</textarea>
								</div>
								
								<div class="sign__group " >
                                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > URL </label>
                                    <input type="text"  id='url' name='url' class="sign__input" style = "width: 80%; display:inline;" value="${filmVO.url }"  required="required" readonly="readonly">
                                </div>
			                    
			                    <div class="sign__group "  id='posterMFdiv' style = "display:none;" >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 포스터 </label>
			                        <input type="file"  id='posterMF' name='posterMF' class="sign__input" style = "width: 80%;  display:inline;" value=""  >
			                    </div>

	                            <div class="sign__group " >
			                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 지원 언어 </label>
		                            <div class="sign__group sign__group--checkbox" style = "width: 80%; display:inline;">
		                                <input id="kr" name="language" type="checkbox"  value="kr" ${languageVO.kr == '1' ? "checked='checked'" : "" }> <label for="kr">KR</label>　
		                                <input id="en" name="language" type="checkbox" value="en"  ${languageVO.en == '1' ? "checked='checked'" : "" }> <label for="en">EN</label> 　
		                                <input id="es" name="language" type="checkbox" value="es" ${languageVO.es == '1' ? "checked='checked'" : "" }> <label for="es">ES</label> 　
		                                <input id="fr" name="language" type="checkbox"  value="fr"  ${languageVO.fr == '1' ? "checked='checked'" : "" }> <label for="fr">FR</label> 　
		                                <input id="pt" name="language" type="checkbox" value="pt"  ${languageVO.pt == '1' ? "checked='checked'" : "" }> <label for="pt">PT</label> 　
		                                <input id="rs" name="language" type="checkbox"  value="rs" ${languageVO.rs == '1' ? "checked='checked'" : "" }> <label for="rs">RS</label> 　
		                                <input id="ar" name="language" type="checkbox"  value="ar" ${languageVO.ar == '1' ? "checked='checked'" : "" }> <label for="ar">AR</label> 　
		                                <input id="hi" name="language" type="checkbox"  value="hi" ${languageVO.hi == '1' ? "checked='checked'" : "" }> <label for="hi">HI</label> 　
		                                <input id="de" name="language" type="checkbox"  value="de" ${languageVO.de == '1' ? "checked='checked'" : "" }> <label for="de">DE</label> 　
		                                <input id="jp" name="language" type="checkbox"  value="jp" ${languageVO.jp == '1' ? "checked='checked'" : "" }> <label for="jp">JP</label> 　
		                                <input id="ch" name="language " type="checkbox" value="ch" ${languageVO.ch == '1' ? "checked='checked'" : "" }> <label for="ch">CH</label>
		                            </div>
	                            </div>
	                            
	                            <div class="sign__group " >
	                            <label class="  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 지원 화질 </label>
		                            <div class="sign__group sign__group--checkbox" style = "width: 80%; display:inline; margin:0px; padding: 0px;" >
	                                    <input id="q576" name="quality" type="checkbox"  value="q576"  ${qualityVO.q576 == '1' ? "checked='checked'" : "" }> <label for="q576">576</label> 　
	                                    <input id="q720" name="quality" type="checkbox" value="q720"  ${qualityVO.q720 == '1' ? "checked='checked'" : "" }> <label for="q720">720</label> 　
	                                    <input id="q1024" name="quality" type="checkbox" value="q1024"  ${qualityVO.q1024 == '1' ? "checked='checked'" : "" }> <label for="q1024">1024</label> 　
	                                    <input id="q1440" name="quality" type="checkbox" value="q1440"  ${qualityVO.q1440 == '1' ? "checked='checked'" : "" }> <label for="q1440">1440</label>
	                                </div>      
                                </div>      
                                
                                <div class="sign__group " >
                                   <label class="  feature__text "  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 장르 </label>
                                    <div class="sign__group sign__group--checkbox" style = "width: 80%; display:inline; " >
                                    
                                    <c:forEach var="genreVO_list" items="${genreVO_list }">
	                                   <input id="${genreVO_list.genrename }" name="genre" type="checkbox"  value="${genreVO_list.genreno }" > <label for="${genreVO_list.genrename }">${genreVO_list.genrename }</label>  　
                                    </c:forEach>
                                    
                                    <c:forEach var="genreVO_list" items="${genreVO_list }">
                                       <c:forEach var="film_genre_VO_list" items="${film_genre_VO_list }">
	                                       <c:choose>
	                                         <c:when test="${genreVO_list.genreno == film_genre_VO_list.genreno }">
	                                              <script type="text/javascript">
	                                              // document.getElementById("${genreVO_list.genrename }").checked = true;
	                                              $("#${genreVO_list.genrename }").attr("checked", true);
	                                              </script>
	                                         </c:when>
	                                       </c:choose>
                                       </c:forEach>
                                    </c:forEach>
                                    </div>      
                                </div>  
                                
                                <div class="sign__group " >
                                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 15px; color: rgba(255,255,255,0.7);" > 1일권 가격 </label>
                                    <input type="number"  id='day1' name='day1' class="sign__input" style = "width: 80%; display:inline;" value="${priceVO.day1 }" readonly="readonly">
                                </div>
                                <div class="sign__group " >
                                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 15px; color: rgba(255,255,255,0.7);" > 3일권 가격 </label>
                                    <input type="number"  id='day3' name='day3' class="sign__input" style = "width: 80%; display:inline;" value="${priceVO.day3 }" readonly="readonly">
                                </div>
                                <div class="sign__group " >
                                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 15px; color: rgba(255,255,255,0.7);" > 7일권 가격 </label>
                                    <input type="number"  id='day7' name='day7' class="sign__input" style = "width: 80%; display:inline;" value="${priceVO.day7 }" readonly="readonly">
                                </div>
                                <div class="sign__group " >
                                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 15px; color: rgba(255,255,255,0.7);" > 30일권 가격 </label>
                                    <input type="number"  id='day30' name='day30' class="sign__input" style = "width: 80%; display:inline;" value="${priceVO.day30 }" readonly="readonly">
                                </div>
                                <div class="sign__group " >
                                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 15px; color: rgba(255,255,255,0.7);" > 영구소장 가격 </label>
                                    <input type="number"  id='dayperm' name='dayperm' class="sign__input" style = "width: 80%; display:inline;" value="${priceVO.dayperm }" readonly="readonly">
                                </div>

			                    <div class="col-md-12 sign__group " style="width: 100%; ">
    								<button class="sign__btn"  id='btn_update_form' name="btn_update_form"  type="button"  style = "width:32%; display: inline-block; margin: 3px;">수정 모드</button>
    								<button class="sign__btn"  id='btn_update_proc' name="btn_update_proc"  type="button"  style = "width:32%; display: none; margin: 3px;">수정 저장</button>
    								<button class="sign__btn"  id='btn_delete' name="btn_delete"  type="button"  style = "width:32%; display: inline-block; margin: 3px;">삭제</button>
    								<button class="sign__btn"  id='btn_cancel' name="btn_cancel"  type="button"  style = "width:32%; display: inline-block; margin: 3px; " onclick="location.href='./list.do'"> 취소 </button>
    							</div>
    							
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end faq -->
	
</body>

</html>