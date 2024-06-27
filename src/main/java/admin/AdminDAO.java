package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class AdminDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	AdminVO vo = null;
	
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
	// 게시글 저장
	public int setAdminInputOk(AdminVO vo) {
		int res = 0;
		try {
			sql = "insert into admin values (default,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getfName());
			pstmt.setString(2, vo.getfSName());
			pstmt.setString(3, vo.getContent());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql오류 " + e.getMessage());
		}finally {
			pstmtClose();
		}
		return res;
	}

	public ArrayList<AdminVO> getAdminList() {
		ArrayList<AdminVO> vos = new ArrayList<AdminVO>();
		try {
			sql="select * from admin order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				AdminVO vo = new AdminVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setContent(rs.getString("content"));
				vos.add(vo);
				
			}
		} catch (SQLException e) {
			System.out.println("sql오류 " + e.getMessage());
		}finally {
			rsClose();
		}
		return vos;
	}
	
	public ArrayList<AdminVO> getAdminListt() {
		ArrayList<AdminVO> aVos = new ArrayList<AdminVO>();
		try {
			sql="select * from admin order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				AdminVO vo = new AdminVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setContent(rs.getString("content"));
				aVos.add(vo);
				
			}
		} catch (SQLException e) {
			System.out.println("sql오류 " + e.getMessage());
		}finally {
			rsClose();
		}
		return aVos;
	}

}
