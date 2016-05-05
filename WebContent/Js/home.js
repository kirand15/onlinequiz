/**
 * 
 */

var contextPath='<%=request.getContextPath()%>';
var answer;
var count;
var number;

function callQuestionsDrive(){
	 $.ajax({
	        type: "GET",
	        url:contextPath+"/rest/interview/mvc/getQuestions",
	        success: function (result) {
	        	$("#proceedQuestion").hide();
	            var question = result.question;
	            var choiceList = result.choices;
	            String appendData = "<select id='selectChoice'>";
	            for(var i=0;i<choiceList.size();i++){
	            	appendData = appendData + "<option value="+choiceList.get(i)+" id="+choiceList.get(i)+"></option>";
	            }
	            appendData = appendData + "</select>";
	            $("#questionContent").innerText(question);
	            $("#choices").innerText(appendData);
	            answer = result.answer;
	            $("#showQuestion").show();
	        },
	        error: function (result) {
	            
	        }
	    });	
}

function callNextQuestion(){
	var selectedChoice = $( "#selectChoice option:selected" ).text();
	if(answer == selectedChoice) {
		count = count + 1;
	}
	$.ajax({
        type: "POST",
        url:contextPath+"/rest/interview/mvc/driveQuestions",
        data:{
        	question: $("#questionContent").innerText(),
        	answer: selectedChoice
        },
        success: function (result) {
        	$("#proceedQuestion").hide();
        	$("#questionContent").clear();
            $("#choices").clear();
            var question = result.question;
            var choiceList = result.choices;
            String appendData = "<select id='selectChoice'>";
            for(var i=0;i<choiceList.size();i++){
            	appendData = appendData + "<option value='"+choiceList.get(i)+"' id='"+choiceList.get(i)+"'>Volvo</option>";
            }
            appendData = appendData + "</select>";
            $("#questionContent").innerText(question);
            $("#choices").innerText(appendData);
            $("#showQuestion").show();
        },
        error: function (result) {
            
        }
    });	
}

function logoutUser(){
	$.ajax({
        type: "GET",
        url:contextPath+"/rest/interview/mvc/logoutUser",
        success: function (result) {
        },
        error: function (result) {
            
        }
    });	
}