package answer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class AnswerDAO {
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

	public int setAnswerOk(AnswerVO vo) {
		int res = 0;
		try {
			sql="insert into answer values (default,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getContent());
			pstmt.setString(2, vo.getNick());
			res=pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql오류:"+e.getMessage());
		}finally {
			pstmtClose();
		}
		return res;
	}

	public ArrayList<AnswerVO> getAnswerList() {
		ArrayList<AnswerVO> vos = new ArrayList<AnswerVO>();
		try {
			sql="select * from answer order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AnswerVO vo = new AnswerVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setContent(rs.getString("content"));
				vo.setNick(rs.getString("nick"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql오류 " + e.getMessage());
		}finally {
			rsClose();
		}
		return vos;
	}

	public int setAnswerDelete(int idx) {
		int res = 0;
		try {
			sql="delete from answer where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql오류 : "+e.getMessage());
		}finally {
			pstmtClose();
		}
		return res;
	}


}
