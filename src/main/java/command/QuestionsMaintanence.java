package command;

import java.sql.Connection;
import java.sql.PreparedStatement;
import org.apache.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import connectionprovider.ConnectionProvider;
import model.Questions;

public class QuestionsMaintanence {
	
	ObjectMapper mapper = new ObjectMapper();
	
	Logger logger = Logger.getLogger(QuestionDriveCommand.class);
	Connection connection;
	
	public QuestionsMaintanence(){
		try{
			connection = ConnectionProvider.getConnection();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public void addQuestion(Questions questions){
		try{
			String sql = "INSERT INTO questions VALUES(?,?,?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, questions.getQuestion());
			statement.setString(2, questions.getOptions());
			statement.setString(3, questions.getAnswer());
			statement.executeUpdate();
		}catch(Exception ex){
			ex.printStackTrace();
			logger.error(ex);
		}
	}
	
	public void deleteQuestion(Questions questions){
		
	}
	
}
