CREATE TABLE member (
	name VARCHAR(12),
	id VARCHAR(12) PRIMARY KEY,
	passwd VARCHAR(12),
	age INT,
	email VARCHAR(30) UNIQUE,
	gender CHAR(1)
);

DROP TABLE member;

DESC member;

INSERT INTO member VALUES ('관리자','admin','1234',20,'admin@admin.com','남');

SELECT * FROM member;