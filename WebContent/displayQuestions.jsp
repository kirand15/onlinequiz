<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Interview App</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">

var numberOfQuestions = 0;
var questionsCount = 0;
var correctAns = 0
var answer = "";
var contextPath='<%=request.getContextPath()%>';

function callQuestions(){
	numberOfQuestions = $("#noOfQues").val();
	 $.ajax({
	        type: "POST",
	        url:contextPath+"/rest/interview/mvc/getQuestions",
	        success: function (result) {
	        	$("#proceedQuestion").hide();
	            var questionContent = result.split("-");
	            var choiceList = questionContent[1].split(",");
	            var questionAnswer = questionContent[2]; 
	            $("#choice1").text("1. "+choiceList[0].substring(1,choiceList[0].length));
	            $("#choice2").text("2. "+choiceList[1]);
	            $("#choice3").text("3. "+choiceList[2]);
	            $("#choice4").text("4. "+choiceList[3].substring(0,choiceList[3].length-1));
	            $("#questionContent").text(questionContent[0]);
	            answer = questionContent[2].trim();
	            $("#showQuestion").css("visibility","visible");
	        },
	        error: function (xhr, status, error) {
	        	alert(xhr.responseText);
	        }
	    });
}

function callNextQuestion(){
		var question = $("#questionContent").text();
		var selectedChoice = $("#choiceSelected").val().trim();
		if(answer == selectedChoice){
			correctAns = correctAns + 1;
		}
		$.ajax({
	        type: "POST",
	        url:contextPath+"/rest/interview/mvc/driveQuestions",
	        data : {
	        	question : question,
	        	answer : answer,
	        	selected : selectedChoice
	        },
	        success: function (result) {
	        	$("#proceedQuestion").hide();
	        	if(questionsCount < numberOfQuestions){
	            var questionContent = result.split("-");
	            var choiceList = questionContent[1].split(",");
	            var questionAnswer = questionContent[2]; 
	            $("#choice1").text("1. "+choiceList[0].substring(1,choiceList[0].length));
	            $("#choice2").text("2. "+choiceList[1]);
	            $("#choice3").text("3. "+choiceList[2]);
	            $("#choice4").text("4. "+choiceList[3].substring(0,choiceList[3].length-1));
	            $("#questionContent").text(questionContent[0]);
	            answer = questionContent[2].trim();
	            $("#showQuestion").css("visibility","visible");
	            $("#choiceSelected").val("");
	            questionsCount = questionsCount + 1;
	        	}else{
	        		$("#showQuestion").css("display","none");
	        		$("#testEnd").css("visibility","visible");
	        	}
	        },
	        error: function (xhr, status, error) {
	        	alert(xhr.responseText);
	        }
	    });
}

function showTestSummary(){
	$.ajax({
        type: "POST",
        url:contextPath+"/rest/interview/mvc/driveQuestions",
        data : {
        	correctAns : correctAns,
        	numberOfQuestions : numberOfQuestions,
        },
        success: function (result) {
        	$("#testEnd").hide();
        	$("#showResult").text("Answered correctly "+correctAns+ "out of "+numberOfQuestions);
        	$("#resultData").css("visibility","visible");
        },
        error: function (xhr, status, error) {
        	alert(xhr.responseText);
        }
    });
}

function goToUserReg(){
	window.location = contextPath+"/rest/interview/mvc/goToReg";
}

function logOut(){
	$.ajax({
        type: "POST",
        url:contextPath+"/rest/interview/mvc/logOut",
        success: function (result) {
        	window.location = contextPath+"/rest/interview/mvc/logOutUser";
        },
        error: function (xhr, status, error) {
        	alert(xhr.responseText);
        }
    });
	/* window.location = contextPath+"/rest/interview/mvc/logOut"; */
}
</script>
<jsp:include page="header.html"></jsp:include>
<body>
	<div class="navbar navbar-static-top navbar-inverse">
	
		<div class="container">
			<a href="#" class="navbar-brand" onclick="logOut()">Logout</a>
		</div>
		
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12 jumbotron">
				<div class="text-center">
						<div id="proceedQuestion">
							<div class="form-group">
								<label for="" class="col-sm-2 control-label">Prepare for the interview here!</label>
							</div>
							<div class="form-group">
								<label for="" class="col-sm-2 control-label">Enter the amount of question to be displayed( max 25):</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="noOfQues">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button id="clickProceed" onclick="callQuestions()">Proceed</button>
								</div>
							</div>
						</div>
						
						<div id="showQuestion" style="visibility: hidden;">
							<div class="form-group">
							<br>
								<label for="" class="col-sm-2 control-label"><h1>Prepare for the interview here!</h1></label>
							</div>
							<div class="form-group">
								<span id="questionContent"></span>
								<div class="col-sm-10">
									<span id="choice1"></span><br>
									<span id="choice2"></span><br>
									<span id="choice3"></span><br>
									<span id="choice4"></span><br>
								</div>
								<br>
								
								<div class="form-group">
									Type the correct answer below!<br>
									<input type="text" id="choiceSelected"/>
									<input type="text" id="answer" style="visibility: hidden;"/>
								</div>
							</div>
							<br>
							<br>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-default" onclick="callNextQuestion();">Next Question</button>
								</div>
							</div>
						</div>
						<div id="showTestSummary" style="visibility: hidden;">
							<span id="summary">
							</span>
						</div>
				</div>
					<div id="testEnd" style="visibility: hidden;">
						<h1>Thank You! End of Test. CLick Proceed to view the Result.</h1>
						<input type="button" value="Proceed" onclick="showTestSummary()"/>			
					</div>
					<div id="resultData" style="visibility: hidden;">
						<span id="showResult"></span>
					</div>
			</div>		
		</div>
	</div> 
</body>
<jsp:include page="footer.html"></jsp:include>
</html>