package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

public class BoardDAO {
	Connection con; // 데이터베이스에 접근하도록 설정
	PreparedStatement pstmt; // 데이터베이스에서 쿼리를 실행시켜주는 객체
	ResultSet rs; // 데이터베이스의 테이블의 결과를 리턴받아 자바에 저장해주는 객체
	
	// 데이터베이스에 접근
	public void getCon() {
		try {
			
			String id = "root";
			String password = "!+La:m6V;t";
			String url = "jdbc:mysql://3.35.8.147/laundry";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, id, password);
			System.out.println("DB 연결 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB 연결 실패");
		}
	}
	
	// 하나의 새로운 게시글이 넘어와서 저장되는 메소드
		public void insertBoard(BoardBean bean) {
			getCon();
			
			try {
				//게시글 전체값을 데이터 테이블에 저장
				String sql = "insert into board"
							+"(uid, upass, level, subject, content, wdate, readcount, replaycount, like)"
							+"values"
							+"(?, ?, ?, ?, ?, sysdate(), 0, 0, 0)";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, bean.getUid());
				pstmt.setString(2, bean.getUpass());
				pstmt.setInt(3, bean.getLevel());
				pstmt.setString(4, bean.getSubject());
				pstmt.setString(5, bean.getContent());
				
				pstmt.executeUpdate();
				
				con.close();
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		// 모든 게시글 리턴
		public Vector<BoardBean> getAllBoard(){
			Vector<BoardBean> v = new Vector<>();
			
			getCon();
			
			try {
				String sql = "select * from board order by num desc";
				pstmt = con.prepareStatement(sql);
				// 쿼리 실행 후 결과 저장
				rs = pstmt.executeQuery();
				// 데이터 개수를 모르기에 반복문으로 추출
				while (rs.next()) {
					// 데이터를 패키징
					BoardBean bean = new BoardBean();			
					bean.setNum(rs.getInt(1));
					bean.setUid(rs.getString(2));
					bean.setUpass(rs.getString(3));
					bean.setLevel(rs.getInt(4));
					bean.setSubject(rs.getString(5));
					bean.setContent(rs.getString(6));
					bean.setWdate(rs.getDate(7).toString());
					bean.setReadcount(rs.getInt(8));
					bean.setReplycount(rs.getInt(9));
					bean.setLike(rs.getInt(10));
					// 패키징 한 데이터를 백터에 저장
					v.add(bean);
				}
				
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return v;
		}
		
		public int getBoardCount() {
			getCon();
			int count = 0;
			try {
				String sql = "select count(*) from board";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1);
					System.out.println("게시판 글 갯수 : " + count);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					con.close();
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
			return count;
		}
		
		public ArrayList<BoardBean> getBoardList(){
			ArrayList<BoardBean> boardlist = new ArrayList<BoardBean>();
			getCon();
			try {
				String sql = "select * from board order by num desc";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					BoardBean bBean = new BoardBean();
					bBean.setNum(rs.getInt(1));
					bBean.setUid(rs.getString(2));
					bBean.setUpass(rs.getString(3));
					bBean.setLevel(rs.getInt(4));
					bBean.setSubject(rs.getString(5));
					bBean.setContent(rs.getString(6));
					bBean.setWdate(rs.getString(7));
					bBean.setReadcount(rs.getInt(8));
					bBean.setReplycount(rs.getInt(9));
					bBean.setLike(rs.getInt(10));
					
					boardlist.add(bBean);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			return boardlist;
		}
		
		//게시글 검색
		public ArrayList<BoardBean> getSearch(String searchField, String searchText){
			getCon();
			ArrayList<BoardBean> list = new ArrayList<BoardBean>();
			String sql = "select * from board where" + searchField.trim();
			try {
				if(searchText != null && !searchText.equals("")) {
					sql += " like '%" + searchText.trim() + "%' order by num desc";
				}
				pstmt = con.prepareStatement(sql);
				System.out.println(pstmt);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					BoardBean bean = new BoardBean();
					bean.setNum(rs.getInt(1));
					bean.setUid(rs.getString(2));
					bean.setUpass(rs.getString(3));
					bean.setLevel(rs.getInt(4));
					bean.setSubject(rs.getString(5));
					bean.setContent(rs.getString(6));
					bean.setWdate(rs.getString(7));
					bean.setReadcount(rs.getInt(8));
					bean.setReplycount(rs.getInt(9));
					bean.setLike(rs.getInt(10));
					list.add(bean);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		
		
		//페이징 처리
		public ArrayList<BoardBean> getBoardList(int startRow, int pageSize){
			ArrayList<BoardBean> boardlist = new ArrayList<BoardBean>();
			getCon();
			try {
				String sql = "select * from board order by num desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow - 1);
				pstmt.setInt(2, pageSize);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					BoardBean bBean = new BoardBean();
					bBean.setNum(rs.getInt(1));
					bBean.setUid(rs.getString(2));
					bBean.setUpass(rs.getString(3));
					bBean.setLevel(rs.getInt(4));
					bBean.setSubject(rs.getString(5));
					bBean.setContent(rs.getString(6));
					bBean.setWdate(rs.getString(7));
					bBean.setReadcount(rs.getInt(8));
					bBean.setReplycount(rs.getInt(9));
					bBean.setLike(rs.getInt(10));
					
					boardlist.add(bBean);
					System.out.print(pstmt);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return boardlist;
		}
	
}
