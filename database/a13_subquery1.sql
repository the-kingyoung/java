--서브쿼리
--가장 급여가 많은 사원의 정보를 출력하세요
/*
사원번호, 이름별로 그룹을 처리하여 최대값을 급여출력(X)
SELECT empno, ename,max(sal)
FROM emp
group BY empno, ename;
*/
--1. 최고급여를 호출.
SELECT max(sal)
FROM emp;

--2. 최고 급여에 해당하는 정보를 조건 처리.
SELECT *
FROM EMP 
WHERE sal=5000;
--위 두개의 sql을 혼합해서 처리
--단일 데이터 sub query : 1개의 sub query 결과로 처리하는 형식
SELECT *
from emp
WHERE sal=(
	SELECT max(sal) FROM emp
);
--2) 다중 데이터 sub query : sub query의 결과가 다중으로 처리
--	부서번호별 최고 급여자의 정보를 출력..
SELECT DEPTNO ,max(SAL)
FROM emp
GROUP BY deptno;
SELECT *
FROM emp
WHERE (deptno, SAL) in(
	SELECT DEPTNO ,max(SAL)
	FROM emp
	GROUP BY deptno
)
ORDER BY deptno;
/*
# exists연산자
1. 서브쿼리의 결과값이 있는지 여부를 확인해서 메인쿼리 실행여부를 처리해준다.
# not exists연산자 : 결과값이 없을때 실행처리..
*/
SELECT *
FROM emp
WHERE comm IS NULL;

SELECT *
FROM emp
WHERE deptno=40;
--subquery 데이터 있을 때

SELECT *
FROM emp
WHERE EXISTS (
SELECT *
FROM emp
WHERE comm IS NOT NULL 
);
--subquery 데이터 없을 때
SELECT *
FROM emp
WHERE NOT EXISTS(
SELECT *
FROM emp
WHERE deptno=40
);
