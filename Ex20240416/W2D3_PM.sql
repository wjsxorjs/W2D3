-- ====================| 2024.04.16 PM |=========================
-- 자원 삭제 : DELETE

-- m_idx가 4번인 자원을 삭제하라
DELETE
FROM member_t
WHERE m_idx = 4
;

DELETE
FROM member_t
WHERE m_idx > 2
;



-- 데이터 확인
SELECT *
FROM member_t
;

-- 
-- 




--    [책 정보]
--   	- 도서코드, 도서명, 저자, 출판사, 가격
-- 	  기본키: 도서코드

CREATE TABLE book_info(
book_code BIGINT AUTO_INCREMENT,
book_name VARCHAR(100),
book_author VARCHAR(100),
book_publisher VARCHAR(100),
book_price BIGINT ,
CONSTRAINT book_info_pk PRIMARY KEY(book_code)
);

--    [회원 정보]
-- 	- 회원코드, 회원ID, 비밀번호, 회원명, 연락처, 주소
-- 	  기본키: 회원코드
CREATE TABLE member_info(
member_code BIGINT AUTO_INCREMENT,
member_id VARCHAR(20),
member_password VARCHAR(20),
member_name VARCHAR(50),
member_phone VARCHAR(20),
member_address VARCHAR(200),
CONSTRAINT member_info_pk PRIMARY KEY(member_code)
);

--      [대여현황 정보]
-- 	- 대여코드, 대여일, 반납일, 회원코드, 도서코드, 상태
--    기본키: 대여코드
-- 	  외래키: 회원코드  회원정보(회원코드)
-- 	        도서코드  책 정보(도서코드)
CREATE TABLE chkout_info(
chkout_code BIGINT AUTO_INCREMENT,
chkout_date DATE,
chkin_date DATE,
member_code BIGINT ,
book_code BIGINT ,
chkout_state BOOLEAN,
CONSTRAINT chkout_info_pk PRIMARY KEY(chkout_code),
CONSTRAINT chkout_info_fk_m FOREIGN KEY(member_code) REFERENCES member_info(member_code),
CONSTRAINT chkout_info_fk_b FOREIGN KEY(book_code) REFERENCES book_info(book_code)
);

INSERT
INTO member_info(member_id, member_password, member_name, member_phone, member_address)
VALUES('jackesther','estherJ1234!','Jack','010-0000-0000','Suwon')
;

SELECT *
FROM member_info
;

INSERT
INTO book_info(book_name, book_author, book_publisher, book_price)
VALUES('이리저리이','이로이','사판출판사',25000)
;

SELECT *
FROM book_info
;

INSERT
INTO chkout_info(chkout_date, member_code, book_code, chkout_state)
VALUES(date_format(now(),'%Y%m%d'),1,1,TRUE)
;

SELECT *
FROM chkout_info
;

SELECT  m.member_name, b.book_name, c.chkout_date
FROM member_info as m, book_info as b, chkout_info as c
WHERE c.member_code = m.member_code AND c.book_code = b.book_code
;





DROP TABLE chkout_info;
DROP TABLE member_info;
DROP TABLE book_info;



-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 
-- 