package blog;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserMainCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		UserDAO userDao = new UserDAO();
		UserVO uVo = userDao.getUserMidCheck(mid);
		
		request.setAttribute("uVo", uVo);
	}

}
