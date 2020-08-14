<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600%7CUbuntu:300,400,500,700" rel="stylesheet"> 

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

    <!-- Favicons -->
    <link rel="icon" type="../image/png" href="../icon/favicon-32x32.png" sizes="32x32">
    <link rel="apple-touch-icon" href="../icon/favicon-32x32.png">
    <link rel="apple-touch-icon" sizes="72x72" href="../icon/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="../icon/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="144x144" href="../icon/apple-touch-icon-144x144.png">

    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="Dmitry Volkov">
    <title>FlixGo</title>
<script type="text/javascript">
$(function() {
  $('#btn_signin').on('click', signin);
    
});

function loadDefault() {
  $('#id').val('member1');
  $('#pw').val('1234');
}

function signin () {
    var frm = $('#frm')[0];
    var params = $('#frm').serialize();
    
    $.ajax({
        url : "./signin.do",
        type : "post",
        cache : false,
        async : false,
        dataType : "json",
        data : params,
        success : function(rdata) {
            if (rdata.count >= 1) {
                // alert('로그인 성공');
                location.href="../index.do";
            } else {
                alert('로그인 실패');
            }
        },
        error : function(request, status, error) {
            alert('로그인 실패');
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

    <div class="sign section--bg" data-bg="../img/section/section.jpg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="sign__content">
                        <!-- authorization form -->
                        <form action="./signin.do" id="frm"  name="frm" class="sign__form">
                            <a href="../index.do" class="sign__logo">
                                <img src="../img/logo.svg" alt="">
                            </a>

                            <div class="sign__group">
                                <input type="text" class="sign__input" id="id" name="id" value='${ck_id }' 
                                            placeholder="아이디" required="required" autofocus="autofocus">
                            </div>

                            <div class="sign__group sign__group--checkbox">
                                <input id="remember_id" name="remember_id" value="Y" type="checkbox" 
                                          ${ck_remember_id == 'Y' ? "checked='checked'" : "" }>
                                <label for="remember_id">기억하기</label>
                            </div>

                            <div class="sign__group">
                                <input type="password" class="sign__input" id="pw" name="pw"  value="${ck_pw }"
                                            placeholder="비밀번호" required="required" autofocus="autofocus">
                            </div>

                            <div class="sign__group sign__group--checkbox">
                                <input id="remember_pw" name="remember_pw" value="Y" type="checkbox" 
                                            ${ck_remember_pw == 'Y' ? "checked='checked'" : "" }>
                                <label for="remember_pw">기억하기</label>
                            </div>
                            
                            <button class="sign__btn" type="button" id="btn_signin" name ="btn_signin" >로그인</button>
                            <button class="sign__btn" type='button' onclick="loadDefault();" class="btn btn-primary btn-md">테스트 계정</button>
                            

                            <span class="sign__text">계정이 아직 없으신가요? <a href="./create.do"> 회원가입</a></span>

                            <!-- <span class="sign__text"><a href="#">Forgot password?</a></span> -->
                        </form>
                        <!-- end authorization form -->
                    </div>
                </div>
            </div>
        </div>
    </div>

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