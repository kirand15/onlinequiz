<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form method="POST" action="<%=request.getContextPath()%>/rest/interview/mvc/userRegistration">
		First Name:<input type="text" name="firstName"><br/>
		Last Name:<input type="text" name="lastName"><br/>
		Email:<input type="text" name="email"><br/>
		Password:<input type="text" name="upassword"><br/>
		Phone#:<input type="text" name="phone"><br/>
		<input type="submit">
	</form>
</body>
</html>