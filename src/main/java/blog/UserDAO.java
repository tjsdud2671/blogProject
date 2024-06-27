package blog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import answer.AnswerVO;
import common.GetConn;

public class UserDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	AnswerVO vo = null;
	
	// pstmt 객체 반납
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	// rs 객체 반납
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {}
			finally {
				pstmtClose();
			}
		}
	}

	//아이디 중복체크
	public UserVO getUserMidCheck(String mid) {
		UserVO vo = new UserVO();
		try {
			sql = "select * from user where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNick(rs.getString("nick"));
				vo.setGender(rs.getString("gender"));
				vo.setEmail(rs.getString("email"));
				vo.setTel(rs.getString("tel"));
				vo.setLevel(rs.getInt("level"));
				vo.setUserDel(rs.getString("userDel"));
				
			}
		} catch (Exception e) {
			System.out.println("sql오류"+e.getMessage());
		}finally {
			rsClose();
		}
		return vo;
	}
	//닉네임 중복체크
	public UserVO getUserNickCheck(String nick) {
		UserVO vo = new UserVO();
		try {
			sql = "select * from user where nick = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nick);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setNick(rs.getString("nick"));
				vo.setName(rs.getString("name"));
				vo.setGender(rs.getString("gender"));
				vo.setEmail(rs.getString("email"));
				vo.setTel(rs.getString("tel"));
				vo.setLevel(rs.getInt("level"));
				vo.setUserDel(rs.getString("userDel"));
				
			}
		} catch (Exception e) {
			System.out.println("sql오류"+e.getMessage());
		}finally {
			rsClose();
		}
		return vo;
	}
	//회원가입 처리
	public int setUserJoinOk(UserVO vo) {
		int res = 0;
		try {
			sql = "insert into user values (default,?,?,?,?,?,?,?,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getNick());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getEmail());
			pstmt.setString(7, vo.getTel());
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("sql오류"+e.getMessage());
		}finally {
			pstmtClose();
		}
		return res;
	}
	// 이메일로 아이디 검색하기
	public ArrayList<String> getEmailSearch(String email) {
		ArrayList<String> vos = new ArrayList<String>();
		
		try {
			sql = "select mid from user where email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vos.add(rs.getString("mid"));
			}
		} catch (SQLException e) {
			System.out.println("sql구문 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	//아이디와 메일주소로 검색처리
	public int getUserMidEmailSearch(String mid, String email) {
		int res = 0;
		try {
			sql = "select idx from user where mid = ? and email = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			
			if(rs.next()) res = 1;
		} catch (SQLException e) {
			System.out.println("sql구문 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}
	// 새로 발급 받은 비밀번호를 기존 user 테이블에 업데이트
	public void setUserPwdUpdate(String mid, String pwdUid) {
		try {
			sql = "update user set pwd = ? where mid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pwdUid);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql구문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();		
	}
}


	public ArrayList<UserVO> getUserList() {
		ArrayList<UserVO> vos = new ArrayList<UserVO>();
		try {
			sql="select * from user order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UserVO vo = new UserVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNick(rs.getString("nick"));
				vo.setGender(rs.getString("gender"));
				vo.setEmail(rs.getString("email"));
				vo.setTel(rs.getString("tel"));
				vo.setLevel(rs.getInt("level"));
				vo.setUserDel(rs.getString("userDel"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql오류 : "+e.getMessage());
		}finally {
			rsClose();
		}
		return vos;
	}


}
