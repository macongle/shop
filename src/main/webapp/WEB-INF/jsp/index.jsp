<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String staticPath = path + "/static";
%>
<!DOCTYPE html>
<html>

<head>
<title>主页</title>

</head>

<body>
	<jsp:include page="top.jsp"/> 
	<!-- 图片展示 -->
	<div class="banner">
		<div class="col-sm-3 banner-mat">
			<img class="img-responsive" src="<%=staticPath%>/images/ba1.jpg"
				alt="">
		</div>
		<!-- 轮播 -->
		<div class="col-sm-6 matter-banner">
			<div class="slider">
				<div class="callbacks_container">
					<ul class="rslides" id="slider">
						<li><img src="<%=staticPath%>/images/1.jpg" alt=""></li>
						<li><img src="<%=staticPath%>/images/2.jpg" alt=""></li>
						<li><img src="<%=staticPath%>/images/1.jpg" alt=""></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-sm-3 banner-mat">
			<img class="img-responsive" src="<%=staticPath%>/images/ba.jpg"
				alt="">
		</div>
		<div class="clearfix"></div>
		<input type="hidden" value="mcl" name="name" >
	</div>
	<!--content-->
	<div class="content">
		<!-- 内容展示 -->
		<div class="container">
			<div class="content-top">
				<h1>Recent Products</h1>
				<div class="content-top1">
					<div class="col-md-3 col-md2">
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
					<div class="col-md-3 col-md2">
						<div class="col-md1 simpleCart_shelfItem">
							<a href="<%=path%>/jump/single"> <img class="img-responsive"
								src="<%=staticPath%>/images/pi2.png" alt="" />
							</a>
							<h3>
								<a href="<%=path%>/jump/single">T-Shirt</a>
							</h3>
							<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"></div>
							</div>

						</div>
					</div>
					<div class="col-md-3 col-md2">
						<div class="col-md1 simpleCart_shelfItem">
							<a href="<%=path%>/jump/single"> <img class="img-responsive"
								src="<%=staticPath%>/images/pi4.png" alt="" />
							</a>
							<h3>
								<a href="<%=path%>/jump/single">Shirt</a>
							</h3>
							<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"></div>
							</div>

						</div>
					</div>
					<div class="col-md-3 col-md2">
						<div class="col-md1 simpleCart_shelfItem">
							<a href="<%=path%>/jump/single"> <img class="img-responsive"
								src="<%=staticPath%>/images/pi1.png" alt="" />
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
				<div class="content-top1">
					<div class="col-md-3 col-md2">
						<div class="col-md1 simpleCart_shelfItem">
							<a href="<%=path%>/jump/single"> <img class="img-responsive"
								src="<%=staticPath%>/images/pi3.png" alt="" />
							</a>
							<h3>
								<a href="<%=path%>/jump/single">Shirt</a>
							</h3>
							<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"></div>
							</div>

						</div>
					</div>
					<div class="col-md-3 col-md2">
						<div class="col-md1 simpleCart_shelfItem">
							<a href="<%=path%>/jump/single"> <img class="img-responsive"
								src="<%=staticPath%>/images/pi5.png" alt="" />
							</a>
							<h3>
								<a href="<%=path%>/jump/single">T-Shirt</a>
							</h3>
							<div class="price">
								<h5 class="item_price">$300</h5>
								<a href="#" class="item_add">Add To Cart</a>
								<div class="clearfix"></div>
							</div>

						</div>
					</div>
					<div class="col-md-3 col-md2">
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
					<div class="col-md-3 col-md2">
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
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>