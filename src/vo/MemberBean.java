package vo;

/*
 CREATE TABLE member (
	name VARCHAR(12),
	id VARCHAR(12) PRIMARY KEY,
	passwd VARCHAR(12),
	age INT,
	email VARCHAR(30) UNIQUE,
	gender CHAR(1)
 );
 */
public class MemberBean {
	private String name;
	private String id;
	private String passwd;
	private int age;
	private String email;
	private char gender; // 라디오버튼으로 입력받기
	
	public MemberBean() {}
	
	public MemberBean(
			String name, String id, String passwd, int age, String email, char gender) {
		this.name = name;
		this.id = id;
		this.passwd = passwd;
		this.age = age;
		this.email = email;
		this.gender = gender;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}
	
	
	
}




















