package neighbor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import answer.AnswerCommand;
import answer.AnswerListCommand;
import board.BoardContentCommand;
import board.BoardInputOkCommand;
import board.BoardListCommand;

@WebServlet("*.ne")
public class NeighborController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NeighborInterface command = null;
		String viewPage = "WEB-INF/neighbor";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") == null ? 0 : (int) session.getAttribute("sLevel");
		
		if(com.equals("/neighborAdd")) {
			command = new NeighborAddCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
			}
		else if(com.equals("/neighborList")) {
			command = new NeighborListCommand();
			command.execute(request, response);
			return;
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);

	}
}
