package answer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.AdminQListCommand;
import blog.MainCommand;
import board.BoardContentCommand;
import board.BoardInputOkCommand;
import board.BoardListCommand;

@WebServlet("*.as")
public class AnswerController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnswerInterface command = null;
		String viewPage = "WEB-INF/answer";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") == null ? 0 : (int) session.getAttribute("sLevel");
		
		
		if(com.equals("/answer")) {
			command = new AnswerCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
			}
		else if(com.equals("/answerList")) {
			command = new AnswerListCommand();
			command.execute(request, response);
			viewPage += "/answerList.jsp";
		}
		else if(com.equals("/answerDelete")) {
			command = new AnswerDeleteCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		 request.getRequestDispatcher(viewPage).forward(request, response);

	}
}
