package blog;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class UserLoginOkCommand implements UserInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");

		UserDAO dao = new UserDAO();
		UserVO vo = dao.getUserMidCheck(mid);
		
		if(vo.getMid()== null || !vo.getMid().equals(mid)) {
			request.setAttribute("msg", "아이디를 확인하세요");
			request.setAttribute("url", "login.do");
			return;
		}
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		if(!vo.getPwd().equals(pwd)) {
			request.setAttribute("msg", "비밀번호를 확인하세요");
			request.setAttribute("url", "login.do");
			return;
		}
		
		// 1.세션처리
		String strLevel = "";
		if(vo.getLevel() == 1) strLevel = "정회원";
		else if(vo.getLevel() == 99) strLevel = "관리자";
		
		HttpSession session = request.getSession();
		session.setAttribute("sMid", mid);
		session.setAttribute("sNick", vo.getNick());
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("strLevel", strLevel);
		
		// 2.쿠키저장
		String idSave = request.getParameter("idSave")==null ? "off" : "on";
		Cookie cookieMid = new Cookie("cMid", mid);
		cookieMid.setPath("/");
		if(idSave.equals("on")) {
			cookieMid.setMaxAge(60*60*24*7);
		}
		else {
			cookieMid.setMaxAge(0);
		}
		response.addCookie(cookieMid);
		
		// 처리 완료후 메세지 출력후 회원 메인창으로 전송한다.
		request.setAttribute("msg", mid+"님 로그인 되었습니다.");
		request.setAttribute("url", "main.do");

	}
}