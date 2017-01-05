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

function callManageUsers(){
	$("#addQuestion").css("visibility","hidden");
	 $.ajax({
        type: "GET",
        url: contextPath+"/rest/interview/mvc/showUsersList",
        success: function (result) {
        	var appenddata = "<HTML><BODY>";
        	for(var i = 0; i<result.userList.length;i++){
        		appenddata =appenddata+ "<SPAN>First Name:"+result.userList[i].userFirstName+"</SPAN><BR>"+
        		"<SPAN>Last Name:"+result.userList[i].userLastNAme+"</SPAN><BR>"+
        		"<SPAN>Email:"+result.userList[i].userEmail+"</SPAN><BR>"
        		+"<SPAN>phone:"+result.userList[i].phone+
        		"</SPAN><BR><BUTTON onclick='deleteUser("+result.userList[i].userEmail+")'>Delete</BUTTON><BR>";
        	}
        	appenddata = appenddata+"</BODY></HTML>";
        	$("#showUsersData").text(appenddata)
        	$("#delete").css("visisbility","visible");
        	$("#showUsersData").css("visibility","visible");		
        },
        error: function (xhr, status, error) {
        	alert(xhr.responseText);
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