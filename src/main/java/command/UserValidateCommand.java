package command;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;	

import org.apache.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;

import connectionprovider.ConnectionProvider;
import model.userModel;

public class UserValidateCommand {
	ObjectMapper mapper = new ObjectMapper();
	
	//Logger logger = Logger.getLogger(UserValidateCommand.class);
	Connection connection = null;
	
	public UserValidateCommand(){
		try{
			connection = ConnectionProvider.getConnection();
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	public userModel validateUser(userModel usermodel){
		String firstName = null;
		String sql = null;
		ResultSet rs;
		try{
			/*PreparedStatement stmt = connection
					.prepareStatement("SELECT * FROM USERTABLE WHERE userID = ? and password = ?");*/
			Statement statement = connection.createStatement();
			sql = "SELECT * FROM public.userdata WHERE email ='"+usermodel.getUserEmail()+"' and password = '"+usermodel.getPassword()+"'";
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO activeuser VALUES(?)");
				preparedStatement.setString(1, usermodel.getUserEmail());
				preparedStatement.executeUpdate();
				
				usermodel.setRole(rs.getString("role"));
				usermodel.setUserFirstName(rs.getString("firstname"));
				
				firstName = rs.getString("firstName");
				System.out.println(firstName + "\n");
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return usermodel;
	}
	
	public String userRegistration(userModel usermodel){
		try{
			int userid = 0;
			String sql = "INSERT INTO userdata VALUES(?,?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery("SELECT MAX(userid)as userid FROM userdata");
			while(rs.next()){
				userid = Integer.parseInt(rs.getString("userid"));
			}
			statement.setInt(1, userid+1);
			statement.setString(2, usermodel.getUserFirstName());
			statement.setString(3, usermodel.getUserLastNAme());
			statement.setString(4, usermodel.getUserEmail());
			statement.setString(5, usermodel.getPhone());
			statement.setString(6, usermodel.getPassword());
			statement.executeUpdate(); 
		}catch(Exception ex){
			ex.printStackTrace();
			}
		return "Registration Successfull";
		}
	
	public void logoutUser(){
		try{
			Statement statement = connection.createStatement();
			statement.executeUpdate("DELETE FROM activeuser");
		}catch(Exception ex){
			//logger.error(ex);
		}
	}
}
