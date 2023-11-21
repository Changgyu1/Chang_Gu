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


@WebServlet("/insertDAO")
public class insertDAO extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String festivalurl="jdbc:oracle:thin:@localhost:1521:xe";   
		String festivaluser="kiga";  
		String festivalpassword="kiga1234";     
		  
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
		} catch (ClassNotFoundException e1) {
			
			e1.printStackTrace();
		}
		
		try {
			Connection con = DriverManager.getConnection(festivalurl, festivaluser, festivalpassword);
			
			int event_number=Integer.parseInt(request.getParameter("event_number"));
			System.out.println(event_number);
			String review=request.getParameter("review");  
			String review_title=request.getParameter("review_title");
			String sql="insert into review (review,review_title,event_number,review_date) values(?,?,?,sysdate)";
			
			PreparedStatement ps =con.prepareStatement(sql);
			
			ps.setString(1, review);
			ps.setString(2, review_title);
			ps.setInt(3, event_number);
			
			ps.executeUpdate();
	
			request.getSession().setAttribute("event_number",event_number);
			request.getSession().setAttribute("review",review);
			request.getSession().setAttribute("review_title",review_title);
			
			response.sendRedirect("review_sucess.jsp");
		} catch (SQLException e) {
			response.sendRedirect("review_error.jsp");
			e.printStackTrace();
		}
		
		
		
	}

}
