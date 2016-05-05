<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12 jumbotron">
				<div class="text-center">
					<form class="form-horizontal" action="#">
					<%-- <h1>${it.result})</h1> --%>
						<c:forEach var="user" items="${it}">
							<div>
								<span>${user.firstName}</span><br>
								<span>${user.lastName}</span><br>
								<span>${user.email}</span><br>
								<span>${user.phone}</span><br>
								<input type="button" value="Delete" onclick="deleteUser();"/><br>
							</div>
						</c:forEach>
					</form>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>