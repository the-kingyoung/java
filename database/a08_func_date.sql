/*
# 날짜 함수
1. 날짜형 데이터 타입에 사용하는 함수
2. 기본 연산
	1) 날짜 +(-) 숫자 : 해당 일자의 일수를 가산(감산)하여 처리.
	2) 날짜 +/- 1/24 : 시간단위 연산 처리.
	1일이 24시간이기 때문에 5시간 이후인 경우, 날짜 + 5/24로 처리한다.
	cf) sysdate는 현재 날짜 시간을 나타낸다.
*/
SELECT	sysdate "현재날짜와 시간",
		sysdate+1 "내일 현재시간",
		sysdate-1 "어제 현재시간",
		sysdate+(8/24) "현재시간에서 8"
FROM dual;
--ex) 사원명과, 입사일, 입사 120일후 인턴만료일, 입사 8시간전, 근무일수
SELECT ename 사원명, hiredate 입사일, hiredate+120 "인턴 만료일", hiredate-(8/24), 
		FLOOR(sysdate-HIREDATE) 근무일수
FROM emp;
--소수점 이하로 시간이 나오기 때문에, 나머지 시간을 절삭으로 처리
/*
# 날짜 함수
1. sysdate : 오라클 서버 시스템의 현재 날짜와 시간
2. months_between(날짜데이터1, 날짜데이터2) : 날짜와 날짜 사이의 개월을 계산
	1개월 = 1, 15일 = 0.5를 기준으로 하여 날짜/시간/분/초 등이 소수점으로 계산이 된다.
*/
SELECT ename, hiredate, MONTHS_BETWEEN(sysdate,hiredate) "근무개월1",
FLOOR(MONTHS_BETWEEN(sysdate,hiredate)) "근무개월2",
FLOOR(MONTHS_BETWEEN(sysdate,hiredate)/12) "근무년수"
FROM emp;
SELECT e.* ename FROM emp; --별칭이 지정되면 별칭으로 테이블을 접근해서 사용할 수 있다.
SELECT a.* job FROM emp a;

SELECT * FROM emp;
--ex1) dual테이블로 오늘을 1일로 해서, 만난지 100, 1000후 날짜
SELECT sysdate "1일",sysdate+100 "100일", SYSDATE +1000 "1000일"
FROM dual;
--ex2) emp 테이블에서 근무개월이 470~480 사이 데이터를 출력하세요
SELECT ename, hiredate, floor(MONTHS_BETWEEN(sysdate,hiredate)) "근무개월"
FROM EMP e 
WHERE floor(MONTHS_BETWEEN(sysdate,hiredate)) BETWEEN 470 AND 480; 
/*
3. add_months(날짜데이터, 추가개월) : 날짜에 개월을 더한 날짜계산
 */
SELECT sysdate, ADD_MONTHS(sysdate,3) "오늘로부터 3개월 후"
FROM emp;
--ex) 사월번호는 부서별 업무파악을 난이도에 따라 3개로 분류한다. 바로 파악되는 0,
--		1개월 1, 2개월 2로 사원번호에 나머지 값으로 처리하였다.
--		입사해서 업무파악 만료일을 출력하세요
--		(회사에서 사원번호의 마지막 자리를 업무 난이도에 따라서 분류하여 만든 경우를 말한다)
--		사원번호, 사원명, 업무파악난이도, 입사일, 업무파악만료일
SELECT empno 사원번호, ename 사원명, mod(empno,3) 업무파악난이도,
		hiredate 입사일, ADD_MONTHS(hiredate,MOD(empno,3)) 업무파악만료일
FROM emp;