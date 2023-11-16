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

@WebServlet("/deletecommentDAO")
public class deletecommentDAO extends HttpServlet {
	
	
		private String url ="jdbc:oracle:thin:@localhost:1521:xe";
		private String user="kiga";
		private String pw="kiga1234";
		private Connection con;
		private PreparedStatement ps;
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				try {
					con=DriverManager.getConnection(url, user, pw);
					
					String sql="delete from review_comment where comment_password=? and comment_number=?";
					int commentpw=Integer.parseInt(request.getParameter("commentpw"));
					int conum = Integer.parseInt(request.getParameter("conum"));
		
					ps=con.prepareStatement(sql);
					ps.setObject(1,commentpw);
					ps.setInt(2, conum);
					ps.executeUpdate();
			
					response.sendRedirect("review_list.jsp");
				} catch (SQLException e) {
					e.printStackTrace();
					response.sendRedirect("commet_error.jsp");
				}
			}
		}


