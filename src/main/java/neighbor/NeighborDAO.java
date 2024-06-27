package neighbor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class NeighborDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	NeighborVO vo = null;
	
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

	public int setNeighborOk(NeighborVO vo) {
		int res = 0;
		try {
			sql="insert into neighbor values (?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMyNick());
			pstmt.setString(2, vo.getFriendNick());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql오류:"+e.getMessage());
		}finally {
			pstmtClose();
		}
		return res;
	}

	public ArrayList<NeighborVO> getNeighborList() {
		ArrayList<NeighborVO> vos = new ArrayList<NeighborVO>();
		try {
			sql = "select * from neighbor order by friendNick desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NeighborVO vo = new NeighborVO();
				vo.setMyNick(rs.getString("myNick"));
				vo.setFriendNick(rs.getString("friendNick"));
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
