SELECT * FROM emp;
/*
# 서브쿼리
1. 하나의 sql명령문의 결과를 이를 포함하고 있는 상위 sql명령문에 전달하기 위해
	두개 이상의 sql명령문에 상위 sql명령문과 연결하여 처리하는 방법을 말한다.
*/
--사원명 ALLEN의 직책과 같은 사원의 정보를 출력하라
SELECT *
FROM emp
WHERE job=(
		SELECT JOB 
		FROM emp
		WHERE ename='ALLEN');
--ex) SMITH와 같은 부서번호를 가진 사원 정보를 출력하세요
SELECT *
FROM emp
WHERE deptno=(
		SELECT deptno
		FROM emp
		WHERE ename='SMITH');
--ex) MARTIN의 급여보다 같거나 작은 사원 정보를 출력하세요
SELECT *
FROM emp
WHERE sal<=(
		SELECT sal
		FROM emp
		WHERE ename='MARTIN');
/*
# 단일행 서브쿼리
1. 단 하나의 행만을 검색하여 메인쿼리에 반환하는 질의문을 말한다.
2. 비교연산자 : =, >=, >, <, <=, <>(같지않음)
*/
-- deptno가 10인 사원의 평균 급여보다 많은 사원을 출력하세요.
SELECT  avg(sal)
FROM emp
WHERE deptno=10;

SELECT*
FROM emp
WHERE sal>(
		SELECT  avg(sal)
		FROM emp
		WHERE deptno=10);

SELECT * FROM emp;
--ex) SALESMAN에서 가장 많은 급여보다 많이 받는 사원을 출력하세요
SELECT *
FROM EMP
WHERE SAL>(
		SELECT MAX(SAL)
		FROM EMP
		WHERE JOB='SALESMAN');
/*
# 다중행 서브쿼리
1. 서브쿼리에서 실행한 결과값이 1행이상일 때 사용하는 쿼리.
2. 사용되는 연산자
	in : 결과값이 or 조건으로 처리해야할 필요가 있는 경우 활용된다.
	any, some : 결과값이 1개라도 있는 경우 min(조회데이터)과 동일
	all : 모든 결과값이 일치하는 경우 max(조회데이터)과 동일
	exist, not exist : 해당 sub query값이 존재하는 경우, 존재하지 않는 경우. */
	
SELECT * FROM emp;
--job이 SALESMAN인 모든 사원번호에 해당하는 데이터를 조회하세요.
SELECT EMPNO
FROM EMP
WHERE JOB='SALESMAN';
SELECT *
FROM EMP
WHERE EMPNO IN(
		SELECT EMPNO
		FROM EMP
		WHERE JOB='SALESMAN');
		
--ex) BLAKE를 관리자로 하는 사원을 조회하세요(subquery활용)
SELECT *
FROM emp;

SELECT *
FROM emp
WHERE empno in(
		SELECT mgr
		FROM emp
		WHERE ename='BLAKE');
--# any, some : 하나라도 일치하면 참이되는 연산자.
--부서번호가 10인 사원의 급여 중 하나라도 보다 많으면 처리
SELECT ename, sal
FROM emp
WHERE sal> any(
SELECT sal
FROM emp
WHERE deptno=10);

SELECT ename, sal
FROM emp
WHERE sal> SOME(
SELECT sal
FROM emp
WHERE deptno=10);

SELECT ename, sal
FROM emp
WHERE sal>(
SELECT min(sal)
FROM emp
WHERE deptno=10);
--# all은 모두 다 일치하면 참이 되는 연산자
SELECT sal
FROM emp
WHERE deptno=20;
SELECT *
FROM emp
WHERE sal > all(
	SELECT sal
	FROM emp
	WHERE deptno=20
);

SELECT *
FROM emp
WHERE sal > (
	SELECT MAX(sal)
	FROM emp
	WHERE deptno=20
);


	