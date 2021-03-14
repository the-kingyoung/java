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
번호/게시판/제목/작성일

CREATE SEQUENCE  boardNum_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999 
    MINVALUE 1
    CACHE 20
    NOORDER 
    NOCYCLE;

CREATE TABLE boardExp(
	num integer,
	kind varchar2(100),
	title varchar2(300),
	regDate date
);
INSERT INTO boardExp values(boardNum_seq.nextVal, '자유게시판','가입인사',sysdate-40);
INSERT INTO boardExp values(boardNum_seq.nextVal, 'JAVA게시판','모르겠어요',sysdate-41);
INSERT INTO boardExp values(boardNum_seq.nextVal, 'JSP게시판','이건 모르겠네요',sysdate-42);
INSERT INTO boardExp values(boardNum_seq.nextVal, '자유게시판','코딩 억지로 하는사람 손?',sysdate-43);
INSERT INTO boardExp values(boardNum_seq.nextVal, '자유게시판','무슨말인지 하나도 모르겠다',sysdate-44);
INSERT INTO boardExp values(boardNum_seq.nextVal, '비밀게시판','ㅡㅡ',sysdate-45);
INSERT INTO boardExp values(boardNum_seq.nextVal, 'HTML게시판','이정도면 양호한건가요 ?',sysdate-46);
INSERT INTO boardExp values(boardNum_seq.nextVal, 'HTML게시판','후...',sysdate-47);
INSERT INTO boardExp values(boardNum_seq.nextVal, '자유게시판','SPRING',sysdate-48);
INSERT INTO boardExp values(boardNum_seq.nextVal, 'SQL게시판','그만하고싶네요 ㅠ',sysdate-49);
INSERT INTO boardExp values(boardNum_seq.nextVal, '자유게시판','.ㅠ.ㅠㅠㅠ..',sysdate-50);


INSERT INTO boardExp values(boardNum_seq.nextVal, 'HTML게시판','모르겠다',sysdate-51);
INSERT INTO boardExp values(boardNum_seq.nextVal, '자유게시판','.ㅠ.ㅠㅠㅠㅁㄴㅇㄻㄻㄴ..',sysdate-52);
INSERT INTO boardExp values(boardNum_seq.nextVal, 'SQL게시판','.이것도 모르겠다',sysdate-53);
INSERT INTO boardExp values(boardNum_seq.nextVal, '자유게시판','.ㅠ.ㅠㅠ키킼크크ㅁㄴㅇㄹㅠ..',sysdate-54);
INSERT INTO boardExp values(boardNum_seq.nextVal, 'JAVA게시판','ㄹㅇ모름',sysdate-55);
INSERT INTO boardExp values(boardNum_seq.nextVal, 'JAVA게시판','진짜 모르겠다 정말로',sysdate-56);
INSERT INTO boardExp values(boardNum_seq.nextVal, '자유게시판','후....',sysdate-57);
INSERT INTO boardExp values(boardNum_seq.nextVal, 'SQL게시판','이것도 모르는거 실화?',sysdate-58);
INSERT INTO boardExp values(boardNum_seq.nextVal, '자유게시판','미치겠네 증말루다가',sysdate-59);



SELECT * FROM boardExp;

CREATE TABLE userInfo2(
	id varchar2(100),
	pass varchar2(100),
	email varchar2(300),
	phonNum varchar2(200),
	address varchar2(1000)
);

SELECT * FROM userInfo2
WHERE id='himan';

INSERT INTO userInfo2 values('himan','7777','asdf@asdf.com','010-7777-8888', '서울 강남');

SELECT * FROM (
	SELECT ROWNUM bnum, u.* FROM (
		SELECT * FROM boardExp ORDER BY num
	) u
) WHERE num BETWEEN 1 AND 5;

SELECT count(*) FROM boardExp;

UPDATE userInfo2
SET pass = '',
	email= '',
	phonNum = '',
	address = ''
WHERE id='himan';


