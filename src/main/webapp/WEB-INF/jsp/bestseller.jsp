<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String staticPath = path + "/static";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="product-bottom">
		<h3 class="cate">Best Sellers</h3>

		<c:forEach items="${requestScope.list}" var="list">
			<div class="product-go">
				<div class=" fashion-grid">
					<a href="<%=path%>/cart/single/${list.id}"><img class="img-responsive "
						src="<%=path%>${list.imgAddress}" alt=""></a>
				</div>
				<div class=" fashion-grid1">
					<h6 class="best2">
						<a href="<%=path%>/jump/single">${list.title} </a>
					</h6>
					<span class=" price-in1"> $${list.prices}</span>
				</div>
				<div class="clearfix"></div>
			</div>
		</c:forEach>
	</div>
</body>
</html>