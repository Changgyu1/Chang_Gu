package sa_event;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class QnaDetailServlet
 */
@WebServlet("/QnaDetailServlet")
public class QnaDetailServlet extends HttpServlet {
	String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
	String jdbcUsername = "kiga";
	String jdbcPassword = "kiga1234";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
		    connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

		    int qna_number = Integer.parseInt(request.getParameter("qna_number"));
		    String sql = "select * from qna where qna_number = ?";

		    PreparedStatement ps = connection.prepareStatement(sql);

		    ps.setInt(1, qna_number);

		    ResultSet resultSet = ps.executeQuery();

		    if (resultSet.next()) {
		        HttpSession session = request.getSession();
		        session.setAttribute("qna_number", qna_number);
		        session.setAttribute("event_number", resultSet.getString("event_number"));
		        session.setAttribute("qna_title", resultSet.getString("qna_title"));
		        session.setAttribute("qna_content", resultSet.getString("qna_content"));
		        session.setAttribute("qna_name", resultSet.getString("qna_name"));
		        session.setAttribute("qna_date", resultSet.getString("qna_date"));
		        session.setAttribute("qna_email", resultSet.getString("qna_email"));
		    }

		    response.sendRedirect("Qna_Detail.jsp?qna_number=" + qna_number);

		} catch (SQLException e) {
		    response.sendRedirect("");
		    e.printStackTrace();
		}


	}

}
