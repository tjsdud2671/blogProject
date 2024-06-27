package answer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AnswerListCommand implements AnswerInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AnswerDAO dao = new AnswerDAO();
		ArrayList<AnswerVO> vos = dao.getAnswerList();
		
		request.setAttribute("vos", vos);
	}

}
