/*
# 정규화
1. 데이터베이스 설계시, 정규화를 통해서 데이터의 중복과 이상현상을 사전에 방지할 수 있다.
2. 정규화의 주요 개념
   1) 이상현상
   2) 함수의 종속성.
3. 정규화 과정
   1) 제1정규화
   2) 제2정규화
   3) 제3정규화
   ----------------------
   4) BCNF정규화
   5) 제4정규화
   6) 제5정규화
   
# 이상현상
1. 잘못된 데이터베이스 설계는 이상현상을 발생시켜,
   데이터의 중복과 잘못된 update 및 입력이 될수 있다.
2. 종류
   1) 삽입이상 : 데이터 입력시 특정 속성에 해당하는 값이 null로 입력되어 데이터의 낭비를 초래할 수 있다.
   2) 삭제이상 : 데이터 row단위 삭제시 저장된 다른 정보까지 연쇄적으로 삭제되어 해당 정보를 확인할 수 없는 
      상황이 발생한다.
   3) 수정이상 : 수정시 중복된 데이터의 일부만 수정되어 데이터의 불일치 문제가 발생한다.
*/
-- 이상 현상 예제 확인
CREATE TABLE Summer(
   sid NUMBER,
   class varchar2(20),
   price number
);
INSERT INTO Summer VALUES (100,'FORTRAN',20000);
INSERT INTO Summer VALUES (150,'PASCAL',15000);
INSERT INTO Summer VALUES (200,'C',10000);
SELECT * FROM summer;
INSERT INTO Summer VALUES (250,'FORTRAN',20000);
--sql을 작성해보세요
--계절학기를 듣는 학생의 학번과 수강하는 과목은?
--c 강좌의 수강료는?
SELECT sid, class FROM summer;
--c 강좌의 수강료는?
SELECT price FROM SUMMER 
WHERE class = 'C';
--수강료가 가장 비싼 과목은?
SELECT * FROM summer
WHERE price=(SELECT max(price)
            FROM summer);
--계절학기를 듣는 학생수와 수강료 총합은?
SELECT count(*) "학생수", sum(price)"수강료총합"
FROM summer;
--# 삭제이상의 예
--1. 200번 학생의 계절학기 수강신청을 취소처리 sql 작성하세요
DELETE FROM SUMMER WHERE sid=250;
--	정규화(테이블 분리)가 되지 않아 수강과목 정보자체가 학생정보의 데이터를
--	삭제하는 순간 없어져버린다.
SELECT * FROM summer;
--2. C 강좌의 수강료를 조회..?
--   C강좌 정보와 수강료 정보까지 200학생을 삭제하는 순간 사라진다.
--   정규화 과정은 이와같이 특정 정보를 삭제하더라도 연관된 다른 정보는 다시 볼수 있게 하는 것을 말한다. - 삭제이상을 보완한다.
--실습을 위해 입력
INSERT INTO summer values(200,'C',10000);
--# 삽입 이상의 예
--1. 계절학기에 새로운 자바 강좌를 수강료 25000으로 개설하세요.
INSERT INTO summer values(NULL,'JAVA',25000);
SELECT * FROM summer;
--수강인원 확인
SELECT count(*) "학생수", sum(price)"수강료총합"
FROM summer;
--row단위의 튜플은 4이지만, 수강인원은 sid를 기준으로 하여야 한다.
SELECT count(sid) "학생수", sum(price)"수강료총합"
FROM summer;
SELECT count(*) "학생수", sum(price)"수강료총합"
FROM summer
WHERE sid IS NOT NULL;
--sid가 수강인원이 없을 때는 null로 비워져 있고, 통계치나 자료를 활용하고자 할때 문제가 발생한다. : 삽입이상
--정규화 과정을 거치면 이와같이 필요없는 null데이터 처리되는 것을 방지할 수 있다.
--입력 이상은 학생 정보나 과목정보를 입력할 때, 아직 입력되어 매핑되지 않는
--정보는 null로 처리된어 있는 현상을 말한다. 


