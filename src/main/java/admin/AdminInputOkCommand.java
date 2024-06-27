package admin;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.BoardDAO;
import board.BoardVO;

public class AdminInputOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/board/blog");
		int maxSize = 1024 * 1024 * 30;	// 서버에 저장시킬 파일의 최대용량을 30MByte로 제한한다.(1회저장용량)
		String encoding = "UTF-8";
		
		// 파일 업로드 처리....(객체가 생성되면서 바로 파일이 업로드 처리된다.)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
	
	  // 업로드된 파일의 정보를 추출해보자...
		
		Enumeration  fileNames = multipartRequest.getFileNames();
		String file = "";
		String originalFileName = "";
		String filesystemName = "";
		
		while(fileNames.hasMoreElements()) {
			file = (String) fileNames.nextElement();
			
			if(multipartRequest.getFilesystemName(file) != null) {
				originalFileName += multipartRequest.getOriginalFileName(file) + "/";
				filesystemName += multipartRequest.getFilesystemName(file) + "/";
			}
		}
		originalFileName = originalFileName.substring(0, originalFileName.length()-1);
		filesystemName = filesystemName.substring(0, filesystemName.length()-1);
		
//		System.out.println("원본 파일명 : " + originalFileName);
//		System.out.println("서버에 저장된 파일명 : " + filesystemName);
		
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String nick = (String) session.getAttribute("sNick");
		
		// 업로드시킨 파일을 DB에 저장시키기 위해서 전송된 폼의 내용들을 모두 변수에 받아준다.
		String content = multipartRequest.getParameter("content")==null? "" : multipartRequest.getParameter("content");
		String fName = multipartRequest.getParameter("fName")==null? "" : multipartRequest.getParameter("fName");
		String fSName = multipartRequest.getParameter("fSName")==null? "" : multipartRequest.getParameter("fSName");
		
		
		
		// 가공처리된 모든 자료들을 VO에 담아서 DB로 넘겨준다.
		AdminVO vo = new AdminVO();
		vo.setContent(content);
		vo.setfName(originalFileName);
		vo.setfSName(filesystemName);
		
		AdminDAO dao = new AdminDAO();
		int res = dao.setAdminInputOk(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "업로드 완료");
			request.setAttribute("url", "adminQList.ad");
		}
		else {
			request.setAttribute("msg", "업로드 실패");
			request.setAttribute("url", "adminInput.ad");
		}
	}

}

