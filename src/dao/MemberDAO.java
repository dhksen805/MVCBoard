package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.LoginException;
import vo.MemberBean;

import static db.JdbcUtil.*;

public class MemberDAO {
	private MemberDAO() {}
	
	private static MemberDAO instance = new MemberDAO();

	public static MemberDAO getInstance() {
		return instance;
	}
	
	// ---------------------------------------------
	
	Connection con = null;

	public void setConnection(Connection con) {
		this.con = con;
	}
	
	// ---------------------------------------------
	
	public boolean selectLoginMember(String id, String passwd) throws LoginException {
		boolean loginResult = false;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 1. 아이디와 패스워드가 일치하는 레코드 검색
			// => 아이디, 패스워드 중 틀린 항목에 대한 구분이 불가능
//			String sql = "SELECT id FROM member WHERE id=? AND passwd=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, id);
//			pstmt.setString(2, passwd);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				loginResult = true;
//			}
			
			// 2. 아이디에 해당하는 패스워드를 검색
			// => 조회가 성공했을 경우 존재하는 아이디이므로, 패스워드 판별 가능
			// => 조회가 실패했을 경우 존재하지 않는 아이디
			String sql = "SELECT passwd FROM member WHERE id=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) { // 아이디가 존재하는 경우(패스워드가 조회되는 경우)
				// 패스워드 일치 여부 판별
				if(passwd.equals(rs.getString(1))) { // 패스워드가 일치할 경우
					loginResult = true;
				} else { // 패스워드가 일치하지 않을 경우
					throw new LoginException("패스워드 틀림");
					// => 예외를 직접 발생시켜 예외 메세지에 패스워드 오류 메세지 전달
					// => 외부로 예외를 던져야하므로 메서드 선언부에 throws 필요
				}
			} else { // 아이디가 존재하지 않을 경우(패스워드가 조회되지 않는 경우)
				throw new LoginException("존재하지 않는 아이디");
				// => 예외를 직접 발생시켜 예외 메세지에 아이디 오류 메세지 전달
				// => 외부로 예외를 던져야하므로 메서드 선언부에 throws 필요
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return loginResult;
	}

	public int insertMember(MemberBean member) {
		PreparedStatement pstmt = null;
		
		int insertCount = 0;
		
		try {
			String sql = "INSERT INTO member VALUES (?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getId());
			pstmt.setString(3, member.getPasswd());
			pstmt.setInt(4, member.getAge());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getGender() + "");
			
			insertCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return insertCount;
	}
	
	
	
	
	
}
