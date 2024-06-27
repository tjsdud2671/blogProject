package neighbor;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NeighborAddCommand implements NeighborInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String myNick = (String) session.getAttribute("sNick");
		String friendNick = request.getParameter("nick") == null ? "" : request.getParameter("nick");
		
		NeighborVO vo = new NeighborVO();
		vo.setMyNick(myNick);
		vo.setFriendNick(friendNick);
		
		NeighborDAO dao = new NeighborDAO();
		int res = dao.setNeighborOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "이웃추가 되었습니다.");
			request.setAttribute("url", "http://localhost:8080/javaProjectJ12/");
		}
		else {
			request.setAttribute("msg", "이웃추가 실패하였습니다.");
			request.setAttribute("url", "http://localhost:8080/javaProjectJ12/");
		}
		
	}

}
