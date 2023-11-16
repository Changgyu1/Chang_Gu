//package gaeul.review;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.SQLException;
//
//public class select_Chart_DAO {
//
//	
//	private String url="jdbc:oracle:thin:@localhost:1521:xe";
//	private String user="kiga";
//	private String pw="kiga1234";
//	private Connection con=null;
//	
//	
//	public int popularlitychart() {
//			
//		
//		try {
//			Class.forName("oracle.jdbc.OracleDriver");
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		}
//		
//		try {
//			con = DriverManager.getConnection(url, user, pw);
//			
//			String sql = "select*from ";
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		
//		
//			
//			
//			
//			return 0;
//	}
//	
//}
