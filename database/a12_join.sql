/*
# 조인이란 ?
1. 하나의 sql명령문에 의해 여러 테이블에 저장된 데이터를 한번에 조회할 수 있는 기능을 말한다.
2. 두개 테이블에서 공통되는 컬럼을 기준으로 조건문을 만들어 조인을 한다.
3. 기본형식
	select 테이블별칭.컬럼명, 테이블별칭.컬럼명	...
	from 테이블1 별칭, 테이블2 별칭
	where 별칭.공통컬럼 = 별칭.공통컬럼
*/
--emp의 마지막 컬럼인 deptno를 통해서 부서 번호를 가지고 있다.
SELECT *
FROM emp;
--dept는 첫번째 컬럼인 deptno를 통해서 부서 정보를 가지고 있다.
SELECT *
FROM dept;
--사원별로 부서이름을 가져올려면 다음 같은 sql을 사용하여야 한다.
SELECT *
FROM  EMP e 
WHERE deptno=20;
--부서테이블에서 부서 정보 sql을 가져온다
SELECT *
FROM DEPT d 
WHERE deptno=20;
--두개의 테이블에 공통되는 부서번호(deptno)가 있기 때문에 join관계를 활용하면
--사원별로 부서정보(부서번호, 부서명, 부서위치)를 가져올 수 있다.
SELECT e.*,dname,loc
FROM emp e, DEPT d 
WHERE e.DEPTNO =d.DEPTNO ;
CREATE TABLE emp_dept
AS
SELECT e.*,dname,loc
FROM emp e, DEPT d 
WHERE e.DEPTNO =d.DEPTNO ;
--통합테이블 사용시..(테이블 분리의 필요성)
--1. 입력시 부서정보의 부서명, 위치를 계속입력.
--2. 부서명, 위치를 잘못입력할 수 있다.(오류 가능)
--3. 수정 삭제시, 데이터 건수가 늘어날수록 엄청난 부하를 발생한다.
--		ex)	부서명이나 부서위치가 변경될 때, 통합테이블과 분리된 테이블의 차이.
--			ACCOUNTING ==> 회계
--			1) DEPT 테이블이 있을 때, DEPT테이블의 1개의 ROW만 수정.
--			2) 통합되어 있을 때, EMP_DEPT테이블이 있는 데이터 건수 만큼 수정.

SELECT * FROM emp_dept;

--부서명, 사원명, 급여
SELECT d.dname, e.ename, e.sal
FROM emp e, DEPT d
WHERE e.DEPTNO = d.DEPTNO ;
--

SELECT deptno 부서번호, dname 부서이름, loc 부서위치
FROM dept;
--ex) 사원번호, 사원명, 부서이름, 부서위치를 출력하세요
--	컬럼명 해당 테이블 고유의 컬럼이면, 테이블의 별칭을 사용하지 않아도 된다.
SELECT empno 사원번호, ename 사원명, dname 부서이름, loc 부서위치
FROM emp e,dept d
WHERE e.deptno = d.deptno;
--검색 조건의 추가 또는 기존의 여러가지 sql query 사용하기
--급여가 3000이상인 부서명,부서위치,사원명,급여를 출력
SELECT dname, loc,ename,sal
FROM EMP e ,DEPT d 
WHERE e.DEPTNO = d.DEPTNO 
AND sal>=3000;
--ex)3,4분기에 입사한 사원의 이름과 부서위치, 분기를 출력하세요
SELECT ename, loc, to_char(hiredate,'Q')||'분기' "분기"
FROM EMP e ,DEPT d 
WHERE e.DEPTNO = d.DEPTNO 
AND to_char(HIREDATE,'Q')>=3;--to_char(hiredate,'Q') in(3,4);
--ex) 부서명별 최고 급여를 출력하세요

SELECT dname, max(sal) 최고급여
FROM EMP e ,DEPT d 
WHERE e.DEPTNO =d.DEPTNO 
GROUP BY dname;
/*
# 카티션 곱
1. 전체 데이터 내용을 리스트 처리하는 것을 말한다.
	where 조건을 걸지 않을 때, 연관 관계와 별도로 하나의 테이블의 하나의 행에 
	반대쪽 테이블에 전체 행이 연결되어 리스트 되어진다.

*/
SELECT e.*, d.*
FROM EMP e, DEPT d;

