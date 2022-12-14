package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class EmpDAO {

	private EmpDAO() throws Exception{
		// 1. 드라이버 로딩 -> ojdbc6.jar
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("EmpDAO 객체 생성 - 드라이버로딩");
	}
	
	static EmpDAO empDAO = null;
	public static EmpDAO getInstance() throws Exception {
		if(empDAO == null) empDAO = new EmpDAO();
		return empDAO;
	}
	
	public void insert(EmpVO vo) throws Exception{
		//변수선언 위에서
		Connection con = null;
		PreparedStatement ps =null;
		
		try {
			// 2. 연결객체 얻어오기
			String url = "jdbc:oracle:thin:@192.168.0.59:1521:xe";
			String user = "scott";
			String pass = "tiger";

			con = DriverManager.getConnection(url,user,pass);
			System.out.println("디비 연결 성공2");

			// 3. sql 문장 만들기
			String sql = "INSERT INTO EMP(EMPNO,ENAME,DEPTNO,JOB,SAL) VALUES(?,?,?,?,?)";

			// 4. 전송 객체 얻어오기
			ps = con.prepareStatement(sql);
			ps.setInt(1, vo.getEmpno());
			ps.setString(2, vo.getEname());
			ps.setInt(3, vo.getDeptno());
			ps.setString(4, vo.getJob());
			ps.setInt(5, vo.getSal());
			// 5. 전송
			ps.executeUpdate();
		}finally {
			// 6. 닫기
			ps.close();
			con.close();
		}
	}
}
