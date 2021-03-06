package kr.ac.kopo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MethodServlet extends HttpServlet {

	//http://localhost:9999/Lecture-Web/method?id=hong 
	//클라이언트가 아이디 입력한걸 서버에다가 보내고 있음.
	//서버 입장에서는 사용자가 넘겨준 id를 추출해야 함.
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String method =request.getMethod();
		String uri = request.getRequestURI();
		StringBuffer url = request.getRequestURL();
		String id = request.getParameter("id");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("   <head>");
		out.println("       <title>메소드 요청방식</title>");
		out.println("    </head>");
		out.println("    <body>");
		out.println("    =========================================<br>");
		out.println("     &nbsp; &nbsp; &nbsp; &nbsp; 출력결과<br> ");
		out.println("    =========================================<br>");
		out.println("    파라미터(id) :" + id + "<br>");
		out.println("  	요청방식 :  " +method+ "<br>");
		out.println("  	uri :  " + uri+ "<br>");
		out.println("    =========================================<br>");
		out.println("     </body>");
		out.println("</html>");
		/*
		 * System.out.println("요청 Method : " + method); System.out.println("요청 URI : " +
		 * uri); System.out.println("요청 URL : " +url.toString());
		 * System.out.println("id : " + id);
		 */
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String method =request.getMethod();
		String uri = request.getRequestURI();
		StringBuffer url = request.getRequestURL();
		String id = request.getParameter("id");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("   <head>");
		out.println("       <title>메소드 요청방식</title>");
		out.println("    </head>");
		out.println("    <body>");
		out.println("    =========================================<br>");
		out.println("     &nbsp; &nbsp; &nbsp; &nbsp; 출력결과<br> ");
		out.println("    =========================================<br>");
		out.println("    파라미터(id) :" + id + "<br>");
		out.println("  	요청방식 :  " +method+ "<br>");
		out.println("  	uri :  " + uri+ "<br>");
		out.println("    =========================================<br>");
		out.println("     </body>");
		out.println("</html>");
		/*
		 * System.out.println("요청 Method : " + method); System.out.println("요청 URI : " +
		 * uri); System.out.println("요청 URL : " +url.toString());
		 * System.out.println("id : " + id);
		 */
	}
	}	
	
	

