package Constants;

public class AppConstants {

	public final String QueAddSuccess = "Question Added successfully";
	public final String regSuccess = "Registration Successfull";
	
	//SQL contants
	public final String insertUserValues= "INSERT INTO activeuser VALUES(?)";
	public final String maxUserID = "SELECT MAX(userid)as userid FROM userdata";
}
