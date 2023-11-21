package gaeul.review;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/insertCommentDAO")
public class insertCommentDAO extends HttpServlet {
	
	private String url="jdbc:oracle:thin:@localhost:1521:xe";
	private String user="kiga";
	private String pw="kiga1234";
	private Connection con=null;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			con=DriverManager.getConnection(url, user, pw);
			
			String sql="insert into review_comment(comment_content,review_number,comment_password,comment_date) "
					+ "values(?,?,?,sysdate)";
		
			
			PreparedStatement ps = con.prepareStatement(sql);
			String comment_content = request.getParameter("comment_content");
			int review_number = Integer.parseInt(request.getParameter("rnum"));
			int comment_password = Integer.parseInt(request.getParameter("comment_password"));
			
			System.out.println(review_number);
			
			ps.setString(1,comment_content);
			ps.setInt(2,review_number);
			ps.setInt(3,comment_password);
			
			ps.executeUpdate();
			
			response.sendRedirect("choose_result.jsp?review_number="+review_number);
		} catch (SQLException e) {
			response.sendRedirect("comment_error.jsp");
			e.printStackTrace();
		}
		
	}

}
