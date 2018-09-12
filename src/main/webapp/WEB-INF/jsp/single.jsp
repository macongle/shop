<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String staticPath = path + "/static";
%>
<!DOCTYPE html>
<html>

<head>
<title>商品详情</title>
<meta name="keywords"
	content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
</head>

<body>
	<jsp:include page="top.jsp" />
	<!---->
	<div class="single">

		<div class="container">
			<div class="col-md-9">
				<div class="col-md-5 grid">
					<div class="flexslider">
						<!-- 缩略图 -->
						<ul class="slides">
							<li data-thumb="<%=path %>${close.imgAddress}">
								<div class="thumb-image">
									<img src="<%=path %>${close.imgAddress}" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
							<li data-thumb="<%=path %>${close.imgAddress}">
								<div class="thumb-image">
									<img src="<%=path %>${close.imgAddress}" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>
							<li data-thumb="<%=path %>${close.imgAddress}">
								<div class="thumb-image">
									<img src="<%=path %>${close.imgAddress}" data-imagezoom="true"
										class="img-responsive">
								</div>
							</li>

						</ul>
					</div>
				</div>
				<div class="col-md-7 single-top-in">
					<!-- 商品信息 -->
					<div class="single-para simpleCart_shelfItem">
						<h1>${close.title}</h1>
						<p>${close.resume}</p>
						<div class="star-on">
							<ul>
								<li><a href="#"><i class="glyphicon glyphicon-star">
									</i></a></li>
								<li><a href="#"><i class="glyphicon glyphicon-star">
									</i></a></li>
								<li><a href="#"><i class="glyphicon glyphicon-star">
									</i></a></li>
								<li><a href="#"><i class="glyphicon glyphicon-star">
									</i></a></li>
								<li><a href="#"><i class="glyphicon glyphicon-star">
									</i></a></li>
							</ul>
							<div class="review">
								<a href="#"> 3 reviews </a>/ <a href="#"> Write a review</a>
							</div>
							<div class="clearfix"></div>
						</div>

						<label class="add-to item_price">$${close.prices}</label>

						<div class="available">
							<h6>Available Options :</h6>
							<ul>

								<li>Size: <select>
										<option>Large</option>
										<option>Medium</option>
										<option>small</option>
										<option>Large</option>
										<option>small</option>
								</select>
								</li>
								<li>Cost: <select>
										<option>U.S.Dollar</option>
										<option>Euro</option>
								</select>
								</li>
							</ul>
						</div>
						<c:if test="${sessionScope.user != null }">
						<a href="<%=path%>/cart/${close.id}" class="cart item_add">Add To Cart</a>
						</c:if>
						<c:if test="${sessionScope.user == null }">
						<a href="<%=path%>/cart/checkout" class="cart item_add">Add To Cart</a>
						</c:if>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="content-top1">
					<div class="col-md-4 col-md3">
						<div class="col-md1 simpleCart_shelfItem">
							<a href="<%=path%>/jump/single"> <img class="img-responsive"
								src="<%=staticPath%>/images/pi6.png" alt="" />
							</a>
							<h3>
								<a href="<%=path%>/jump/single">Jeans</a>
							</h3>
							<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>
					<!-- 随机推荐 -->
					<div class="col-md-4 col-md3">
						<div class="col-md1 simpleCart_shelfItem">
							<a href="<%=path%>/jump/single"> <img class="img-responsive"
								src="<%=staticPath%>/images/pi7.png" alt="" />
							</a>
							<h3>
								<a href="<%=path%>/jump/single">Tops</a>
							</h3>
							<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"></div>
							</div>

						</div>
					</div>
					<div class="col-md-4 col-md3">
						<div class="col-md1 simpleCart_shelfItem">
							<a href="<%=path%>/jump/single"> <img class="img-responsive"
								src="<%=staticPath%>/images/pi.png" alt="" />
							</a>
							<h3>
								<a href="<%=path%>/jump/single">Tops</a>
							</h3>
							<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"></div>
							</div>

						</div>
					</div>

					<div class="clearfix"></div>
				</div>
			</div>
			<!----->
			<div class="col-md-3 product-bottom">
				<!-- 按销售量排序推荐 -->
				<div class="product-bottom">
					<h3 class="cate">Best Sellers</h3>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="<%=path%>/jump/single"><img class="img-responsive "
								src="<%=staticPath%>/images/pr.jpg" alt=""></a>
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2">
								<a href="<%=path%>/jump/single">Lorem ipsum dolor sitamet
									consectetuer </a>
							</h6>
							<span class=" price-in1"> $40.00</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="<%=path%>/jump/single"><img class="img-responsive "
								src="<%=staticPath%>/images/pr1.jpg" alt=""></a>
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2">
								<a href="<%=path%>/jump/single">Lorem ipsum dolor sitamet
									consectetuer </a>
							</h6>
							<span class=" price-in1"> $40.00</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="<%=path%>/jump/single"><img class="img-responsive "
								src="<%=staticPath%>/images/pr2.jpg" alt=""></a>
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2">
								<a href="<%=path%>/jump/single">Lorem ipsum dolor sitamet
									consectetuer </a>
							</h6>
							<span class=" price-in1"> $40.00</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="product-go">
						<div class=" fashion-grid">
							<a href="<%=path%>/jump/single"><img class="img-responsive "
								src="<%=staticPath%>/images/pr3.jpg" alt=""></a>
						</div>
						<div class=" fashion-grid1">
							<h6 class="best2">
								<a href="<%=path%>/jump/single">Lorem ipsum dolor sitamet
									consectetuer </a>
							</h6>
							<span class=" price-in1"> $40.00</span>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<script src="<%=staticPath%>/js/imagezoom.js"></script>

	<script defer src="<%=staticPath%>/js/jquery.flexslider.js"></script>


	<script>
		$(window).load(function() {
			$('.flexslider').flexslider({
				animation : "slide",
				controlNav : "thumbnails"
			});
		});
	</script>
	<script src="<%=staticPath%>/js/jquery.magnific-popup.js"
		type="text/javascript"></script>
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
</body>
<link rel="stylesheet" href="<%=staticPath%>/css/flexslider.css"
	type="text/css" media="screen" />
</html>