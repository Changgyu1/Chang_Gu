package sa_event;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class QnaServlet
 */
@WebServlet("/InsertServlet")
public class InsertServlet extends HttpServlet {
	String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
	String jdbcUsername = "kiga";
	String jdbcPassword = "kiga1234";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection connection = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			
			String event_number = request.getParameter("event_number");
			String qna_title = request.getParameter("qna_title");
			String qna_content = request.getParameter("qna_content");
			String qna_password = request.getParameter("qna_password");
			String qna_name = request.getParameter("qna_name");

			String qna_email = request.getParameter("qna_email");
			
			String sql = "INSERT INTO QNA (event_number, qna_title, qna_content, qna_password, qna_name, qna_date, qna_email) VALUES (?,?,?,?,?,sysdate,?)";
			
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, event_number);
			preparedStatement.setString(2, qna_title);
			preparedStatement.setString(3, qna_content);
			preparedStatement.setString(4, qna_password);
			preparedStatement.setString(5, qna_name);
			preparedStatement.setString(6, qna_email);
			
			preparedStatement.executeUpdate();
			
			request.getSession().setAttribute("event_number", event_number);
			request.getSession().setAttribute("qna_title", qna_title);
			request.getSession().setAttribute("qna_content", qna_content);
			request.getSession().setAttribute("qna_password", qna_password);
			request.getSession().setAttribute("qna_name", qna_name);

			request.getSession().setAttribute("qna_email", qna_email);
			
			response.sendRedirect("Qna_List.jsp");
			
			
		} catch (SQLException e) {
			//
			response.sendRedirect("QnaWrite_error.jsp");
			e.printStackTrace();
		}
		
	}

}
