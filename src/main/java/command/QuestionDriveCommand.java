package command;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import connectionprovider.ConnectionProvider;
import model.Questions;

public class QuestionDriveCommand {
	
	ObjectMapper mapper = new ObjectMapper();
	
	//Logger logger = Logger.getLogger(QuestionDriveCommand.class);
	Connection connection;
	
	public QuestionDriveCommand(){
		try{
			connection = ConnectionProvider.getConnection();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public Questions getQuestion(){
		//logger.info("Into the getQuestions method of QuestionDriveCommand class:");
		Questions questions = new Questions();
		try{
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM questions ORDER BY RANDOM() LIMIT 1");
			while(rs.next()){
				
				String splitChoices[] = rs.getString("choices").split(",");
				List<String> choicesList = new ArrayList<String>();
				choicesList.add(splitChoices[0].trim());
				choicesList.add(splitChoices[1].trim());
				choicesList.add(splitChoices[2].trim());
				choicesList.add(splitChoices[3].trim());
				
				questions.setQuestion(rs.getString("question").trim());
				questions.setChoices(choicesList);
				questions.setAnswer(rs.getString("answer").trim());
			}
		}catch(Exception ex){
			ex.printStackTrace();
			//logger.error("Exception Occured in getQuestion method of QuestionDriveCommand class", ex);
		}
		return questions;
	}
	
	public Questions driveQuestions(Questions questions){
		//logger.info("Into the getQuestions method of QuestionDriveCommand class:");
		try{
			
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT userid FROM activeuser order by userid asc limit 1");
			int currUser = 0;
			while(rs.next()){
				currUser = rs.getInt("userid");
			}
			
			PreparedStatement statement = connection.prepareStatement("INSERT INTO userresponse VALUES(?,?,?,?)");
			statement.setInt(1, currUser);
			statement.setString(2, questions.getQuestion().trim());
			statement.setString(3, questions.getAnswer().trim());
			statement.setString(4, questions.getOptions().trim());
			statement.executeUpdate();
		}catch(Exception ex){
			ex.printStackTrace();
			//logger.error("Exception Occured in getQuestion method of QuestionDriveCommand class", ex);
		}
	return getQuestion();
}
		
	public void showSummary(int answers){
		DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		int currUser = 0;
		try{
			LocalDate localDate = LocalDate.now();
	        System.out.println();
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT userid FROM activeuser order by userid asc limit 1");
			while(rs.next()){
				currUser = rs.getInt("userid");
				}
			PreparedStatement statement = connection.prepareStatement("INSERT INTO userrecords VALUES(?,?,?)");
			statement.setInt(1, currUser);
			statement.setInt(2, answers);
			statement.setString(3, DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate));
			//statement.setString(4, questions.getOptions().trim());
			statement.executeUpdate();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public List<Questions> modifyUpdate(){
		List<Questions> questionsList = new ArrayList<Questions>();
		Questions questions;
		try{
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM questions");
			while(rs.next()){
				questions = new Questions();
				questions.setQuestion(rs.getString("question"));
				questions.setOptions(rs.getString("choices"));
				questions.setAnswer(rs.getString("answer"));
				questionsList.add(questions);
			}
		}catch(Exception ex){
			
		}
		return questionsList;
	}
	
}
