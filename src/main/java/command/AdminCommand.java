package command;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.apache.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import connectionprovider.ConnectionProvider;
import model.userModel;

public class AdminCommand {
	
	
	ObjectMapper mapper = new ObjectMapper();
	Logger logger = Logger.getLogger(AdminCommand.class);
	Connection connection;
	
	public AdminCommand(){
		try{
			connection = ConnectionProvider.getConnection();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public List<userModel> showUsersList(){
		userModel usermodel;
		List<userModel> usersList = new ArrayList<userModel>();
		try{
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM userdata");
			while(rs.next()){
				usermodel = new userModel();
				usermodel.setUserFirstName(rs.getString("firstname"));
				usermodel.setUserLastNAme(rs.getString("lastname"));
				usermodel.setUserEmail(rs.getString("email"));
				usermodel.setPhone(rs.getString("phone"));
				usersList.add(usermodel);
			}
		}catch(Exception ex){
			ex.printStackTrace();
			logger.error(ex);
		}
		return usersList;
	}
	
}
