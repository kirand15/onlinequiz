package command;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import org.apache.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import connectionprovider.ConnectionProvider;

public class FeedbackCommand {
	
	ObjectMapper mapper = new ObjectMapper();
	
	Logger logger = Logger.getLogger(FeedbackCommand.class);
	Connection connection;
	
	public FeedbackCommand(){
		try{
			connection = ConnectionProvider.getConnection();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public void submitFeedback(String feedback){
		try{
			PreparedStatement statement = connection.prepareStatement("INSERT INTO feedback values(?)");
			statement.setString(1, feedback);
			statement.executeUpdate();
		}catch(Exception ex){
			logger.error(ex);
		}
	}
	
}
