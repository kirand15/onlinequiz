
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html/; charset=ISO-8859-1">
<title></title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12 jumbotron">
				<div class="text-center">
					<%-- <h1>${it.result})</h1> --%>
					
					<c:forEach items="${it.userString.getJSONArray(\"userList\")}" var="userdata">
							<div>
								<span>${userdata.userFistName)}</span><br>
								<span>${userdata.userLastNAme)}</span><br>
								<span>${userdata.userEmail)}</span><br>
								<span>${userdata.phone)}/span><br>
								<input type="button" value="Delete" onclick="deleteUser();"/><br>
							</div>
							<hr>
					</c:forEach>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>