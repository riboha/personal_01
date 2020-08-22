<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" /> 

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- JQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <!-- JavaScript-->
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

    <!-- autocomoplete library import -->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
	<!-- Font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600%7CUbuntu:300,400,500,700" rel="stylesheet"> 
	
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	    
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

  
  $('#btn_create').on('click', create1);

//▶ 감독 Dirname 자동 완성
  $( "#dirname" )
  .autocomplete({
    source: function (request, response) {
      $.ajax({
        type: 'post',
        url: './search_auto_dir.do',
        data: {'search_dir' : $( "#dirname" ).val()},
        dataType: "JSON",
        success: function (rdata) {
          response (
              $.map(rdata, function(item) {
                return {
                  label : item.dirnamekr + ' ' + item.dirnameen,
                  value : item.dirnamekr + ' ' + item.dirnameen,
                  dirno : item.dirno
                }
              })
          );
        },
        error : function (request, status, error) {
          alert('auto_search error');
        }
      });
    },    
    select : function (event, ui) { 
      $('#dirno').val(ui.item.dirno);
      $('#dirnmae').val(ui.item.value);
    },
    focus: function (event, ui){
      return false;
    },
    minLength: 0
    });

  function split( val ) { return val.split( /,\s*/ ); }
  function extractLast ( term ) { return split( term ).pop(); }
  
   // ▶ 배우 Actorname 자동 완성
   $( "#cast" )
     .on( "keydown", function( event ) {
       if ( event.keyCode === $.ui.keyCode.TAB &&
           $( this ).autocomplete( "instance" ).menu.active ) {
         event.preventDefault();
       }
     })
     .autocomplete({
       source: function( request, response ) {
         $.ajax({
           type: 'post',
           url: './search_auto_actor.do',
           data: {'search_dir' : extractLast($( "#cast" ).val())},
           dataType: "JSON",
           success: function (rdata) {
             response (
                 $.map(rdata, function(item) {
                   return {
                     label : item.actornamekr + ' ' + item.actornameen,
                     value : item.actornamekr + ' '  + '(' + item.actorno + ')' ,
                     actorno : item.actorno
                   }
                 }),
             );
           },
           error : function (request, status, error) {
             alert('auto_search error');
           }
         });
       },
       select : function ( event, ui ) {
         var terms = split( this.value ); // 입력값 문자열을 공백 혹은 /로 나눈다
         terms.pop(); // 배열에서 마지막 요소를 제거, 그 요소를 반환 (검색어를 없앤다)
         terms.push( ui.item.value ); // 자동완성된 값을 추가한다
         terms.push( "" ); // 공백을 추가한다
         this.value = terms.join( ", " ); // 입력값 문자열에 콤마와 함께 더한다
         return false;
       },
       focus: function (event, ui){
         return false;
       },
       minLength: 0
     });
	
});

