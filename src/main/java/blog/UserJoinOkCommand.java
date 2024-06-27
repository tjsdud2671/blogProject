package blog;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class UserJoinOkCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String nick = request.getParameter("nick") == null ? "" : request.getParameter("nick");
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String gender = request.getParameter("gender") == null ? "" : request.getParameter("gender");
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");
		String tel = request.getParameter("tel") == null ? "" : request.getParameter("tel");
		
		UserDAO dao = new UserDAO();
		
		//아이디,닉네임 중복체크
		UserVO vo = dao.getUserMidCheck(mid);
		//System.out.println("vo :"+vo);
		if(vo.getMid() != null) {
			request.setAttribute("msg", "이미 사용중인 아이디 입니다.");
			request.setAttribute("url", "join.do");
			return;
		}
		vo = dao.getUserNickCheck(nick);
		if(vo.getNick() != null) {
			
			request.setAttribute("msg", "이미 사용중인 닉네임 입니다.");
			request.setAttribute("url", "join.do");
			return;
		}
		
		//비밀번호 암호화 처리 (sha256)
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		//체크가 모두 끝난 자료들을 vo에 담아서 DB에 저장시켜준다.
		vo = new UserVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setNick(nick);
		vo.setName(name);
		vo.setGender(gender);
		vo.setEmail(email);
		vo.setTel(tel);
		
		int res = dao.setUserJoinOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "회원가입이 완료되었습니다. \\n로그인 페이지로 이동합니다.");
			request.setAttribute("url", "login.do");
		}
		else {
			request.setAttribute("msg", "회원가입 실패");
			request.setAttribute("url", "join.do");
		}
	}

}
