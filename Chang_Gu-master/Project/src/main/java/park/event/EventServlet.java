package park.event;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/EventServlet")
@MultipartConfig
public class EventServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String os = "asb";
		String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
		String jdbcUsername = "kiga";
		String jdbcPassword = "kiga1234";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String event_name = request.getParameter("event_name");
		String event_day = request.getParameter("event_day");
		String event_time = request.getParameter("event_time");
		String event_location = request.getParameter("event_location");
		double event_price = Double.parseDouble(request.getParameter("event_price"));
		int event_age = Integer.parseInt(request.getParameter("event_age"));
		Part event_img = request.getPart("event_img");
		String event_explain = request.getParameter("event_explain");
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			String sql = "INSERT INTO event (event_name, event_day, event_time, event_location, event_price, event_age, event_img, event_explain) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";			
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, event_name);
			preparedStatement.setString(2, event_day);
			preparedStatement.setString(3, event_time);
			preparedStatement.setString(4, event_location);
			preparedStatement.setDouble(5, event_price);
			preparedStatement.setInt(6, event_age);
			preparedStatement.setBinaryStream(7, event_img.getInputStream(),(int) event_img.getSize());
			preparedStatement.setString(8, event_explain);
			
			preparedStatement.executeUpdate();
			
			request.getSession().setAttribute("event_name", event_name);
			request.getSession().setAttribute("event_day", event_day);
			request.getSession().setAttribute("event_time", event_time);
			request.getSession().setAttribute("event_location", event_location);
			request.getSession().setAttribute("event_price", event_price);
			request.getSession().setAttribute("event_age", event_age);
			request.getSession().setAttribute("event_img", event_img);
			request.getSession().setAttribute("event_explain", event_explain);
			
			// 성공할 경우 이동할 페이지 설정해주고 다시 전송
			response.sendRedirect("Event_add_success.jsp");
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}