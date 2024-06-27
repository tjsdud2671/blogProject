package answer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AnswerCommand implements AnswerInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("sNick");
		String content = request.getParameter("content") == null ? "" : request.getParameter("content");
	
		AnswerVO vo = new AnswerVO();
		vo.setNick(nick);
		vo.setContent(content);
		
		AnswerDAO dao = new AnswerDAO();
		int res = dao.setAnswerOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "블로그씨에게 전송 완료");
			request.setAttribute("url", "http://localhost:8080/javaProjectJ12/");
		}
		else {
			request.setAttribute("msg", "전송 실패");
			request.setAttribute("url", "http://localhost:8080/javaProjectJ12/");
		}
	}

}