// ▶ 영화 레코드 등록 1
function create1 () {

	var frm = $('#frm')[0];
	var formData = new FormData(frm);
	
	$.ajax({
		url : "./create1.do",
		type : "post",
	    cache : false,
	    async : false,
        processData: false, // multifile 객체 전송시 필요
        contentType: false, // multifile 객체 전송시 필요   
	    dataType : "json",
	    data : formData,
	    success : function(rdata) {
	        if (rdata.cnt >= 1) {
		        create2(rdata.filmno);
		    } else {
		        alert('등록 실패');
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
	
//▶ 영화 레코드 등록 2	
function create2 (filmno) {
  
  var genrelist =  [];
  var languagelist = [];
  var qualitylist = [];
  var actornolist = [];
  
  actornolist = $('#cast').val().split(',');
  actornolist.pop();
   for (var i=0; i < actornolist.length; i++) {
     actornolist[i] = parseInt(actornolist[i].split('(').slice(-1, ) );
  }

  $("input:checkbox[name=genre]:checked").each(function(){genrelist.push($(this).val()); });
  $("input:checkbox[name=language]:checked").each(function(){languagelist.push($(this).val());});
  $("input:checkbox[name=quality]:checked").each(function(){qualitylist.push($(this).val());});

  var params = 
  { 'genrelist' : genrelist, 'languagelist' : languagelist, 'qualitylist' : qualitylist, 'actornolist': actornolist, 'filmno' : filmno};
  
    
    $.ajax({
        url : "./create2.do",
        type : "post",
        cache : false,
        async : false,
        dataType : "json",
        data : params,
        success : function(rdata) {
            if (rdata.cnt >= 1) {
                alert('등록 성공');
                location.href='${root}/movie/film/read.do?filmno='+rdata.filmno;
            } else {
                alert('등록 실패');
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
	</script>
	

</head>
<body class="body">
 <jsp:include page="/menu/header.jsp" flush='false' />

	<!-- page title -->
	<section class="section section--first section--bg" data-bg="img/section/section.jpg">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section__wrap">
						<!-- section title -->
						<h2 class="section__title">FAQ</h2>
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
					    <form id = 'frm' name = 'frm' class="sign__form" style="width:100%;" method='POST' action="./create.do" enctype="multipart/form-data" >
					        <h3 class="faq__title">영화 등록</h3>
							<div class="faq" style="width:100%;">
							     
			                    <div class="sign__group" >
				                    <label class="col-md-2 feature__text  sign__input "  
				                            style="background-color: transparent; color: rgba(255,255,255,0.7); font-size: 18px;  margin: 0px ; padding: 10px; display:inline; " > 영문 제목 </label>
			                        <input type="text"  id='titleen' name='titleen' class=" sign__input " style = "width: 80%; display:inline;"  placeholder="" >
			                    </div>
			          
			                    <div class="sign__group " >
				                    <label class=" col-md-2 feature__text  sign__input "   style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 한글 제목 </label>
			                        <input type="text"  id='titlekr' name='titlekr' class="sign__input " style = "width: 80%; display:inline;"   placeholder="">
			                    </div>
			          
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 언어 </label>
			                        <input type="text"  id='lan' name='lan' class="sign__input" style = "width: 80%; display:inline;" placeholder="">
			                    </div>
			          
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7); width: 80%;" > 년도 </label>
			                        <input type="text"  id='year' name='year' class="sign__input" style = "width: 80%; display:inline;" placeholder="">
			                    </div>
			          
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 길이 </label>
			                        <input type="text"  id='len' name='len' class="sign__input" style = "width: 80%; display:inline;"  placeholder="">
			                    </div>
			        
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 연령가 </label>
			                        <input type="text"  id='restrict' name='restrict' class="sign__input" style = "width: 80%; display:inline;" placeholder="">
			                    </div>
                                
                                <div class="sign__group " >
                                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 감독 </label>
                                    <input type="text"  id='dirname' name='dirname' class="sign__input" style = "width: 80%; display:inline;" value=" "  required="required">
                                </div> 
                                
                                <input type="hidden"  id='dirno' name='dirno' class="sign__input" style = "width: 80%; display:inline;" value=""  required="required" >
                                
                                <div class="sign__group " >
                                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 출연 </label>
                                    <input type="text"  id='cast' name='cast' class="sign__input" style = "width: 80%; display:inline;"  required="required" value=
                                    "" >
                                </div> 
                                
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 내용 </label>
								    <textarea id='summary' name='summary'  class="sign__input"  style = "width: 80%; display:inline;" rows="60" cols="60" placeholder=""></textarea>
								</div>
								
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > Youtube </label>
			                        <input type="text"  id='youtube' name='youtube' class="sign__input" style = "width: 80%; display:inline;" placeholder="">
			                    </div>
			                    
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > URL </label>
			                        <input type="text"  id='url' name='url' class="sign__input" style = "width: 80%; display:inline;" placeholder="">
			                    </div>
			                    
			                    <div class="sign__group " >
				                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 포스터 </label>
			                        <input type="file"  id='posterMF' name='posterMF' class="sign__input" style = "width: 80%; display:inline;" placeholder="">
			                    </div>
			                    
			                    <div class="sign__group " >
                                    <label class="  feature__text  sign__input"   style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 지원 언어 </label>
                                    <div class="sign__group sign__group--checkbox" style = "width: 80%; display:inline;" >
                                        <input id="kr" name="language" type="checkbox"  value="kr"> <label for="kr">KR</label>
                                        <input id="en" name="language" type="checkbox"  value="en"> <label for="en">EN</label> ;
                                        <input id="es" name="language" type="checkbox"  value="es"> <label for="es">ES</label> 
                                        <input id="fr" name="language"  type="checkbox"  value="fr"> <label for="fr">FR</label> 
                                        <input id="pt" name="language" type="checkbox"  value="pt"> <label for="pt">PT</label> 
                                        <input id="rs" name="language"  type="checkbox"  value="rs"> <label for="rs">RS</label>
                                        <input id="ar" name="language" type="checkbox"  value="ar"> <label for="ar">AR</label>
                                        <input id="hi" name="language" type="checkbox"  value="hi"> <label for="hi">HI</label>
                                        <input id="de" name="language" type="checkbox"  value="de"> <label for="de">DE</label>
                                        <input id="jp" name="language"  type="checkbox"  value="jp"> <label for="jp">JP</label>
                                        <input id="ch" name="language"  type="checkbox" value="ch"> <label for="ch">CH</label>
                                    </div>
                                </div>
                                
                                <div class="sign__group " >
                                    <label class="  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 지원 화질 </label>
                                    <div class="sign__group sign__group--checkbox" style = "width: 80%; display:inline; " >
                                        <input id="q576" name="quality" type="checkbox"  value="q576"> <label for="q576">576</label>
                                        <input id="q720" name="quality" type="checkbox" value="q720"> <label for="q720">720</label>　
                                        <input id="q1024" name="quality" type="checkbox"  value="q1024"> <label for="q1024">1024</label>　
                                        <input id="q1440" name="quality" type="checkbox" value="q1440"> <label for="q1440">1440</label>
                                    </div>      
                                </div>      
                                
                                <div class="sign__group " >
                                   <label class="  feature__text "  style="background-color: transparent; padding:10px; font-size: 18px; color: rgba(255,255,255,0.7);" > 장르 </label>
                                    <div class="sign__group sign__group--checkbox" style = "width: 80%; display:inline; " >
                                    <c:forEach var="list" items="${genreVO_list }">
                                        <c:set var="genreno" value="${list.genreno }"/>
                                        <c:set var="genrename" value="${list.genrename }"/>
                                        <input id="${genrename }" name="genre" type="checkbox"  value="${genreno }"> <label for="${genrename }">${genrename }</label>  　
                                    </c:forEach>
                                    </div>      
                                </div>
                                
                                <div class="sign__group " >
                                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 15px; color: rgba(255,255,255,0.7);" > 1일권 가격 </label>
                                    <input type="number"  id='day1' name='day1' class="sign__input" style = "width: 80%; display:inline;">
                                </div>
                                <div class="sign__group " >
                                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 15px; color: rgba(255,255,255,0.7);" > 3일권 가격 </label>
                                    <input type="number"  id='day3' name='day3' class="sign__input" style = "width: 80%; display:inline;">
                                </div>
                                <div class="sign__group " >
                                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 15px; color: rgba(255,255,255,0.7);" > 7일권 가격 </label>
                                    <input type="number"  id='day7' name='day7' class="sign__input" style = "width: 80%; display:inline;">
                                </div>
                                <div class="sign__group " >
                                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 15px; color: rgba(255,255,255,0.7);" > 30일권 가격 </label>
                                    <input type="number"  id='day30' name='day30' class="sign__input" style = "width: 80%; display:inline;">
                                </div>
                                <div class="sign__group " >
                                    <label class="col-md-2  feature__text  sign__input"  style="background-color: transparent; padding:10px; font-size: 15px; color: rgba(255,255,255,0.7);" > 영구소장 가격 </label>
                                    <input type="number"  id='dayperm' name='dayperm' class="sign__input" style = "width: 80%; display:inline;">
                                </div>
                                
                                  
                                
                                <br>
                                <br>
			                    <div class="col-md-12 sign__group " style="width: 100%; ">
    								<button class="sign__btn"  id='btn_create' name="btn_create"  type="button"  style = "width:49%; display: inline-block; margin: 3px;">등록</button>
    								<button class="sign__btn"  id='btn_create' name="btn_create"  type="button"  style = "width:49%; display: inline-block; margin: 3px; " 
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