--다음 예제를 위해 250, fortran 15000을 입력해주세요
INSERT INTO summer values(250,'FORTRAN',15000);
SELECT * FROM summer;
-- # 수정이상 현상
-- 1) FORTRAN 강좌 수강료 수정 15000으로 수정 처리하세요.
-- 특정한 사람의 수강료를 변경했는데, 다시 과목이 같지만 다른 수강료는 수정이 되지 못하는 것을 확인할 수 있다.
-- 수강료를 수정하면 다음부터 해당 수강료가 다 수정되게 수정오류를 정규식에서는 방지할 수 있다.
/*

 */
--summer 테이블 조회하면 fortran강좌의 수강료가 한건만 수정처리.
SELECT * FROM summer;
-- update 구문을 이용해서 fortran, 100의 price를 15000으로 변경.
UPDATE SUMMER 
SET price=15000
WHERE class='FORTRAN' AND sid=100;
--어떤 계정에서든지 fortran을 변경을 하면 fortran의 수강료가 변경된 데이터로 처리가 되어야 하는데 불일치가 발생하고 있다.
--수정이상으로 정규화가 필요하다.
--# 이와같은 등록, 수정, 삭제의 이상현상을 벗어나기 위하여 테이블 정규화 과정을 처리하도록 하자.
--1. 다음 단계 처리를 위해 원상복구
UPDATE SUMMER 
SET price=20000
WHERE class='FORTRAN' AND sid=100;
SELECT * FROM summer;
--2. 테이블 분리로 과목별가격이 있는 테이블과 학번별로 수강클래스 분리하여 구성하자.
--	1) 계절학기 강좌 수강료 확인
SELECT class,price FROM summer;
--		중복내용 dintinct
SELECT DISTINCT class,price
FROM summer
ORDER BY CLASS;
CREATE TABLE summerprice
AS SELECT DISTINCT class,price
FROM summer
ORDER BY CLASS;
SELECT * FROM SUMMERPRICE ;
--	2) 학번별 수강클래스 테이블 생성
SELECT sid, class
FROM summer
WHERE sid IS NOT NULL
ORDER BY sid;
CREATE TABLE summerenroll
AS SELECT sid, class
FROM summer
WHERE sid IS NOT NULL
ORDER BY sid;
SELECT * from summerenroll;
/*
새로 만들어진 
SUMMERPRICE,summerenroll을 통해서 위 sql을 작성해보세요.		*/
--계절학기를 듣는 학생의 학번과 수강하는 과목은?
SELECT * FROM summerenroll;
--c 강좌의 수강료는?
SELECT price FROM summerprice
WHERE class='C';
--수강료가 가장 비싼 과목은?
SELECT price,class FROM summerprice
WHERE price=(SELECT max(price) FROM summerprice);
--계절학기를 듣는 학생수와 수강료 총합은?
SELECT count(sid), sum(price) 
FROM summerenroll a, summerprice b
WHERE a.class=b.class;
-- # 정규화 처리 후, 이상현상 확인
-- 1. 삭제 이상 확인
--		200번 학생의 계절학기 수강신청을 취소했을 때, 
--		해당과목의 정보를 확인할 수 있는지 여부 확인.
SELECT * FROM SUMMERenroll s 
WHERE sid=200;

DELETE FROM summerenroll 
WHERE sid =200;
SELECT * FROM summerenroll; --수강신청 항목에는 없어짐
SELECT * FROM summerprice;	--수강과목에는 C가 있는 것을 확인할 수 있다.
-- 2. 삽입 이상 확인
--		계절학기 과목을 등록하더라도 수강신청자 테이블에 영향이 없게 처리..
INSERT INTO summerprice VALUES ('JSP',23000);
SELECT * FROM summerprice;
SELECT * FROM summerenroll;
-- 테이블 분리로 정상적인 입력이 가능한 것을 알 수 있다.
--fortran 강좌의 수강료를 20000에서 15000으로 수정하고,
--신청자들의 수강료를 확인해보세요.
UPDATE summerprice
SET price=15000
WHERE class='FORTRAN';

