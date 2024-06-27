package blog;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.do")
public class UserController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserInterface command = null;
		String viewPage = "/WEB-INF/blog";
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel") == null ? 0 : (int)session.getAttribute("sLevel");
		
		System.out.println("com : "+com);
		
		if(com.equals("/main")) {
			command = new MainCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/main/main.jsp";
		}
		else if(com.equals("/join")) {
			viewPage += "/join.jsp";
		}
		else if(com.equals("/login")) {
			viewPage += "/login.jsp";
		}


		else if(com.equals("/logout")) {
			command = new LogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/userIdCheck")) {
			command = new UserIdCheckCommand();
			command.execute(request, response);
			viewPage += "/userIdCheck.jsp";
		}
		else if(com.equals("/userNickCheck")) {
			command = new UserNickCheckCommand();
			command.execute(request, response);
			viewPage += "/userNickCheck.jsp";
		}
		else if(com.equals("/userJoinOk")) {
			command = new UserJoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/userLoginOk")) {
			command = new UserLoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/userList")) {
			command = new UserListCommand();
			command.execute(request, response);
			viewPage += "/userList.jsp";
		}
		else if(com.equals("/userEmailSearch")) {
			command = new UserEmailSearchCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/userPasswordSearch")) {
			command = new UserPasswordSearchCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/userMain")) {
			command = new UserMainCommand();
			command.execute(request, response);
			viewPage += "/userMain.jsp";
		}
		else if(com.equals("/adminUserList")) {
			viewPage += "/adminUserList.jsp";
		}
		


		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
