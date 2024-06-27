package blog;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;
import admin.AdminVO;
import answer.AnswerDAO;
import answer.AnswerVO;
import board.BoardDAO;
import board.BoardVO;
import neighbor.NeighborDAO;
import neighbor.NeighborVO;

public class MainCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> vos = dao.getBoardList();
		request.setAttribute("vos", vos);
		
		AdminDAO aDao = new AdminDAO();
		ArrayList<AdminVO> aVos = aDao.getAdminListt();
		request.setAttribute("aVos", aVos);
		
		AnswerDAO asDao = new AnswerDAO();
		ArrayList<AnswerVO> asVos = asDao.getAnswerList();
		request.setAttribute("asVos", asVos);
		
		NeighborDAO nDao = new NeighborDAO();
		ArrayList<NeighborVO> nVos = nDao.getNeighborList();
		request.setAttribute("nVos", nVos);
		
	}

}
