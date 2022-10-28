package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class MemberDAO {

	private MemberDAO() throws Exception{
		// 1. 드라이버 로딩 -> ojdbc6.jar
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("MemberDAO 객체 생성 - 드라이버로딩");
	}
	
	static MemberDAO memberDAO = null;
	public static MemberDAO getInstance() throws Exception {
		if(memberDAO == null) memberDAO = new MemberDAO();
		return memberDAO; 
	}
	
	public void insert(MemberVO vo) throws Exception{
		//변수선언 위에서
		Connection con = null;
		PreparedStatement ps =null;
		
		try {
			// 2. 연결객체 얻어오기
			String url = "jdbc:oracle:thin:@192.168.0.69:1521:xe";
			String user = "scott";
			String pass = "tiger";

			con = DriverManager.getConnection(url,user,pass);
			System.out.println("디비 연결 성공2");

			// 3. sql 문장 만들기
			String sql = "INSERT INTO MEMBER(REALNAME,NICKNAME,EMAIL,AGE) VALUES(?,?,?,?)";

			// 4. 전송 객체 얻어오기
			
			ps = con.prepareStatement(sql);
			ps.setString(1, vo.getRealname());
			ps.setString(2, vo.getNickname());
			ps.setString(3, vo.getMyemail());
			ps.setInt(4, vo.getMyage());
			// 5. 전송
			ps.executeUpdate();
		}finally {
			// 6. 닫기
			ps.close();
			con.close();
		}
	}
	
}
