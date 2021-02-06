CREATE TABLE marketMember(
	userId varchar2(30),
	pass varchar2(30),
	userName varchar2(30),
	email varchar2(50),
	phoNum NUMBER,
	address varchar2(100),
	gender char(6),
	birth number(8)
);
INSERT INTO marketMember values('himan','7777','홍길동','abc123@gmail.com',01011112222,'서울시 강남구','남자',19980719);
INSERT INTO marketMember values('higirl','8888','신길순','def456@gmail.com',01033334444,'부천시 원미구','없음',19920302);
SELECT userId "회원 아이디",pass "비밀번호", userName "회원 이름", email, lpad(phoNum,11,0) "전화번호", 
		address "주소", gender "성별", to_date(birth,'YYYY/MM/DD') "생년월일"
FROM marketMember;
