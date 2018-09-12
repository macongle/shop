<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String staticPath = path + "/static";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>登陆</title>

</head>
<body>
	<jsp:include page="top.jsp"/>
	<!--//header-->
	<div class="account">
		<div class="container">
			<h1>Account</h1>
			<div class="account_grid">
				<div class="col-md-6 login-right">
					<!-- 登陆表单 -->
					<form action="<%=path%>/shop/login" method="post" >

						<span>Email Address</span> <input type="text" name="email"> <span>Password</span>
						<input type="text" name="password">
						<div class="word-in">
							<a class="forgot" href="#">Forgot Your Password?</a> <input
								type="submit" value="Login">
						</div>
					</form>
				</div>
				<div class="col-md-6 login-left">
					<h4>NEW CUSTOMERS</h4>
					<p>By creating an account with our store, you will be able to
						move through the checkout process faster, store multiple shipping
						addresses, view and track your orders in your account and more.</p>
					<a class="acount-btn" href="<%=path%>/shop/register">Create an Account</a>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
window.onload = function() {
	var msg = '${msg}';
	if (msg != null && msg != "" && msg != undefined) {
		alert(msg);
	}
};
</script>
</html>