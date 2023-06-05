package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.xdevapi.Result;

public class UserDAO {
	
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
	
	// 회원가입 메소드
	public void insert(UserBean bean) {
		getCon();
		try {
			
			String sql = "insert into user values (num, ?, ? ,? ,?, ?, ?, ?, ?, ?, ?, ? ,?, ?, ? )";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUid());
			pstmt.setString(2, bean.getUpass());
			pstmt.setString(3, bean.getUpasscheck());
			pstmt.setString(4, bean.getUname());
			pstmt.setString(5, bean.getUemail());
			pstmt.setString(6, bean.getTel());
			pstmt.setInt(7, bean.getPostcode());
			pstmt.setString(8, bean.getAddr());
			pstmt.setString(9, bean.getDetailaddr());
			pstmt.setString(10, bean.getGender());
			pstmt.setInt(11, bean.getBirth());
			pstmt.setInt(12, bean.getLevel());
			pstmt.setInt(13, bean.getVip());
			pstmt.setString(14, bean.getImg());
			
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
