package park.event;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EventPostingServlet
 */
@WebServlet("/EventPostingServlet")
public class EventPostingServlet extends HttpServlet {
	private static final String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String username = "kiga";
	private static final String password = "kiga1234";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection connection = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			connection = DriverManager.getConnection(jdbcURL, username, password);
			String sql = "SELECT * FROM event";
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			ArrayList<EventPosting> eventPostings = new ArrayList<>();
			
			while(rs.next()) {
				int event_number = rs.getInt("event_number");
				String event_name = rs.getString("event_name");
				String event_day = rs.getString("event_day");
				String event_time = rs.getString("event_time");
				String event_location = rs.getString("event_location");
				double event_price = rs.getDouble("event_price");
				int event_age = rs.getInt("event_age");
				String event_explain = rs.getString("event_explain");
				EventPosting eventPosting = new EventPosting(event_number, event_name, event_day, event_time, event_location, event_price, event_age, event_explain);
				eventPostings.add(eventPosting);
			}
			
			request.setAttribute("Event_List", eventPostings);
			request.getRequestDispatcher("Event_List.jsp").forward(request, response);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
