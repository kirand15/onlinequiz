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
	function goToUserReg(){
		$.ajax({
	        type: "GET",
	        url:contextPath+"/rest/interview/mvc/getQuestions",
	        success: function (result) {
	        },
	        error: function (xhr, status, error) {
	        	alert(xhr.responseText);
	        }
	    });
	}
</script>
<body>
	<div class="navbar navbar-static-top navbar-inverse">
	
		<div class="container">
		
			<a href="registration.html" class="navbar-brand">HOME</a>
			<a href="registration.html" class="navbar-brand" onclick="goToUserReg()">Register</a>
						
		</div>
		
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12 jumbotron">
				<div class="text-center">
					<form class="form-horizontal" method="POST" action="rest/interview/mvc/userValidate">
					<%-- <h1>${it.result})</h1> --%>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
							<div class="col-sm-10">
							<input type="email" class="form-control" id="inputEmail3" name="userEmail" placeholder="email">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-2 control-label">Password</label>
							<div class="col-sm-10">
								<input type="password" name="password" class="form-control" id="inputPassword3" placeholder="password">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-default">Sign in</button>
							</div>
						</div>
					</form>
				</div>
			</div>		
		</div>
	</div>
</body>
</html>