package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class BoardDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	BoardVO vo = null;
	
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
	// 게시글 저장하기
	public int setBoardInputOk(BoardVO vo) {
		int res = 0;
		try {
			sql = "insert into board values (default,?,?,?,?,?,?,default,?,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNick());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getContent());
			pstmt.setString(5, vo.getfName());
			pstmt.setString(6, vo.getfSName());
			pstmt.setString(7, vo.getOpenSW());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql오류 : "+e.getMessage());
		}finally {
			pstmtClose();
		}
		return res;
	}

	public ArrayList<BoardVO> getBoardList() {
		ArrayList<BoardVO> vos = new ArrayList<BoardVO>();
		try {
			sql = "select * from board order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNick(rs.getString("nick"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setOpenSW(rs.getString("openSW"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql오류 : "+e.getMessage());
		}finally {
			rsClose();
		}
		return vos;
	}

	public ArrayList<BoardVO> getBoardList(String mid) {
		ArrayList<BoardVO> vos = new ArrayList<BoardVO>();
		try {
			sql="select * from board where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNick(rs.getString("nick"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setOpenSW(rs.getString("openSW"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql오류 : "+e.getMessage());
		}finally {
			rsClose();
		}
		return vos;
	}
	public ArrayList<BoardVO> getBoardNeighborList(String nick) {
		ArrayList<BoardVO> vos = new ArrayList<BoardVO>();
		try {
			sql="select * from board where nick=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nick);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNick(rs.getString("nick"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setOpenSW(rs.getString("openSW"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql오류 : "+e.getMessage());
		}finally {
			rsClose();
		}
		return vos;
	}

	// 게시글 상세내역 보기
	public BoardVO getBoardContent(String fSName) {
		BoardVO vo = new BoardVO();
		try {
			sql = "select * from board where fSName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fSName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNick(rs.getString("nick"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setOpenSW(rs.getString("openSW"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
			}
		} catch (SQLException e) {
			System.out.println("sql오류 : "+e.getMessage());
		}finally {
			rsClose();
		}
		
		return vo;
	}
	// 게시물 삭제
	public int setBoardDelete(int idx) {
		int res = 0;
		
		try {
			sql="delete from board where idx=?";
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


	public BoardVO getBoardUpdate(int idx) {
		BoardVO vo = new BoardVO();
		try {
			sql = "select * from board where fSName = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNick(rs.getString("nick"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setOpenSW(rs.getString("openSW"));
				vo.setwDate(rs.getString("wDate"));
				vo.setGood(rs.getInt("good"));
			}
		} catch (SQLException e) {
			System.out.println("sql오류 : "+e.getMessage());
		}finally {
			rsClose();
		}
		
		return vo;
	}
	//게시글 수정
	public int setBoardUpdateOk(BoardVO vo) {
		int res =0;
		try {
			sql="update board set title=?, content=?, fName=?, fSName=?, openSW=? where idx=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setString(3, vo.getfName());
			pstmt.setString(4, vo.getfSName());
			pstmt.setString(5, vo.getOpenSW());
			pstmt.setInt(6, vo.getIdx());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql오류 : "+e.getMessage());
		}finally {
			pstmtClose();
		}
		return res;
	}
	// 댓글 저장
	public int setReplyInputOk(BoardReplyVO replyVO) {
		int res = 0;
		try {
			sql="insert into boardReply values (default,?,?,?,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyVO.getBoardIdx());
			pstmt.setString(2, replyVO.getMid());
			pstmt.setString(3, replyVO.getNick());
			pstmt.setString(4, replyVO.getContent());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			System.out.println("SQL구문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}
	// 댓글 읽어오기(원본글 idx에 해당하는 댓글을 읽어온다.)
	public ArrayList<BoardReplyVO> getBoardReply(int idx) {
		ArrayList<BoardReplyVO> replyVos = new ArrayList<BoardReplyVO>();
		try {
			sql = "select * from boardReply where boardIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardReplyVO replyVo = new BoardReplyVO();
				replyVo.setIdx(rs.getInt("idx"));
				replyVo.setBoardIdx(rs.getInt("boardIdx"));
				replyVo.setMid(rs.getString("mid"));
				replyVo.setNick(rs.getString("nick"));
				replyVo.setwDate(rs.getString("wDate"));
				replyVo.setContent(rs.getString("content"));
				
				replyVos.add(replyVo);
			}
		} catch (SQLException e) {
			System.out.println("SQL구문 오류 : " + e.getMessage());
		} finally {
			rsClose();
		}
		return replyVos;
}

	// 댓글 삭제처리
	public int setBoardReplyDeleteOk(int idx) {
			int res = 0;
			try {
				sql = "delete from boardReply where idx = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				res = pstmt.executeUpdate();
			} catch (SQLException e) {
				System.out.println("SQL구문 오류 : " + e.getMessage());
			} finally {
				pstmtClose();
			}
			return res;
	}

	public void setBoardGoodCheck(int idx) {
		try {
			sql = "update board set good = good + 1 where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL구문 오류 : " + e.getMessage());
		} finally {
			pstmtClose();
		}
	}
}