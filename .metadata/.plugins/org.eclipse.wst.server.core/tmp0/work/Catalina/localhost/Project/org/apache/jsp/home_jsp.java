/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.82
 * Generated at: 2023-11-14 10:14:56 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.util.List;
import park.event.EventPosting;
import park.event.EventPostingDAO;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.List");
    _jspx_imports_classes.add("park.event.EventPosting");
    _jspx_imports_classes.add("park.event.EventPostingDAO");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"UTF-8\">\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("<title>홈페이지</title>\n");
      out.write("<link rel=\"stylesheet\" href=\"./hjCss/main.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"./hjCss/reservationCss.css\">\n");
      out.write("					");

					int pageNumber = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
					int pageSize = 1;
					//int pageNumber = Integer.parseInt(request.getParameter("page"));

					EventPostingDAO eventPaginationDAO = new EventPostingDAO();
					List<EventPosting> eventPagination = eventPaginationDAO.getAllProducts(pageNumber, pageSize);
					int totalEventList = eventPaginationDAO.getTotalProducts(); //전체 제품 가져오기
					int totalPages = (int) Math.ceil((double) totalEventList / pageSize);
					int count = 5;
					
      out.write("\n");
      out.write("<script>\n");
      out.write("	function loginFail() {\n");
      out.write("		alert(\"로그인에 실패하였습니다.\");\n");
      out.write("		window.location.href = \"login.jsp\";\n");
      out.write("	}\n");
      out.write("	\n");
      out.write("</script>\n");
      out.write("<script>\n");
      out.write("  var count = ");
      out.print( pageNumber );
      out.write("; // 페이지 이동 시 서버에서 계산된 페이지 번호를 초기값으로 설정\n");
      out.write("\n");
      out.write("  function pageBefore() {\n");
      out.write("    if (count <= 1) {\n");
      out.write("      location.href = \"");
      out.print(request.getRequestURI());
      out.write("?page=");
      out.print(totalPages);
      out.write("\";\n");
      out.write("    } else {\n");
      out.write("      --count;\n");
      out.write("      location.href = \"");
      out.print(request.getRequestURI());
      out.write("?page=\" + count;\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  function pageNext() {\n");
      out.write("    var pageSize = 1;\n");
      out.write("    var totalEventList = ");
      out.print( totalEventList );
      out.write("; // 전체 이벤트 갯수\n");
      out.write("    var totalPages = ");
      out.print( totalPages );
      out.write("; // 전체 페이지 갯수\n");
      out.write("    if (count >= totalPages) {\n");
      out.write("      location.href = \"");
      out.print(request.getRequestURI());
      out.write("?page=1\";\n");
      out.write("    } else {\n");
      out.write("      ++count;\n");
      out.write("      location.href = \"");
      out.print(request.getRequestURI());
      out.write("?page=\" + count;\n");
      out.write("    }\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  // 자동으로 다음 페이지로 이동하는 함수\n");
      out.write("  function autoNext() {\n");
      out.write("    pageNext();\n");
      out.write("  }\n");
      out.write("\n");
      out.write("  // 일정한 시간 간격으로 autoNext 함수 호출 (예: 3000ms = 3초)\n");
      out.write("  setInterval(autoNext, 3000);\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("	<div id=\"wrapper\">\n");
      out.write("		<!--로고이미지-->\n");
      out.write("		<img src=\"./image/로고1.png\" id=\"logo\">\n");
      out.write("\n");
      out.write("		<!--로그인 버튼-->\n");
      out.write("		<div style=\"text-align: right; width: 1215px;\">\n");
      out.write("			");

			if (session.getAttribute("email") != null) {
			
      out.write("\n");
      out.write("			<button type=\"button\" onclick=\"location.href='logout.jsp'\"\n");
      out.write("				style=\"width: 75px;\">로그아웃</button>\n");
      out.write("			<h>|</h>\n");
      out.write("			<button type=\"button\"\n");
      out.write("				onclick=\"location.href='mypageServlet?email=");
      out.print(session.getAttribute("email"));
      out.write("'\"\n");
      out.write("				style=\"width: 100px;\">마이페이지</button>\n");
      out.write("\n");
      out.write("			");

			} else {
			
      out.write("\n");
      out.write("			<button type=\"button\" onclick=\"location.href='login.jsp'\"\n");
      out.write("				style=\"width: 60px;\">로그인</button>\n");
      out.write("			<h>|</h>\n");
      out.write("			<button type=\"button\" onclick=\"location.href='register.jsp'\"\n");
      out.write("				style=\"width: 100px;\">회원가입</button>\n");
      out.write("			");

			}
			
      out.write("\n");
      out.write("\n");
      out.write("		</div>\n");
      out.write("\n");
      out.write("		<!-- 메뉴바 -->\n");
      out.write("		<div id=\"buttons\">\n");
      out.write("			<ul>\n");
      out.write("				<li onclick=\"location.href='review_list.jsp'\">후기</li>\n");
      out.write("				<li onclick=\"location.href='Qna_List.jsp'\">QNA</li>\n");
      out.write("				<li onclick=\"location.href='reservation_search.jsp'\">예약조회</li>\n");
      out.write("				<li onclick=\"location.href='Event_List.jsp'\">행사정보</li>\n");
      out.write("			</ul>\n");
      out.write("		</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("		<!-- 가운데 가장 큰 박스 -->\n");
      out.write("		<div id=\"background\">\n");
      out.write("\n");
      out.write("			<h2 style=\"padding-top: 15px\">행사 정보</h2>\n");
      out.write("			<!-- 안에 글넣는 하얀 박스-->\n");
      out.write("			<div id=\"reviewbox\">\n");
      out.write("\n");
      out.write("				<table border=\"1\">\n");
      out.write("\n");
      out.write("\n");
      out.write("					");

					for (EventPosting p : eventPagination) {
					
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("					<div class=\"pagination\">\n");
      out.write("						<div class=\"imagecenter\">\n");
      out.write("							<a href=\"Event_Detal.jsp?event_number=");
      out.print(p.getEvent_number());
      out.write("\">\n");
      out.write("								<img src=\"");
      out.print(p.getEvent_img());
      out.write("\" class=\"pagination-img\">\n");
      out.write("							</a>\n");
      out.write("						</div>\n");
      out.write("					</div>\n");
      out.write("					");

					}
					
      out.write("\n");
      out.write("				\n");
      out.write("			</div>\n");
      out.write("		</div>\n");
      out.write("		<br>\n");
      out.write("		\n");
      out.write("\n");
      out.write("		<button id=\"pagination-before\" name=\"pagination-before\"\n");
      out.write("			onclick=\"pageBefore()\">이전</button>\n");
      out.write("		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
      out.write("		<button id=\"pagination-next\" name=\"pagination-next\"\n");
      out.write("			onclick=\"pageNext()\">다음</button>\n");
      out.write("		</table>\n");
      out.write("	</div>\n");
      out.write("	");

	String loginError = (String) request.getAttribute("loginError");
	if (loginError != null) {
	
      out.write("\n");
      out.write("	<script>\n");
      out.write("		loginFail();\n");
      out.write("	</script>\n");
      out.write("	");

	}
	
      out.write("\n");
      out.write("	<script>\n");
      out.write("\n");
      out.write("	</script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}