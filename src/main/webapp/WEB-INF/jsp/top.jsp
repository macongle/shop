<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
	String path = request.getContextPath();
	String staticPath = path + "/static";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%=staticPath%>/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
		<script src="<%=staticPath%>/js/jquery.min.js"></script>
		<link href="<%=staticPath%>/css/style.css" rel="stylesheet" type="text/css" media="all" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script type="application/x-javascript">
			addEventListener("load", function() {
				setTimeout(hideURLbar, 0);
			}, false);

			function hideURLbar() {
				window.scrollTo(0, 1);
			}
		</script>
		<link href="<%=staticPath%>/css/memenu.css" rel="stylesheet" type="text/css" media="all" />
		<script type="text/javascript" src="<%=staticPath%>/js/memenu.js"></script>
		<script>
			$(document).ready(function() {
				$(".memenu").memenu();
			});
		</script>
		<script src="<%=staticPath%>/js/simpleCart.min.js">
		</script>
		<!-- slide -->
		<script src="<%=staticPath%>/js/responsiveslides.min.js"></script>
		<script>
			$(function() {
				$("#slider").responsiveSlides({
					auto: true,
					speed: 500,
					namespace: "callbacks",
					pager: true,
				});
			});
		</script>
</head>
<body>
<div class="header">
		<!-- 头部标题栏 -->
		<div class="header-top">
			<div class="container">
				<!-- 选择语言 -->
				<div class="col-sm-4 world">
					<ul>
						<li><select class="in-drop">
								<option>English</option>
								<option>Japanese</option>
								<option>French</option>
						</select></li>
						<li><select class="in-drop1">
								<option>Dollar</option>
								<option>Euro</option>
								<option>Yen</option>
						</select></li>
					</ul>
				</div>
				<!-- 网站LOGO -->
				<div class="col-sm-4 logo">
					<a href="index.jsp"><img src="<%=staticPath%>/images/logo.png" alt=""></a>
				</div>
				<!-- 顶部左菜单 -->
				<div class="col-sm-4 header-left">
					<!-- 登陆注册选项 -->
					<c:if test="${sessionScope.user !=null }">
					<p class="log">
						<span>欢迎您，</span>${sessionScope.user.username} <a href="<%=path%>/shop/exit">exit</a>
					</p>
					</c:if>
					<c:if test="${sessionScope.user ==null }">
					<p class="log">
						<a href="<%=path%>/shop/tologin">Login</a> <span>or</span> <a
							href="<%=path%>/shop/register">Signup</a>
					</p>
					</c:if>
					<!-- 购物车图标 -->
					<div class="cart box_1">
					<input type="hidden" name="flag" value="no" >
					<c:if test="${sessionScope.user != null}">
						<a href="<%=path%>/cart/checkout">
							<h3>
								<div class="total">
									<span>$${sessionScope.user.totals}</span>
								</div>
								<img src="<%=staticPath%>/images/cart.png" alt="" />
							</h3>
						</a>
					</c:if>	
					<c:if test="${sessionScope.user == null}">
						<a href="<%=path%>/cart/login">
							<h3>
								<div class="total">
									<span >$0.00</span>
								</div>
								<img src="<%=staticPath%>/images/cart.png" alt="" />
							</h3>
						</a>
					</c:if>	
						<p>
							<a href="<%=path %>/cart/clear/${sessionScope.user.id}" class="simpleCart_empty">Empty Cart</a>
						</p>

					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- 菜单栏 -->
		<div class="container">
			<div class="head-top">
				<!-- 售后电话 -->
				<div class="col-sm-2 number">
					<span><i class="glyphicon glyphicon-phone"></i>085 596 234</span>
				</div>
				<!-- 菜单 -->
				<div class="col-sm-8 h_menu4">
					<ul class="memenu skyblue">
						<li class=" grid"><a href="<%=path%>/shop/home">Home</a></li>
						<li><a href="#">Men</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1">
										<div class="h_nav">
											<h4>All Clothing</h4>
											<ul>
												<li><a href="<%=path%>/close/products">Shirts</a></li>
												<li><a href="<%=path%>/close/products">Sports Wear</a></li>
												<li><a href="<%=path%>/close/products">Shorts</a></li>
												<li><a href="<%=path%>/close/products">Suits & Blazers</a></li>
												<li><a href="<%=path%>/close/products">Formal Shirts</a></li>
												<li><a href="<%=path%>/close/products">Sweatpants</a></li>
												<li><a href="<%=path%>/close/products">Swimwear</a></li>
												<li><a href="<%=path%>/close/products">Trousers & Chinos</a></li>
												<li><a href="<%=path%>/close/products">T-Shirts</a></li>
												<li><a href="<%=path%>/close/products">Underwear & Socks</a></li>

											</ul>
										</div>
									</div>
									<div class="col1">
										<div class="h_nav">
											<h4>Footwear</h4>
											<ul>
												<li><a href="<%=path%>/close/products">Formal Shoes</a></li>
												<li><a href="<%=path%>/close/products">Boots</a></li>
												<li><a href="<%=path%>/close/products">Sports Shoes</a></li>
												<li><a href="<%=path%>/close/products">Casual Shoes</a></li>
												<li><a href="<%=path%>/close/products">Running Shoes</a></li>
												<li><a href="<%=path%>/close/products">Sneakers</a></li>
												<li><a href="<%=path%>/close/products">Loafers</a></li>
												<li><a href="<%=path%>/close/products">Slippers</a></li>
												<li><a href="<%=path%>/close/products">Sandals</a></li>
												<li><a href="<%=path%>/close/products">Flip-flops</a></li>

											</ul>
										</div>
									</div>
									<div class="col1">
										<div class="h_nav">
											<h4>Popular Brands</h4>
											<ul>
												<li><a href="<%=path%>/close/products">Levis</a></li>
												<li><a href="<%=path%>/close/products">Persol</a></li>
												<li><a href="<%=path%>/close/products">Nike</a></li>
												<li><a href="<%=path%>/close/products">Edwin</a></li>
												<li><a href="<%=path%>/close/products">New Balance</a></li>
												<li><a href="<%=path%>/close/products">Jack & Jones</a></li>
												<li><a href="<%=path%>/close/products">Paul Smith</a></li>
												<li><a href="<%=path%>/close/products">Ray-Ban</a></li>
												<li><a href="<%=path%>/close/products">Wood Wood</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div></li>
						<li class="grid"><a href="#"> Women</a>
							<div class="mepanel">
								<div class="row">
									<div class="col1">
										<div class="h_nav">
											<h4>All Clothing</h4>
											<ul>
												<li><a href="<%=path%>/close/products">Shirts & Tops</a></li>
												<li><a href="<%=path%>/close/products">Sports Wear</a></li>
												<li><a href="<%=path%>/close/products">Kurtas & Kurties</a></li>
												<li><a href="<%=path%>/close/products">Suits & Blazers</a></li>
												<li><a href="<%=path%>/close/products">Sarees</a></li>
												<li><a href="<%=path%>/close/products">Sweatpants</a></li>
												<li><a href="<%=path%>/close/products">Swimwear</a></li>
												<li><a href="<%=path%>/close/products">Night-Suits</a></li>
												<li><a href="<%=path%>/close/products">T-Shirts</a></li>
												<li><a href="<%=path%>/close/products">Jeans</a></li>

											</ul>
										</div>
									</div>
									<div class="col1">
										<div class="h_nav">
											<h4>Footwear</h4>
											<ul>
												<li><a href="<%=path%>/close/products">Heels</a></li>
												<li><a href="<%=path%>/close/products">Flats</a></li>
												<li><a href="<%=path%>/close/products">Sports Shoes</a></li>
												<li><a href="<%=path%>/close/products">Casual Shoes</a></li>
												<li><a href="<%=path%>/close/products">Running Shoes</a></li>
												<li><a href="<%=path%>/close/products">Wedges</a></li>
												<li><a href="<%=path%>/close/products">Boots</a></li>
												<li><a href="<%=path%>/close/products">Pumps</a></li>
												<li><a href="<%=path%>/close/products">Slippers</a></li>
												<li><a href="<%=path%>/close/products">Flip-flops</a></li>

											</ul>
										</div>
									</div>
									<div class="col1">
										<div class="h_nav">
											<h4>Popular Brands</h4>
											<ul>
												<li><a href="<%=path%>/close/products">Levis</a></li>
												<li><a href="<%=path%>/close/products">Persol</a></li>
												<li><a href="<%=path%>/close/products">Nike</a></li>
												<li><a href="<%=path%>/close/products">Edwin</a></li>
												<li><a href="<%=path%>/close/products">New Balance</a></li>
												<li><a href="<%=path%>/close/products">Jack & Jones</a></li>
												<li><a href="<%=path%>/close/products">Paul Smith</a></li>
												<li><a href="<%=path%>/close/products">Ray-Ban</a></li>
												<li><a href="<%=path%>/close/products">Wood Wood</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div></li>
						<li><a href="<%=path%>/jump/blog">Blog</a></li>
						<li><a class="color6" href="<%=path%>/jump/contact">Conact</a></li>
					</ul>
				</div>
				<!-- 搜索框 -->
				<div class="col-sm-2 search">
					<a class="play-icon popup-with-zoom-anim" href="<%=path%>/close/toadd"><i
						class="glyphicon glyphicon-search"> </i> </a>
				</div>
				<div class="clearfix"></div>
				<!---pop-up-box---->
				<script type="text/javascript" src="js/modernizr.custom.min.js"></script>
				
				<script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
				<!---//pop-up-box---->
				<div id="small-dialog" class="mfp-hide">
					<div class="search-top">
						<div class="login">
							<input type="submit" value=""> <input type="text"
								value="Type something..." onFocus="this.value = '';"
								onBlur="if (this.value == '') {this.value = '';}">
						</div>
						<p>Shopping</p>
					</div>
				</div>
				<script>
					$(document).ready(function() {
						$('.popup-with-zoom-anim').magnificPopup({
							type : 'inline',
							fixedContentPos : false,
							fixedBgPos : true,
							overflowY : 'auto',
							closeBtnInside : true,
							preloader : false,
							midClick : true,
							removalDelay : 300,
							mainClass : 'my-mfp-zoom-in'
						});

					});
				</script>
				<!---->
			</div>
		</div>
	</div>
</body>
<link href="<%=staticPath%>/css/popuo-box.css" rel="stylesheet" type="text/css"
					media="all" />
</html>