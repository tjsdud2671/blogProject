package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardUpdateCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		HttpSession session = request.getSession();
		String nick = session.getAttribute("sNick") == null ? "" : (String)session.getAttribute("sNick");
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String fSName = request.getParameter("fSName")==null ? "" : request.getParameter("fSName");
		String openSw = request.getParameter("openSw")==null ? "" : request.getParameter("openSw");
		
		BoardVO vo = new BoardVO();
		vo.setIdx(idx);
		vo.setNick(nick);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setfSName(fSName);
		vo.setOpenSW(openSw);
		
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoardUpdateOk(vo);
		
		if(res != 0) {
			request.setAttribute("msg", "게시글이 수정되었습니다.");
		}
		else {
			request.setAttribute("msg", "게시글 수정 실패");
		}
		request.setAttribute("url", "boardContent.bo?idx="+idx);
	}


}
