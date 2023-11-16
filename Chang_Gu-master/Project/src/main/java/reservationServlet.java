

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
 * Servlet implementation class reservationServlet
 */
@WebServlet("/reservationServlet")
public class reservationServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// jdbc 불러오기
		String jdbcURL="jdbc:oracle:thin:@localhost:1521:xe";
		String jdbcUserName="kiga";
		String jdbcPassword="kiga1234";
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Connection connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
			String r_email = request.getParameter("r_email");
			String r_phonenumber = request.getParameter("r_phonenumber");
			int person = Integer.parseInt(request.getParameter("person"));
			int event_number = Integer.parseInt(request.getParameter("event_number"));
			
			//예약 insert
			String sql = "insert into reservation (r_email, r_phonenumber, person, event_number)"
					+"values(?,?,?,?)";
			PreparedStatement preparedStatment = connection.prepareStatement(sql);
			preparedStatment.setString(1, r_email);
			preparedStatment.setString(2, r_phonenumber);
			preparedStatment.setInt(3, person);
			preparedStatment.setInt(4, event_number);
			
			preparedStatment.executeUpdate();
			
			request.getSession().setAttribute("r_email", r_email);
			request.getSession().setAttribute("r_phonenumber", r_phonenumber);
			request.getSession().setAttribute("person", person);
			request.getSession().setAttribute("event_number", event_number);
			
			String sql2 = "select r_id from reservation where rownum =1 order by r_id desc";
			PreparedStatement preparedStatment2 = connection.prepareStatement(sql2);
			ResultSet resultSet = preparedStatment2.executeQuery();
			
			if(resultSet.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("r_id", resultSet.getInt("r_id"));
			}
			
			
			response.sendRedirect("reservation_success.jsp");
		} catch (SQLException e) {
			//실패할 경우 이동할 페이지 설정
			response.sendRedirect("reservation_error.jsp");
			e.printStackTrace();
		}
		
	}

}
