package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;



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
			
			String addr = bean.getAddr();
			int level = calculateLevel(addr);
			pstmt.setInt(12, level);
			
			pstmt.setInt(13, bean.getVip());
			pstmt.setString(14, bean.getImg());
			
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private int calculateLevel(String address) {
		int level = 0;
		
		if (address.contains("서울")) {
			level = 1;
		} else {
			level = 2;
		}
		return level;
	}
	
	// select
	public Vector<UserBean> getSelect(int limitNum, int listNum) {
		Vector<UserBean> data = new Vector<>();
		getCon();
		try {
			String sql = "select * from user order by num desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, limitNum);
			pstmt.setInt(2, listNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UserBean ubean = new UserBean();
				ubean.setNum(rs.getInt("num"));
				ubean.setUid(rs.getString("uid"));
				ubean.setUpass(rs.getString("upass"));
				ubean.setUpasscheck(rs.getString("upasscheck"));
				ubean.setUname(rs.getString("uname"));
				ubean.setUemail(rs.getString("uemail"));
				ubean.setTel(rs.getString("tel"));
				ubean.setPostcode(rs.getInt("postcode"));
				ubean.setAddr(rs.getString("addr"));
				ubean.setDetailaddr(rs.getString("detailaddr"));
				ubean.setGender(rs.getString("gender"));
				ubean.setBirth(rs.getInt("birth"));
				ubean.setLevel(rs.getInt("level"));
				ubean.setVip(rs.getInt("vip"));
				ubean.setImg(rs.getString("img"));
				data.add(ubean);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	// AllSelect
	public int getAllSelect() {
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		String sql = null;
		int allCount = 0;
		sql = "select count(*) from user";
		
		try {
			getCon();
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				allCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return allCount;
		
	}
	
	
	//아이디 중복확인
	public int duplicate(String uid) {
		int count = 0;
		
		try {
			getCon();
			String sql = "select count(uid) as count from user where uid=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				count = rs.getInt("count");
			}
		}catch(Exception e) {
			System.out.println("아이디 중복확인 실패 : " + e);
		}
		
		return count;
	}
	
	
	//아이디 찾기
	public String idFind(String uname, String tel) {
		String uid = null;
		
		try {
			getCon();
			String sql = "select uid from user where uname=? and tel=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uname);
			pstmt.setString(2, tel);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				uid = rs.getString("uid");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return uid;
	}
	
	
	//비밀번호 찾기
		public String pwFind(String uid, String tel) {
			String upass = null;
			
			try {
				getCon();
				String sql = "select upass from user where uid=? and tel=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.setString(2, tel);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					upass = rs.getString("upass");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return upass;
		}
	
	
		
		public int login(String uid, String upass) {
			try {
				getCon();
				String sql = "select * from user where uid = ? and upass = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.setString(2, upass);
				rs = pstmt.executeQuery(); 
				
				if (rs.next())
					return 1; //로그인 성공
				else {
					return 0; //로그인 실패
				}
									
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			return -2; //DB 오류 
		}
	
	
		public String userImg(String uid, String upass) {
			String img = null;
			try {
				getCon();
				String sql = "select img from user where uid = ? and upass = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.setString(2, upass);
				rs = pstmt.executeQuery(); 
				System.out.println(pstmt);
				if(rs.next()) {
					img = rs.getString("img");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return img;
		}
	
}//userDAO