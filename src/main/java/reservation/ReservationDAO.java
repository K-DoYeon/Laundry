package reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;





public class ReservationDAO {
	
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
	
	
	public void mainInsert(String uid, ReservationBean rbean) {
		getCon();
		try {
			
			String sql = "insert into reservation (num, uid, uname, tel) values ( num, ?, ? ,? )";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, rbean.getUname());
			pstmt.setString(3, rbean.getTel());
			pstmt.executeUpdate();
			
			System.out.println(pstmt);
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public int mainInsertOk(String uid, String uname) {
		try {
			getCon();
			String sql = "select * from user where uid = ? and uname = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uid);
			pstmt.setString(2, uname);
			rs = pstmt.executeQuery(); 
			
			if (rs.next())
				return 1; 
			else {
				return 0; 
			}
								
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return -2; //DB 오류 
	}
	
	public String rName(String uid) {
		String rname = null;
		try {
			getCon();
			String sql = "select uname from user where uid = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery(); 
			System.out.println(pstmt);
			if(rs.next()) {
				rname = rs.getString("rname");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rname;
	}
	
	public String rTel(String uid) {
		String tel = null;
		try {
			getCon();
			String sql = "select tel from user where uid = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery(); 
			System.out.println(pstmt);
			if(rs.next()) {
				tel = rs.getString("tel");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return tel;
	}
}
