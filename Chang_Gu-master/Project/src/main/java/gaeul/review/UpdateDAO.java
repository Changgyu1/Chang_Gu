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


@WebServlet("/UpdateDAO")
public class UpdateDAO extends HttpServlet {
	
	private String url ="jdbc:oracle:thin:@localhost:1521:xe";
	private String user="kiga";
	private String pw="kiga1234";
	private Connection con;
	private PreparedStatement ps;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		
		try {
			con = DriverManager.getConnection(url, user, pw);
			
			String sql="update review set review_title=? , review=? where review_number=?";
			
			String updateTitle = request.getParameter("updateTitle");
			String updateReview = request.getParameter("updateReview");
			int updatenumber = Integer.parseInt(request.getParameter("rnum"));
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1,updateTitle);
			ps.setString(2,updateReview);
			ps.setInt(3,updatenumber);
			
			ps.executeUpdate();
			
			response.sendRedirect("review_sucess.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect("review_sucess.jsp");
		}
		
		
		
	}

}
