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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EventAdd(request, response);
        EventDelete(request, response);
        
        System.out.println(request.getParameter("event_number"));
    }
   
    public void EventAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String event_name = request.getParameter("event_name");
        String event_day = request.getParameter("event_day");
        String event_time = request.getParameter("event_time");
        String event_location = request.getParameter("event_location");
        double event_price = Double.parseDouble(request.getParameter("event_price"));
        int event_age = Integer.parseInt(request.getParameter("event_age"));
        Part event_img = request.getPart("event_img");
        String event_explain = request.getParameter("event_explain");

        // 여기서부터는 기존 코드와 동일

    	EventPostingDAO dao = new EventPostingDAO();
        int result = dao.InsertEvent(event_name, event_day, event_time, event_location, event_price, event_age,
                event_img, event_explain);

        if (result == -1) {
            response.sendRedirect("Event_add_success.jsp");
            System.out.println("add성공");
        } else {
            response.sendRedirect("home.jsp");
        }
    }
    
    public void EventDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("test" + request.getParameter("event_number"));
	
    		int event_number = Integer.parseInt(request.getParameter("event_number"));
    		System.out.println("test" + event_number);
    		EventPostingDAO dao = new EventPostingDAO();
    		int result = dao.delete(event_number);
    		if(result == -1) {
    			response.sendRedirect("Event_delete_success.jsp");
    			
    		} else {
    			System.out.println("delete성공");
    			response.sendRedirect("Event_delete_success.jsp");
    		}
    }
    
}