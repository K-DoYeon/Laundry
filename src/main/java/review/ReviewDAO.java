package review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import board.BoardBean;

public class ReviewDAO {
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
	   
	   //게시들 데베로 저장되는 메소드
	   public void insertReview(ReviewBean bean) {
		   getCon();
		   try {
			String sql = "insert into review values(num, ?, ?, ?, ?, 0, sysdate(), 0, 0)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bean.getUid());
			pstmt.setString(2, bean.getUpass());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getContent());
//			pstmt.setString(5, bean.getImg());
			
			pstmt.executeUpdate();
			
			
			System.out.println("데베연결성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데베연결실패");
		}
	   }
	// 모든 게시글을 리턴해주는 메소드 작성
		public Vector<ReviewBean> getAllBoard() {
			// 리턴할 객체 선언
			Vector<ReviewBean> v = new Vector<>();
			
			getCon();
			
			try {
				// 쿼리 준비
				String sql = "select * from review order by num desc";
				// 쿼리를 실행할 객체 선언
				pstmt = con.prepareStatement(sql);
				// 쿼리 실행 후 결과 저장
				rs = pstmt.executeQuery();
				// 데이터 개수를 모르기에 반복문으로 추출
				while (rs.next()) {
					// 데이터를 패키징
					ReviewBean bean = new ReviewBean();			
					bean.setNum(rs.getInt(1));
					bean.setSubject(rs.getString(4));
					bean.setContent(rs.getString(5));
					bean.setWdate(rs.getString(7));
					// bean.setReadCount(rs.getInt(5));
					// bean.setReplyCount(rs.getInt(6));
					// 패키징 한 데이터를 백터에 저장
					v.add(bean);
				}
				
				con.close();
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return v;
		}
		
		
		public ArrayList<ReviewBean> getReviewList() {
			
			ArrayList<ReviewBean> reviewlist = new ArrayList<ReviewBean>();
			getCon();
			try {
				String sql = "select * from review order by num desc";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					ReviewBean bean = new ReviewBean();			
					bean.setNum(rs.getInt(1));
					bean.setSubject(rs.getString(4));
					bean.setContent(rs.getString(5));
					bean.setWdate(rs.getString(7));
					// bean.setReplyCount(rs.getInt(6));
					
					reviewlist.add(bean);   // list에 해당 인스터스를 넘긴다
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return reviewlist;
		}
		// DB에서 게시글 전체 가져오는데 페이징처리한 메서드 구현 (메서드 오버로딩)
		public ArrayList<ReviewBean> getReviewList(int startRow, int pageSize) {
			
			ArrayList<ReviewBean> reviewlist = new ArrayList<ReviewBean>();
			getCon();
			try {
				String sql = "select * from review order by num desc limit ?,?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow - 1);
				pstmt.setInt(2, pageSize);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					ReviewBean bean = new ReviewBean();			
					bean.setNum(rs.getInt(1));
					bean.setSubject(rs.getString(4));
					bean.setContent(rs.getString(5));
					bean.setWdate(rs.getString(7));
					// bean.setReadCount(rs.getInt(5));
					// bean.setReplyCount(rs.getInt(6));
					
					reviewlist.add(bean);   // list에 해당 인스터스를 넘긴다
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return reviewlist;
		}
		
		public int getReviewCount() {
			getCon();
			int count = 0;
			try {
				String sql = "select count(*) from review";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1);   // 데이터가 없으면 null이고 return 값 0
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return count;
		}
		
		//review info 게시글 리턴 
		   public ReviewBean getOneReview(int num) { 
			   ReviewBean bean = new ReviewBean(); 
			   getCon();
			 
			  try { 
				  String sql = "update review set readcount = readcount + 1 where num=?";
				  pstmt=con.prepareStatement(sql); 
				  pstmt.setInt(1, num); 
				  pstmt.executeUpdate();
				  pstmt.clearParameters(); 
				  
				  String query = "select*from review where num=?";
				  pstmt = con.prepareStatement(query);
				  pstmt.setInt(1, num);
				  rs = pstmt.executeQuery();
			  
				  if(rs.next()) {
					  bean.setNum(rs.getInt(1)); 
					  bean.setUid(rs.getString(2));
					  bean.setUpass(rs.getString(3)); 
					  bean.setSubject(rs.getString(4));
					  bean.setContent(rs.getString(5)); 
					  bean.setImg(rs.getString(6));
					  bean.setWdate(rs.getString(7)); 
					  bean.setReadCount(rs.getInt(8));
					  bean.setReplyCount(rs.getInt(9)); 
					  } 
				  System.out.println("게시글 읽기 연결 성공"); }
			  catch (Exception e) { 
				  e.printStackTrace();
				  System.out.println("게시글 읽기 연결 실패"); 
				  } 
			  return bean; 
			  }
			 
	}
