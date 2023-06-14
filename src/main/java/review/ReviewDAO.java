package review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
}