SELECT a.price, a.class, b.sid
FROM summerprice a, summerenroll b
WHERE a.class=b.class;

CREATE TABLE ex1(
	num number(3),
	name varchar2(30),
	study varchar2(50),
	address varchar2(300),
	sname varchar2(100),
	sloc varchar2(100)
);
INSERT INTO ex1 values(501,'박지성','컴퓨터과','영국 맨체스터','데이터베이스','공학관 110');
INSERT INTO ex1 values(401,'김연아','체육학과','대한민국 서울','데이터베이스','공학관 110');
INSERT INTO ex1 values(402,'장미란','체육학과','대한민국 강원도','스포츠경영학','공학관 103');
INSERT INTO ex1 values(502,'추신수','컴퓨터과','미국 클리블랜드','자료구조','공학관 111');
INSERT INTO ex1 values(501,'박지성','컴퓨터과','영국 맨체스터','자료구조','공학관 111');
INSERT INTO ex1 values(401,'김연아','체육학과','대한민국 서울','스포츠경영학','공학관 103');
SELECT * FROM ex1;
/*
1. 등록이상 : 학생만 등록을 하는데 수강과목과 강의실은 null이 되어있음
INSERT INTO ex1(num,name,study,address) values(503,'손흥민','체육학과','영국 런던');

2. 수정이상 : 데이터베이스 공학과 정보가 다 변경되지 않음
	update ex1
	set sloc = '공학과 109'
	where num=401 and sname='데이터베이스';
	
3. 삭제 이상 : 501, 502수강 자료 구조 정보가 없어짐
	학번의 특정 정보를 삭제하던지, course로 조건을 삭제하면, 연결된 모든 정보가 삭제되어
	삭제이상이 발생한다.
	delete
	from ex1
	where num in (501,502);
 */
SELECT DISTINCT num, name,study,address
FROM ex1
ORDER BY num;
CREATE TABLE studentInfo
AS SELECT DISTINCT num, name,study,address
FROM ex1
ORDER BY num;
SELECT * FROM studentInfo;

--키값을 포함
SELECT 100 cno, a.*
FROM (SELECT DISTINCT sname, sloc FROM ex1 ORDER BY SNAME) a;

CREATE TABLE studyInfo
AS SELECT 100 cno, a.*
FROM (SELECT DISTINCT sname, sloc FROM ex1 ORDER BY SNAME) a;

SELECT * FROM studyInfo;
SELECT * FROM studentInfo;

CREATE TABLE sname_reg(
	num NUMBER,
	cno NUMBER
);
INSERT INTO sname_reg values(501,100);
INSERT INTO sname_reg values(401,100);
INSERT INTO sname_reg values(402,101);
INSERT INTO sname_reg values(502,102);
INSERT INTO sname_reg values(501,102);
INSERT INTO sname_reg values(401,101);

SELECT * FROM studentInfo;
SELECT * FROM studyInfo;
SELECT * FROM sname_reg;
-- 학생별 수강정보 출력
SELECT a.name, c.sname
FROM studentInfo a, sname_reg b, studyInfo c
WHERE a.num = b.num
AND b.cno = c.cno;

--1. 등록이상 : 학생정보, 수강신청정보, 과목정보를 각 테이블에 등록시, 등록이상이 생기지 않는다.
--2. 수정이상 : 학생정보가 수정, 수정신청정보 수정, 과목정보를 수정하더라도 수정이상이 생기지 않는다.
--3. 삭제이상 : 수강신청 정보가 삭제되더라도 학생정보나 과목정보가 사라지지않는다.

