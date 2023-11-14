

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
import javax.servlet.http.HttpSession;

import hj.event.ReservationDTO;

/**
 * Servlet implementation class mypageServlet
 */
@WebServlet("/mypageServlet")
public class mypageServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
		String jdbcUsername="kiga";
		String jdbcPassword="kiga1234";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
			String email = request.getParameter("email");
			
			String query = "SELECT name, email, phonenumber FROM users WHERE email = ?";
			String sql = "select r.r_id, r.r_email, r.r_phonenumber, person, e.event_name, e.event_day, e.event_location, (e.event_price*r.person) as total "
					+ "from reservation r, event e "
					+ "where r.event_number=e.event_number AND r_email=?";

			
	        PreparedStatement preparedStatement = connection.prepareStatement(query);
	        PreparedStatement preparedStatement2 = connection.prepareStatement(sql);
	        preparedStatement.setString(1, email);
	        preparedStatement2.setString(1, email);
	        
	        ResultSet resultSet = preparedStatement.executeQuery();
	        ResultSet resultSet2 = preparedStatement2.executeQuery();

	        if (resultSet.next()) {
	            // Retrieve user information
	        	HttpSession session = request.getSession();
				session.setAttribute("email", email);
				session.setAttribute("name", resultSet.getString("name"));
				session.setAttribute("phonenumber", resultSet.getString("phonenumber"));
				
				
	        }
	        ArrayList<ReservationDTO> rdto = new ArrayList<>();
	        
	        while(resultSet2.next()) {
	        	int id = resultSet2.getInt("r_id");
				String r_email = resultSet2.getString("r_email");
				String phonenumber = resultSet2.getString("r_phonenumber");
				int person = resultSet2.getInt("person");				
				String event_name = resultSet2.getString("event_name");
				String event_day = resultSet2.getString("event_day");
				String event_location = resultSet2.getString("event_location");
				String total = resultSet2.getString("total");
				ReservationDTO ReservationDTO = new ReservationDTO(id, r_email, phonenumber, person, event_name, event_day, event_location, total);
				
				rdto.add(ReservationDTO);
	        }
	        
	        request.setAttribute("rdto", rdto);
	        request.getRequestDispatcher("/mypage.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
