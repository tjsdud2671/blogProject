package answer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AnswerDeleteCommand implements AnswerInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		AnswerDAO dao = new AnswerDAO();
		int res = dao.setAnswerDelete(idx);
		
		if(res != 0) {
			request.setAttribute("msg", "삭제되었습니다.");
			request.setAttribute("url", "answerList.as");
		}
		else {
			request.setAttribute("msg", "삭제실패");
			request.setAttribute("url", "answerList.as");
		}
	}

}
