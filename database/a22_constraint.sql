/*
 # foreign key : 한열과 참조된 테이블의 열간에 외래 키 관계를 설정하고 실행가능하게 처리
 ex) 	아래와 같이 사원테이블의 부서번호는 참조키관계를 부서테이블의 부서번호와 설정하면 
 		반드시 부서테이블에 데이터가 있어야 입력이 가능하다.
 
 1. 기본형식
 	컬럼명 데이터유형 constraint 제약조건명 references 참조할테이블(참조할컬럼)
 	컬럼명 데이터유형 references 참조할테이블(참조할 컬럼)
 */
SELECT * FROM emp;
SELECT * FROM dept;
SELECT max(empno)FROM emp;
INSERT INTO emp(empno, DEPTNO) values(7935,50);
/*
학사시스템의 학생테이블과 학과테이블을 만들고 학과테이블의 학과번호와 
학생테이블의 학과번호를 참조키 관계를 설정해보자
*/
CREATE TABLE studept(
	deptno number(3) PRIMARY KEY,
	dname varchar2(50),
	loc varchar2(50)
);
INSERT INTO studept values(101,'컴퓨터공학과', '1호관');
SELECT * FROM studept;
CREATE TABLE STUDENT02(
	studno NUMBER PRIMARY KEY,
	name varchar2(50) NOT NULL,
	deptno number(3) CONSTRAINT STUDENT02_DEPTNO_FK REFERENCES studept(deptno)
);
INSERT INTO STUDENT02 VALUES(1000,'홍길동', 101);
--테이블에 있는 데이터 정산 입력
INSERT INTO STUDENT02 VALUES(1001,'홍길동', 102);
-- 참조테이블에 없는 데이터 입력시 입력

SELECT * FROM STUDENT02;
/*
# check 제약조건 설정.
1. 컬럼에서 허용 가능한 데이터의 범위나 조건을 지정할 때 활용된다.
	ex) 학년은 1~4학년까지만 입력, 학생들의 점수의 범위 0~100까지,
		성별은 '남','여'만 입력 가능..
2. 기본형식
	컬럼명 데이터유형 constraint 제약키명 check(컬럼명 조건문)
	ex) 1,2,3,4 입력가능
	grade number(1) constraint stud_grade_ck check(grade in(1,2,3,4))
	ex) 1~100만 입력가능
	kor number(3)
		constraint stud_kor_ck check(kor between 1 and 100)
*/
CREATE TABLE STUDENT03(
	name varchar2(50) NOT NULL,
	grade number(1) CONSTRAINT STUDENT03_GRADE_CK CHECK(grade IN(1,2,3,4))
);
SELECT * FROM ALL_CONSTRAINTS 
WHERE owner='SCOTT';
INSERT INTO STUDENT03 VALUES('홍길동',1);
INSERT INTO STUDENT03 VALUES('김길동',NULL);
--CHECK제약조건은 NULL은 허용된다.
INSERT INTO STUDENT03 VALUES('김길동',5);
SELECT * FROM STUDENT03;
--EX) STUDENT04테이블을 NO는 PRIMARY KEY, 이름은 NOT NULL,
--		성별은 남/녀, 국어,영어,수학점수는 0~100점만 입력 가능하게 만드세요.
CREATE TABLE STUDENT04(
	NO NUMBER CONSTRAINT STU04_NO_PK PRIMARY KEY,
	NAME VARCHAR2(50) NOT NULL,
	GENDER CHAR(4) CONSTRAINT STU04_GENDER_CK CHECK(GENDER IN('남','여')),
	KOR NUMBER(3) CONSTRAINT STU04_KOR_CK CHECK(KOR between 1 and 100),
	ENG NUMBER(3) CONSTRAINT STU04_ENG_CK CHECK(ENG between 1 and 100),
	MATH NUMBER(3) CONSTRAINT STU04_MATH_CK CHECK(MATH between 1 and 100)
);
SELECT * FROM STUDENT04;
INSERT INTO STUDENT04 VALUES(1,'홍길동','남',90,80,85);
INSERT INTO STUDENT04 VALUES(2,'신길동','남자',90,80,85);--한글은 3BYTE라서 '남자'라고 하려면 6으로 설정해야함
INSERT INTO STUDENT04 VALUES(3,'오영희','남',90,80,85);
INSERT INTO STUDENT04 VALUES(4,'신영희','남',90,80,101);--범위 제약조건 에러 발생
/*
# 기존 테이블가.
1. null을 제외한 무결성 제약에 무결성 제약조건 추조건 추가
	1) 기본형식
		alter table 테이블명
		add contraint 제약조건이름 제약조건타입 컬럼;
2. null 무결성 제약 조건 추가  
		alter table 테이블명
		modify  컬럼명 constraint 제약조건이름 제약조건타입;
*/
CREATE TABLE student05(
	NO number,
	name varchar2(50),
	kor number(3),
	eng number(3),
	math number(3)
);
--고유키 제약조건 설정
ALTER TABLE student05
ADD CONSTRAINT stud_no_uk unique(no);
-- not null 제약조건 설정
ALTER TABLE student05
MODIFY (name CONSTRAINT stud_name_nn NOT null);
/*
# 메타데이터 정보(시스템 정보)
1. all_constraint 
 */
