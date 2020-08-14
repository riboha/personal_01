<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<c:set var="root" value="${pageContext.request.contextPath}" /> 
 
    <!-- header -->
    <header class="header">
        <div class="header__wrap">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="header__content">
                            <!-- header logo -->
                            <a href="${root}/index.do" class="header__logo">
                                <img src="${root}/img/logo.svg" alt="">
                            </a>
                            <!-- end header logo -->

                            <!-- header nav -->
                            <ul class="header__nav">
                                <!-- dropdown -->
                                <li class="header__nav-item">
                                    <a class="dropdown-toggle header__nav-link" href="#" role="button" id="dropdownMenuHome" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Home</a>

                                    <ul class="dropdown-menu header__dropdown-menu" aria-labelledby="dropdownMenuHome">
                                        <li><a href="index.html">Home slideshow bg</a></li>
                                        <li><a href="index2.html">Home static bg</a></li>
                                    </ul>
                                </li>
                                <!-- end dropdown -->

                                <!-- dropdown -->
                                <li class="header__nav-item">
                                    <a class="dropdown-toggle header__nav-link" href="#" role="button" id="dropdownMenuCatalog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Catalog</a>

                                    <ul class="dropdown-menu header__dropdown-menu" aria-labelledby="dropdownMenuCatalog">
                                        <li><a href="catalog1.html">Catalog Grid</a></li>
                                        <li><a href="catalog2.html">Catalog List</a></li>
                                    </ul>
                                </li>
                                <!-- end dropdown -->
                                
                                <li class="header__nav-item">
                                    <a href="faq.html" class="header__nav-link">Help</a>
                                </li>
                                
                                <!-- dropdown -->
                                <c:choose>
                                <c:when test="${sessionScope.id != null}">
	                                <li class="header__nav-item">
	                                    <a class="dropdown-toggle header__nav-link" href="#" role="button" id="dropdownMenuCatalog" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">MY</a>
	                                    <ul class="dropdown-menu header__dropdown-menu" aria-labelledby="dropdownMenuCatalog">
	                                        <li><a href="catalog1.html">보관함</a></li>
	                                        <li><a href="catalog2.html">구매 내역</a></li>
	                                        <li><a href="details1.html">Details Movie</a></li>
	                                        <li><a href="details2.html">계정</a></li>
	                                    </ul>
	                                </li>
                                </c:when>
                                </c:choose>
                                <!-- end dropdown -->

<!--                                 <li class="header__nav-item">
                                    <a href="pricing.html" class="header__nav-link">Pricing Plan</a>
                                </li>
 -->

                                <!-- dropdown -->
                                <li class="dropdown header__nav-item">
                                    <a class="dropdown-toggle header__nav-link header__nav-link--more" href="#" role="button" id="dropdownMenuMore" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon ion-ios-more"></i></a>

                                    <ul class="dropdown-menu header__dropdown-menu" aria-labelledby="dropdownMenuMore">
                                        <li><a href="about.do">About</a></li>
                                        <li><a href="signin.do">Sign In</a></li>
                                        <li><a href="signup.do">Sign Up</a></li>
                                        <li><a href="404.html">404 Page</a></li>
                                    </ul>
                                </li>
                                <!-- end dropdown -->
                                
                                <!-- dropdown -->
                                <li class="header__nav-item">
                                    <a class="dropdown-toggle header__nav-link header__nav-link--more" href="#" role="button" id="dropdownMenuMore" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon ion-ios-more"></i></a>

                                    <ul class="dropdown-menu header__dropdown-menu" aria-labelledby="dropdownMenuCatalog">
                                        <li><a href="${root }/genre/list.do">Genre</a></li>
                                        <li><a href="${root }/film/list.do">Film</a></li>
                                        <li><a href="${root }/director/list.do">Director</a></li>
                                        <li><a href="${root }/member/list.do">Member</a></li>
                                        <li><a href="${root }/qcate/list.do">Q Cate</a></li>
                                        <li><a href="${root }/award/list.do">Award</a></li>
                                        <li><a href="${root }/cart/list.do">Cart</a></li>
                                        <li><a href="${root }/actor/list.do">Actor</a></li>
                                        <li><a href="${root }/photo/list.do">Photo</a></li>
                                        <li><a href="${root }/promotion/list.do">Promotion</a></li>
                                        <li><a href="${root }/actor/list.do">Actor</a></li>
                                    </ul>
                                </li>
                                <!-- end dropdown -->
                                
                            </ul>
                            <!-- end header nav -->

                            <!-- header auth -->
                            <div class="header__auth">
                                <button class="header__search-btn" type="button" style="margin-right: 7px;">
                                    <i class="icon ion-ios-search"></i>
                                </button>
                                
                                <c:choose>
                                <c:when test="${sessionScope.id != null}">
	                                <button class="header__cart-btn" type="button" style="margin-left: 7px;" onclick="location.href='${root }/cart/list.do?memberno=${sessionScope.memberno}'">
	                                    <i class="icon ion-ios-cart"  id="btn_cart"  ></i>
	                                </button>
                                </c:when>
                                </c:choose>
                                
                                <c:choose>
						        <c:when test="${sessionScope.id == null}">
	                                <a href="${root }/member/signin.do" class="header__sign-in">
	                                    <i class="icon ion-ios-log-in"></i>
	                                    <span>LOG IN</span>
	                                </a>
						        </c:when>
						        <c:otherwise>
                                <button class="header__sign-in" style=" margin-right: 3px;" onclick="signout();">
                                    <i class="icon ion-ios-log-in"></i>
                                    <%-- <span>${sessionScope.nick }님</span> --%>
                                    <span>LOG OUT </span>
                                </button>
                                
                                <script type="text/javascript">

                                // ▶ 로그아웃
                                function signout () {

                                    $.ajax({
                                        url : "./member/signout.do",
                                        type : "post",
                                        cache : false,
                                        async : false,
                                        dataType : "json",
                                        success : function(rdata) {
                                            if (rdata.cnt >= 1) {
                                                window.location.reload();
                                            } else {
                                                if (rdata.duplicate >= 1) {
                                                  alert('로그아웃 실패');
                                                } else {
                                                  alert('로그아웃 실패');
                                                }
                                            }
                                        },
                                        error : function(request, status, error) {
                                            alert('로그아웃 실패');
                                            var msg = 'ERROR<br><br>';
                                            msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
                                            msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
                                            console.log(msg);
                                        }
                                    });
                                }
                                </script>
                                    
						        </c:otherwise>
                                </c:choose>
                                
                            </div>
                            <!-- end header auth -->

                            <!-- header menu btn -->
                            <button class="header__btn" type="button">
                                <span></span>
                                <span></span>
                                <span></span>
                            </button>
                            <!-- end header menu btn -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- header search -->
        <form action="#" class="header__search">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="header__search-content">
                            <input type="text" placeholder="Search for a movie, TV Series that you are looking for">

                            <button type="button">search</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!-- end header search -->
    </header>
    <!-- end header -->