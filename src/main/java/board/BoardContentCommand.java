package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardContentCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fSName = request.getParameter("fSName") == null ? "" : request.getParameter("fSName");
		
		BoardDAO dao = new BoardDAO();
		BoardVO vo = dao.getBoardContent(fSName);
		request.setAttribute("vo", vo);
		
		ArrayList<BoardReplyVO> vos = dao.getBoardReply(vo.getIdx());


		request.setAttribute("vos",vos );
	}

}
