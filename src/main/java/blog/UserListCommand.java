package blog;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;

public class UserListCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//데이터 베이스에 연결하여 회원의 모든 정보를 리턴
		UserDAO dao = new UserDAO();
		ArrayList<UserVO> vos = dao.getUserList();
		request.setAttribute("vos", vos);
	}

}