SELECT * FROM user_constraints
WHERE table_name='STUDENT05';
--ex) emp55로 복사테이블 만들고, empno - unique, ename not null, deptno는 dept테이블의 deptno참조
--							sal는 0이상으로 제약조건을 추가 처리해보세요
CREATE TABLE emp55
AS SELECT * FROM emp;
SELECT * FROM emp55;

ALTER TABLE emp55
ADD CONSTRAINT emp55_empno_uk unique(empno);
--add constraint 제약키명 제약조건(컬럼명)
ALTER TABLE emp55
ADD CONSTRAINT emp55_emp_pk PRIMARY KEY(empno);

ALTER TABLE emp55
MODIFY (ename CONSTRAINT emp55_ename_nn NOT null);
--not null 관련 제약조건 : modify(컬럼명 constraint 제약명 not null)'

ALTER TABLE emp55
ADD CONSTRAINT emp55_emp_fk FOREIGN KEY(deptno) REFERENCES dept(deptno);

ALTER TABLE emp55
ADD CONSTRAINT emp55_sal_ck check(sal >=0);

SELECT * FROM all_constraints WHERE TABLE_NAME='EMP55';
/*
# 무결성 제약조건 삭제
1. 기본 형식
	alter table 테이블명
	drop constraint 제약조건명;
*/
SELECT constraint_name, status, table_name FROM all_constraints WHERE TABLE_NAME='EMP55';
ALTER TABLE emp55
DROP CONSTRAINT emp55_empno_uk;
/*
# 무결성 제약조건의 비활성화
1. 무결성 제약조건은 한시적으로 설정값에 의해 비활성화/활성화 처리를 할 수 있다.
2. 기본형식
	alter table 테이블명
	disable constraint 제약조건명;
	
	alter table 테이블명
	enable constraint 제약조건명; 
 * */
ALTER TABLE emp55
disable CONSTRAINT emp55_ename_nn;
SELECT constraint_name, status, table_name FROM all_constraints WHERE TABLE_NAME='EMP55';
ALTER TABLE emp55
enable CONSTRAINT emp55_ename_nn;
SELECT constraint_name, status, table_name 
FROM all_constraints WHERE owner='SCOTT';
--ex) 제약조건이 있는 student03테이블의 제약조건을 삭제하고,
--		비활성화/활성화 처리를 해보세요.
SELECT constraint_name, status, table_name 
FROM all_constraints WHERE TABLE_NAME='STUDENT04';

ALTER TABLE STUDENT04
DROP CONSTRAINT SYS_C007142;

ALTER TABLE STUDENT04 
disable CONSTRAINT STU04_GENDER_CK;

ALTER TABLE STUDENT04 
enable CONSTRAINT STU04_GENDER_CK;