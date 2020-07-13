package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;
import vo.LoginException;

public class MemberLoginProService {

	public boolean isLoginMember(String id, String passwd) throws LoginException {
		boolean isMember = false;
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		// MemberDAO 클래스의 selectLoginMember() 메서드를 호출하여 로그인 수행
		// => 파라미터 : 아이디, 패스워드    리턴타입 boolean(isMember)
		isMember = memberDAO.selectLoginMember(id, passwd);
		
		close(con);
		
		return isMember;
	}

}
