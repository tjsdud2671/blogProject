package blog;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("sNick");
		session.invalidate();
		request.setAttribute("msg", nick+"님 로그아웃 되었습니다.");
		request.setAttribute("url", "login.do");
	}

}
