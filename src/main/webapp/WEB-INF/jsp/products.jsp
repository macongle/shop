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
<title>所有商品</title>
<meta name="keywords"
	content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 


</script>
</head>
<body>
	<jsp:include page="top.jsp" />
	<div class="products">
		<div class="container">
			<h1>Products</h1>
			<div class="col-md-9">
				<div class="content-top1">
					<!-- 全部商品列表 -->
					<c:forEach items="${requestScope.close}" var="close"
						varStatus="status">
						<div class="col-md-4 col-md3">
							<div class="col-md1 simpleCart_shelfItem">
								<a href="<%=path%>/cart/single/${close.id}"> <img
									class="img-responsive" src="<%=path%>${close.imgAddress}"
									alt="" />
								</a>
								<h3>
									<a href="<%=path%>/jump/single">${close.style}</a>
								</h3>
								<input type="hidden" value="${close.imgAddress}"
									name="imgAddress"> <input type="hidden"
									value="${close.prices}" name="prices"> <input
									type="hidden" value="${close.style}" name="style"> <input
									type="hidden" value="${close.title}" name="title">
								<div class="price">
									<h5 class="item_price">$${close.prices}</h5>
									<c:if test="${sessionScope.user != null}">
									<a href="<%=path%>/cart/${close.id}" class="item_add">Add
										To Cart</a>
									</c:if>	
									<c:if test="${sessionScope.user == null}">
									<a href="<%=path%>/cart/login" class="item_add">Add
										To Cart</a>
									</c:if>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>
						 <c:if test="${(status.count) % 3 == 0}">
							<div class="clearfix"></div>
						</c:if> 
					</c:forEach>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="col-md-3 product-bottom">
				<!-- 销量排行推荐 -->
				<jsp:include page="bestseller.jsp" />
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
</body>
</html>