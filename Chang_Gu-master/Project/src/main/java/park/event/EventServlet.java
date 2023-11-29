package park.event;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/EventServlet")
@MultipartConfig
public class EventServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String addParam = request.getParameter("add");
		String deleteParam = request.getParameter("delete");
		String updateParam = request.getParameter("update");
		String moveupdate = request.getParameter("moveupdate");

		if (addParam != null && addParam.equals("게시글 작성")) {
			EventAdd(request, response);
		} else if (deleteParam != null && deleteParam.equals("삭제하기")) {
			EventDelete(request, response);
		} else if (updateParam != null && updateParam.equals("수정하기")) {
			EventUpdate(request, response);
		} else if (moveupdate != null && moveupdate.equals("수정하기")) {
			EventInfoValue(request, response);
			System.out.println("move");
		} else {
			return;
		}
	}
	// 디테일 
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String detail = request.getQueryString();
		if (detail != null && detail.contains("event_number")) {
			EventDetal(request, response);
		}
	}

	// 행사 등록 메서드
	public void EventAdd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String event_name = request.getParameter("event_name");
		String event_day = request.getParameter("event_day");
		String event_time = request.getParameter("event_time");
		String event_location = request.getParameter("event_location");
		double event_price = Double.parseDouble(request.getParameter("event_price"));
		int event_age = Integer.parseInt(request.getParameter("event_age"));
		Part event_imgs = request.getPart("event_img");
		String event_explain = request.getParameter("event_explain");

		EventPostingDAO dao = new EventPostingDAO();
		int result = dao.InsertEvent(event_name, event_day, event_time, event_location, event_price, event_age,
				event_imgs, event_explain);

		if (result == -1) {
			response.sendRedirect("Event_add_error.jsp");

		} else {
			response.sendRedirect("Event_add_success.jsp");
		}
	}

	// 행사 삭제 메서드
	public void EventDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int event_number = Integer.parseInt(request.getParameter("event_number"));
		EventPostingDAO dao = new EventPostingDAO();
		int result = dao.delete(event_number);
		if (result == -1) {
			response.sendRedirect("Event_delete_error.jsp");

		} else {
			response.sendRedirect("Event_delete_success.jsp");
		}
	}
	// 행사 정보 수정 메서드
	public void EventUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int event_number = Integer.parseInt(request.getParameter("event_number"));
		String event_name = request.getParameter("event_name");
		String event_location = request.getParameter("event_location");
		String event_day = request.getParameter("event_day");
		String event_time = request.getParameter("event_time");
		double event_price = Double.parseDouble(request.getParameter("event_price"));
		int event_age = Integer.parseInt(request.getParameter("event_age"));
		String event_explain = request.getParameter("event_explain");
		EventPostingDAO dao = new EventPostingDAO();
		int result = dao.updateEvent(event_number, event_name, event_location, event_day, event_time, event_price,
				event_age, event_explain);

		if (result == -1) {

			response.sendRedirect("Event_Update_error.jsp");
		} else {

			response.sendRedirect("Event_Update_success.jsp");
		}
	}
	// 행사 정보 데이터 가져오는 메서드(이미지 X)
	public void EventInfoValue(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		EventPostingDAO dao = new EventPostingDAO();

		int event_number = Integer.parseInt(request.getParameter("event_number"));
		EventPosting dto = dao.getEventInfoNotImage(event_number);

		session.setAttribute("event_number", dto.getEvent_number());
		session.setAttribute("event_name", dto.getEvent_name());
		session.setAttribute("event_day", dto.getEvent_day());
		session.setAttribute("event_time", dto.getEvent_time());
		session.setAttribute("event_location", dto.getEvent_location());
		session.setAttribute("event_price", dto.getEvent_price());
		session.setAttribute("event_age", dto.getEvent_age());
		session.setAttribute("event_explain", dto.getEvent_explain());

		response.sendRedirect("Event_Update.jsp");
	}
	// 행사 자세히보기 메서드(이미지포함)
	public void EventDetal(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		EventPostingDAO dao = new EventPostingDAO();

		int event_number = Integer.parseInt(request.getParameter("event_number"));
		EventPosting dto = dao.getEventInfo(event_number);

		session.setAttribute("event_number", dto.getEvent_number());
		session.setAttribute("event_name", dto.getEvent_name());
		session.setAttribute("event_day", dto.getEvent_day());
		session.setAttribute("event_time", dto.getEvent_time());
		session.setAttribute("event_location", dto.getEvent_location());
		session.setAttribute("event_price", dto.getEvent_price());
		session.setAttribute("event_age", dto.getEvent_age());
		session.setAttribute("event_explain", dto.getEvent_explain());
		session.setAttribute("event_img", dto.getEvent_img());
		response.sendRedirect("Event_Detal.jsp?event_number=" + event_number);
	}
}