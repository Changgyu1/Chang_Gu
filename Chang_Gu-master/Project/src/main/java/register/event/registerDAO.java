package register.event;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class registerDAO {

	private static final String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String username = "kiga";
	private static final String Upassword = "kiga1234";
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
			conn = DriverManager.getConnection(jdbcURL, username, Upassword);
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
			conn = DriverManager.getConnection(jdbcURL, username, Upassword);
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
	
	public registerDTO findEmail(String phonenumber) {
		registerDTO dto = new registerDTO();
		String sql = "SELECT EMAIL FROM USERS WHERE PHONENUMBER = ?";
		Connection conn;
		try {
			conn = DriverManager.getConnection(jdbcURL, username, Upassword);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, phonenumber);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				phonenumber = rs.getString("email");

                 dto = new registerDTO(phonenumber);
                 return dto;
			} else {
				return null;
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return null; // DB ����
	}
	
	public registerDTO findPassword(String phonenumber, String email) {
		registerDTO dto = new registerDTO();
		String sql = "SELECT email, phonenumber FROM USERS WHERE PHONENUMBER = ? AND email = ?";
		Connection conn;
		try {
			conn = DriverManager.getConnection(jdbcURL, username, Upassword);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, phonenumber);
			ps.setString(2, email);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				phonenumber = rs.getString("phonenumber");
				email = rs.getString("email");

                 dto = new registerDTO(phonenumber, email);
                 return dto;
			} else {
				return null;
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return null; // DB ����
	}
	
	public int UpdatePassword(String password, String email) {
		String sql = "UPDATE USERS SET password = ? WHERE email = ?";
		Connection conn;
		try {
			conn = DriverManager.getConnection(jdbcURL, username, Upassword);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, password);
			ps.setString(2, email);

			return ps.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return -1; //DB ���� 
	}
}
