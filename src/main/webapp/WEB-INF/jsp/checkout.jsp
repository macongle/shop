<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String staticPath = path + "/static";
%>
<!DOCTYPE html>
<html>
<head>

<title>购物车</title>
<meta name="keywords"
	content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<!-- slide -->
</head>
<body>

	<jsp:include page="top.jsp" />

	<div class="container">
		<div class="check-out">
			<h1>Checkout</h1>
			<!-- 购物车列表 -->
			<table>
				<tr>
					<th>Item</th>
					<th>Qty</th>
					<th>Prices</th>
					<th>Delery Detials</th>
					<th>Subtotal</th>
					<th>Operation</th>
				</tr>
				<!-- 判断user里面的总价格是否有数，如果有数值，则说明，该用户购物车里面添加的有物品
				 如果没有数值，则说明该用户的购物车里面没有数据，就提示还没有购物，请去购物 -->
				<c:if test="${sessionScope.user.totals!=0}">
				<c:forEach items="${requestScope.list}" var="cart">
						<tr>
							<td class="ring-in"><a
								href="<%=path%>/cart/checksingle/${cart.id}" class="at-in"><img
									src="<%=path %>${cart.img}" class="img-responsive" alt=""></a>
								<div class="sed">
									<h5>${cart.title}</h5>
									<p>(${cart.resume})</p>
								</div>
								<div class="clearfix"></div></td>
							<td class="check"><input type="text" value="${cart.number}"
								class="inputCount" name="${cart.id}"></td>
							<td>$${cart.prices }</td>
							<td>${cart.freight}</td>
							<td>$${cart.total}</td>
							<td><a onclick="return confirm('是否删除？')"
								href="<%=path%>/cart/del/${cart.id}/${sessionScope.user.id}"
								class=" to-buy">DELETE</a></td>
						</tr>
					</c:forEach>
				  </c:if>
			    <c:if test="${requestScope.user.totals == 0}">
			    <tr>
			       <td>There's nothing in the shopping cart,Hurry up and <a
							href="<%=path%>/close/products">go shopping</a></td>
			    </tr>
						
				</c:if>
			</table>
			<a href="<%=path%>/jump/pay" class=" to-buy">PROCEED TO BUY</a>
			<div class="clearfix"></div>
		</div>
	</div>
</body>

<script type="text/javascript">  
$(".inputCount").change(function(){
	var defaultCount = this.defaultValue;
	var count = $(this).val();
	var cartid = $(this).attr("name");
	var reg=/^\+?[1-9][0-9]*$/;
	if(!reg.test(count)){
		this.value=defaultCount;
		alert("请输入一个正整数！！！");
		return false;
	}else{
		this.defaultValue = this.value;
	}
	window.location = "<%=path%>/cart/updateCart?count=" + count
						+ "&cartid=" + cartid;
			});
</script>
</html>