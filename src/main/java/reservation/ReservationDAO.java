package reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import user.UserBean;





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
	
	
	// 회원가입 메소드
		public void insert(ReservationBean bean) {
			getCon();
			try {
				
				String sql = "insert into reservation values (num, ?, ? ,? ,?, ?, ?, ?, ?, 0, sysdate(), ?, ?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getUid());
				pstmt.setString(2, bean.getUname());
				pstmt.setString(3, bean.getTel());
				pstmt.setInt(4, bean.getPostcode());
				pstmt.setString(5, bean.getAddr());
				pstmt.setString(6, bean.getDetailaddr());
				pstmt.setString(7, bean.getComment());
				pstmt.setString(8, bean.getSelectdate());
				pstmt.setInt(9, bean.getDaily());
				pstmt.setInt(10, bean.getBlanket());
				pstmt.setInt(11, bean.getShirt());
				pstmt.setInt(12, bean.getDry());
				pstmt.setInt(13, bean.getCare());
				pstmt.setInt(14, bean.getTotalprice());
				pstmt.executeUpdate();
				System.out.println(pstmt);
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// select
		public Vector<ReservationBean> getSelect(int limitNum, int listNum) {
			Vector<ReservationBean> data = new Vector<>();
			getCon();
			try {
				String sql = "select * from reservation order by num desc limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, limitNum);
				pstmt.setInt(2, listNum);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ReservationBean rbean = new ReservationBean();
					rbean.setNum(rs.getInt("num"));
					rbean.setUid(rs.getString("uid"));
					rbean.setUname(rs.getString("uname"));
					rbean.setTel(rs.getString("tel"));
					rbean.setPostcode(rs.getInt("postcode"));
					rbean.setAddr(rs.getString("addr"));
					rbean.setDetailaddr(rs.getString("detailaddr"));
					rbean.setComment(rs.getString("comment"));
					rbean.setSelectdate(rs.getString("selectdate"));
					rbean.setCount(rs.getInt("count"));
					rbean.setWdate(rs.getString("wdate"));
					rbean.setDaily(rs.getInt("daily"));
					rbean.setBlanket(rs.getInt("blanket"));
					rbean.setShirt(rs.getInt("shirt"));
					rbean.setDry(rs.getInt("dry"));
					rbean.setCare(rs.getInt("care"));
					rbean.setTotalprice(rs.getInt("totalprice"));
					data.add(rbean);
				}
				
				con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return data;
		}
		
		//AllSelect
		public int getAllSelect() {
			int allCount = 0;
			Statement st = null;
			getCon();
			
			try {
				
				String sql = "select count(*) from reservation";
				st = con.createStatement();
				rs = st.executeQuery(sql);
				while (rs.next()) {
					allCount = rs.getInt(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return allCount;
		}
		
		
		
		
		// selectByUser
		public Vector<ReservationBean> getSelectByUser(int limitNum, int listNum, String userId) {
			Vector<ReservationBean> data = new Vector<>();
			getCon();
			try {
				String sql = "SELECT * FROM reservation WHERE uid = ? ORDER BY num DESC LIMIT ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, userId);
				pstmt.setInt(2, limitNum);
				pstmt.setInt(3, listNum);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ReservationBean rbean = new ReservationBean();
					rbean.setNum(rs.getInt("num"));
					rbean.setUid(rs.getString("uid"));
					rbean.setUname(rs.getString("uname"));
					rbean.setTel(rs.getString("tel"));
					rbean.setPostcode(rs.getInt("postcode"));
					rbean.setAddr(rs.getString("addr"));
					rbean.setDetailaddr(rs.getString("detailaddr"));
					rbean.setComment(rs.getString("comment"));
					rbean.setSelectdate(rs.getString("selectdate"));
					rbean.setCount(rs.getInt("count"));
					rbean.setWdate(rs.getString("wdate"));
					rbean.setDaily(rs.getInt("daily"));
					rbean.setBlanket(rs.getInt("blanket"));
					rbean.setShirt(rs.getInt("shirt"));
					rbean.setDry(rs.getInt("dry"));
					rbean.setCare(rs.getInt("care"));
					rbean.setTotalprice(rs.getInt("totalprice"));
					data.add(rbean);
				}
				
				con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return data;
		}

		// getAllSelectByUser
		public int getAllSelectByUser(String userId) {
			int allCount = 0;
			getCon();
			
			try {
				String sql = "SELECT COUNT(*) FROM reservation WHERE uid = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, userId);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					allCount = rs.getInt(1);
				}
				
				con.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return allCount;
		}
		
		public int getSelectCountByUser(String userId) {
		    int count = 0;
		    getCon();
		    
		    try {
		        String sql = "SELECT COUNT(*) FROM reservation WHERE uid = ?";
		        pstmt = con.prepareStatement(sql);
		        pstmt.setString(1, userId);
		        rs = pstmt.executeQuery();
		        
		        if (rs.next()) {
		            count = rs.getInt(1);
		        }
		        
		        con.close();
		        
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    
		    return count;
		}
	
	
}
