package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardReplyInputCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boardIdx = request.getParameter("boardIdx") == null ? 0 : Integer.parseInt(request.getParameter("boardIdx"));
		String mid = request.getParameter("mid")== null ? "" : request.getParameter("mid");
		String nick = request.getParameter("nick")== null ? "" : request.getParameter("nick");
		String wDate = request.getParameter("wDate")== null ? "" : request.getParameter("wDate");
		String content = request.getParameter("content")== null ? "" : request.getParameter("content");
	
		BoardReplyVO replyVO = new BoardReplyVO();
		replyVO.setBoardIdx(boardIdx);
		replyVO.setMid(mid);
		replyVO.setNick(nick);
		replyVO.setwDate(wDate);
		replyVO.setwDate(wDate);
		replyVO.setContent(content);
		
		BoardDAO dao = new BoardDAO();
		int res = dao.setReplyInputOk(replyVO);

		
		response.getWriter().write("1");
	}

}
