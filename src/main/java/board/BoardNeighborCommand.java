package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardNeighborCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nick = request.getParameter("friendNick")== null ? "":request.getParameter("friendNick");
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> vos = dao.getBoardNeighborList(nick);
		request.setAttribute("vos", vos);
		
	}

}
