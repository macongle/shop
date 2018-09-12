<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%
	String path = request.getContextPath();
	String staticPath = path + "/static";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ADD CLOSE</title>
</head>
<body>
	<jsp:include page="top.jsp"/>
	<!--//header-->
	<div class="account">
		<div class="container">
			<h1>Close Message</h1>
			<div class="account_grid">
				<div class="col-md-6 login-right">
					<form action="<%=path%>/close/add" method="post" enctype="multipart/form-data">

						<span>Img Address</span> <input type="file" name="imgFile">
						<span>Style</span> <input type="text" name="style">
						<span>Prices</span> <input type="number" name="prices">
						<span>Seller</span> <input type="number" name="seller">
						<span>Title</span> <input type="text" name="title">
						<span>Resume</span> <input type="text" name="resume">
						<div class="word-in">
						 <input type="submit" value="Add"> 
						</div>
					</form>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</body>
</html>