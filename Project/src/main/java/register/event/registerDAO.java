package register.event;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class registerDAO {

	private static final String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String username = "kiga";
	private static final String password = "kiga1234";
	private boolean check;
	public registerDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public String getUser(String email) {
		Connection conn;
	
		try {
			conn = DriverManager.getConnection(jdbcURL, username, password);
			String sql = "SELECT email FROM users where email = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet result = ps.executeQuery();
			
			if(result.next()) {
				email = result.getString("email");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return email;
	}
	
	public registerDTO getUserInfo(String email) {
		registerDTO RegisterDTO = null;
		
		Connection conn;
		try {
			conn = DriverManager.getConnection(jdbcURL, username, password);
			String sql = "SELECT * FROM users where email = ? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet result = ps.executeQuery();
			
			if(result.next()) {
				email = result.getString("email");
				String name = result.getString("name");
				String phonenumber = result.getString("phonenumber");
				String password = result.getString("password");
				
				
				RegisterDTO = new registerDTO(email, name, phonenumber, password);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return RegisterDTO;
	}
}