SELECT e.*, d.*
FROM EMP e CROSS JOIN DEPT d;
/*
# equi JOIN = NATURAL JOIN
	두개의 공통되는 컬럼으로 조인을 하는 것을 말한다.
*/
SELECT *
FROM emp e NATURAL JOIN dept d;
/*
# non-equi JOIN
1. 두개의 테이블에 조인할 조건이 '='(동일) 조건이 아니고, 범위를 지정할 때 활용된다.
*/
SELECT * FROM SALGRADE s ;
--grade : 등급, losal : 최소, hisal : 최대범위
--사원의 이름과 급여, 등급을 표시하세요.
SELECT ename, sal, grade
FROM EMP e ,SALGRADE s 
WHERE sal BETWEEN losal AND hisal;
/*
 # outer join
 1. 두개의 테이블에서 equi join시, 한쪽에 해당 데이터가 없으면 	나타나지않는 특징이 있다. 
 	이때, 특정한 테이블 기준으로 해당 테이블과 조인하는 테이블이 데이터가 없더라도 
 	데이터를 출력하게 해주는 join이 outer join이다.
 */
SELECT *
FROM dept;
SELECT DISTINCT deptno
FROM emp;
--emp에 있는 deptno 데이터와 dept에 있는 deptno에는 차이가 발생한다.
--데이터의 존재여부에 상관없이 조인하여 현재 부서번에 따른 할당 내용을 확인하고자 outer join을 활용한다
SELECT d.*,ename, job, sal
FROM DEPT d , EMP e 
WHERE d.deptno=e.deptno(+)
ORDER BY d.deptno;
--e.deptno(+) : 사원테이블이 부서테이블에 비해 데이터가 없을 때,
--	NULL인 내용도 표기할 때, 해당 테이블의 컬럼을 (+)로 표기한다.

/*
# self 조인
1. 하나의 테이블 안에 컬럼끼리 연관관계(계층 관계)가 있어, 
	join형식으로 데이터를 처리하는 것을 말한다.
2. 형식

	select a.*, b.*
	from 테이블1 a, 테이블1 b
	where a.컬럼1=b.컬럼2

 */
SELECT *
FROM emp;
--empno : 사원번호, mgr : 관리자 사원 번호
--SMITH의 관리자의 이름을 알고자 한다.
SELECT empno, ename, mgr
FROM emp
WHERE ename='SMITH';
SELECT empno, ename
FROM emp
WHERE empno=7902;
--사원의 이름과 사원의 관리자 이름을 출력..
--1. 연관관계가 있는 컬럼을 선택 : empno, mgr
--2. 하나의 테이블을 두개로 alias이름으로 선언하고, 두개의 컬럼을 연관관계를 설정한다.
SELECT a.EMPNO , a.ename, a.job, a.mgr, b.empno, b.ename
FROM emp a, emp b	--테이블 내에 SELF조인이 있으면 ALIAS를 사용
WHERE a.mgr = b.empno;
--	관리자 번호의 사원 정보를 하나의 SQL로 가져오고자 할때, 
--	join관계를 설정하여 처리한다.
/*
위 계층 관계의 테이블을 이해했으면 아래와 같은 하나의 테이블 내에 계층 관계가 있는 데이터를 처리해보세요.
1. 테이블 만들기
family 테이블
no(번호)	pos(역할)	name(이름) 	parno(부모번호)
1		할아버지		홍말순		0
2		아버지		홍판서		1
3		아들1		홍진희		2
4		아들2		홍길동		2
sample 데이터를 3개이상 입력해보세요.
2. 데이터 입력
3. sql이용해서 @@@의 아버지의 이름은 @@@이다. 출력.
*/
   CREATE TABLE family1(
      num number,
      pos varchar2(20),
      name varchar2(20),
      parno NUMBER
   );
   
  	INSERT INTO family1 values(1,'할아버지','홍말순',0);
  --최상위 계층..
  	INSERT INTO family1 values(2,'아버지','홍판서',1);
  --num과 parno의 연관관계를 설정하여 데이터를 입력한다.
 	INSERT INTO family1 values(3,'아들1','홍진희',2);
	INSERT INTO family1 values(4,'아들2','홍길동',2);
	INSERT INTO family1 values(5,'초기 유닛','라바1',0);
	INSERT INTO family1 values(6,'1차 유닛','드론1',5);
	INSERT INTO family1 values(7,'1차 유닛','저글링1',5);
	INSERT INTO family1 values(8,'1차 유닛','히드라1',5);
	INSERT INTO family1 values(9,'2차 유닛','럴커1',8);	



SELECT * FROM family1;
SELECT a.name||'의 아버지의 이름은 '||b.name||'이다.'
FROM family1 a, family1 b
WHERE b.num=a.parno;
-- 계층적 sql 때 다시 하는걸로
   
