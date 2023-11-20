package gaeul.review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class select_comment_DAO {

	private String url="jdbc:oracle:thin:@localhost:1521:xe";
	private String user="kiga";
	private String pw="kiga1234";
	private Connection con=null;
	
	public ArrayList<commentDTO> commentlist(int rnum){
		ArrayList<commentDTO> listcomment = new ArrayList<commentDTO>();
	try {
		Class.forName("oracle.jdbc.OracleDriver");
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	try {
		con=DriverManager.getConnection(url, user, pw);
		
		String sql="select * from review_comment c join review r on c.review_number= r.review_number where c.review_number=? order by comment_date";
	
		PreparedStatement ps = con.prepareStatement(sql);
	
		ps.setInt(1,rnum);
		
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			int cnum=rs.getInt("comment_number");
			Date date=rs.getDate("comment_date");
			int reviewnum=rs.getInt("review_number");
			String content=rs.getString("comment_content");
			int pw = rs.getInt("comment_password");
			
			commentDTO dto = new commentDTO();
			dto.setComment_content(content);
			dto.setComment_date(date);
			dto.setComment_number(cnum);
			dto.setReview_number(rnum);
			dto.setComment_password(pw);
			dto.setReview_number(reviewnum);
			
			listcomment.add(dto);
		}
		
		rs.close();
	
	} catch (SQLException e) {
		e.printStackTrace();
		}
	return listcomment;
	}
}