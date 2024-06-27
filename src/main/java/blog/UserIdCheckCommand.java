package blog;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserIdCheckCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		
		UserDAO dao = new UserDAO();
		UserVO vo = dao.getUserMidCheck(mid);
		
		if(vo.getMid() == null) {
			request.setAttribute("res", 1); //사용가능한 아이디
		}
		else {
			request.setAttribute("res", 0);//이미 사용중인 아이디
		}
		request.setAttribute("mid", mid);
	}

}
