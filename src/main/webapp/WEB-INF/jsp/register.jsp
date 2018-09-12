<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String staticPath = path + "/static";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>注册</title>
<meta name="keywords"
	content="Fashion Mania Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>

<!-- slide -->
</head>
<body>
	<jsp:include page="top.jsp" />
	<!--//header-->
	<div class="container">
		<div class="register">
			<h1>Register</h1>
			<!-- 注册表单 -->
			<form class="form-signin" method="post"
				action="<%=path%>/shop/regist">
				<div class="col-md-6  register-top-grid">

					<div class="mation">
						<span>First Name</span> <input type="text" id="inputFirstName"
							name="username" placeholder="用户名" required autofocus> <span>Last
							Name</span> <input type="text" placeholder="确认用户名" id="inputLastName"
							required> <span>Email Address</span> <input type="text"
							id="inputEmail" name="email" placeholder="邮箱地址" required>
					</div>

					<div class="clearfix"></div>
					<a class="news-letter" href="#"> <label class="checkbox"><input
							type="checkbox" name="checkbox" checked="checked"><i>
						</i>Sign Up</label>
					</a>
				</div>

				<div class=" col-md-6 register-bottom-grid">

					<div class="mation">
						<span>Password</span> <input type="text" id="inputPassword"
							placeholder="密码" name="password" required> <span>Confirm
							Password</span> <input type="text" placeholder="确认密码"
							id="inputConfirmPassword" required>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="register-but">
					<input type="submit" value="submit">
					<div class="clearfix"></div>
			</div>
			</form>

			<!--  这段注册按钮，如果放到上面的form里面，则样式就会消失
			 <div class="register-but">
				<form>
					<input type="submit" value="submit">
					<div class="clearfix"></div>
				</form>
			</div> -->
			
		</div>
	</div>
</body>
<script type="text/javascript">
window.onload = function() {
	var message = '${message}';
	if (message != null && message != "" && message != undefined) {
		alert(message);
	}
};
</script>


</html>