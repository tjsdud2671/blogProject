package blog;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserNickCheckCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nick = request.getParameter("nick") == null ? "" : request.getParameter("nick");
		
		UserDAO dao = new UserDAO();
		UserVO vo = dao.getUserNickCheck(nick);
		
		if(vo.getNick() == null) {
			request.setAttribute("res", 1); //사용가능한 닉네임
		}
		else {
			request.setAttribute("res", 0);//이미 사용중인 닉네임
		}
		request.setAttribute("nick", nick);

	}

}
