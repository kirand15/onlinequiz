<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href="styles.css" rel="stylesheet"/>

</head>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
var contextPath='<%=request.getContextPath()%>';
	function goToUserReg(){
		window.location = contextPath+"/rest/interview/mvc/goToReg";
	}
	
	function validateUser(){
		$.ajax({
	        type: "POST",
	        url:contextPath+"/rest/interview/mvc/userValidate",
	        data:{
	        	userEmail: $("#inputEmail3").val(),
	        	password: $("#inputPassword3").val()
	        },
	        success: function (result) {
	        },
	        error: function (result) {
	            
	        }
	    });	
	}
	
</script>
<jsp:include page="header.html"></jsp:include>
<body>
	<div class="navbar navbar-static-top navbar-inverse">
	
		<div class="container">
		
			<a class="navbar-brand">HOME</a>
			<a href="#" class="navbar-brand" onclick="goToUserReg()">Register</a>
						
		</div>
		
	</div>
	<div class="container" style="height:600px;">
		<div class="row" style="height: 600px">
			<div class="col jumbotron" style="height: 600px">
				<div class="text-center" style="height: 600px">
					<form class="form-horizontal" method="POST" action="/unh/rest/interview/mvc/userValidate" style="width: 50%">
					<%-- <h1>${it.result})</h1> --%>
						<div class="form-group" style="width: 100%">
							<label for="inputEmail3" class="col-sm-2 control-label" style="width: 40%">Email</label>
							<div class="col-sm-10" style="width: 60%">
							<input type="email" class="form-control" id="inputEmail3" name="userEmail" placeholder="email">
							</div>
						</div>
						<div class="form-group" style="width: 100%">
							<label style="width: 40%" for="inputPassword3" class="col-sm-2 control-label">Password</label>
							<div class="col-sm-10" style="width: 60%">
								<input type="password" name="password" class="form-control" id="inputPassword3" placeholder="password">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default" onclick="validateUser()">Sign in</button>
							</div>
						</div>
					</form>
				</div>
			</div>		
		</div>
	</div>
</body>
<jsp:include page="footer.html"></jsp:include>
</html>