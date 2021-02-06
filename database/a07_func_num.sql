/*
# 숫자형 처리함수
1. 숫자형 데이터를 원하는 형태로 수학적 처리나 연산을 처리해주는 함수를 말한다.
2. 종류
	1) round : 지정한 소수점 자리로 반올림 처리를 해준다.
		round(데이터,자리수)
		자리수 : +값은 소수점 이하 자리수를 말한다.
			ex) round(45.2432,2) ==45.24
				-값은 소수점 기준으로 10,100,1000 단위로 처리해 주는것\
				 10단위 이상의 자리수 처리
				round(2456435,-3)==>2456000
	
	2) trunc : 지정한 소수점 자리까지 남기고 절삭처리
		trunc(데이터, 자리수) cf) floor() : 정수로 절삭
*/
SELECT round(222452.7552,2) FROM dual;
SELECT round(222452.7552) FROM dual;
SELECT round(222452.7552,-3) FROM dual;
SELECT * FROM emp;
-- ex) sal의 15% 인상 금액을 100자리 단위와 소수점 1자리 단위로 출력하세요
SELECT sal,sal*1.15 인상금액형식1,round(sal*1.15,-2) 인상금액형식2, round(sal*1.15,1) 인상금액형식3
FROM emp;
--절삭처리.
SELECT trunc(5734.24599,2) FROM dual;
SELECT trunc(5734.24599) FROM dual;
SELECT trunc(5734.24599,-2) FROM dual;
--ex1) 	급여를 부서번호 기준으로 %로 올해 인상급여를 지정한다고 할때,
--		100자리 단위 절삭과 소수점 2자리 절삭을 사원명과 함께 출력하세요.
SELECT * FROM emp;
SELECT ename, sal, sal*(deptno/100) "인상분1", trunc(sal*(deptno/100),-2) "인상분2",
					trunc(sal*(deptno/100),2) "인상분3", trunc(sal + sal*(deptno/100),2) "총계"
FROM emp;
/*	3) mod : 데이터베이스에서 산술연산자 % 대신 쓰이는 나머지 처리 함수를 말한다.
		mod(데이터, m) : 데이터를 m으로 나눈 나머지값
		ex) mod(10,3) ==>1 */
SELECT mod(10,3) 예제1, MOD(10,2) 예제2 FROM dual;
--사번이 짝수인 데이터를 출력하세요
SELECT *
FROM emp
WHERE mod(empno,2)=0;
/*	4) ceil : 지정한 값보다 큰 수 중에서 가장 작은 정수
		소수점 이하의 내용에 대하여 올림 정수
	5) floor : 지정한 값보다 작은 수 중에서 가장 큰 정수
		소수점 이하의 내용에 대하여 내림 정수  */

SELECT ceil(25.75) "올림 정수",
	   floor(25.75) "내림 정수"
FROM dual;
SELECT * FROM emp;
--ex) 사원 중에서 홀수 번호가 sal와 comm의 합산한 금액에 5% 향상된 최종 금액을 내년 급여로
--	  선정하였다고 한다. 
SELECT sal, comm, (sal+nvl(comm,0))*1.05 "내년 급여", 
		ceil((sal+nvl(comm,0))*1.05) 올림정수, floor((sal+nvl(comm,0))*1.05) 내림정수, EMPNO 
FROM emp
WHERE mod(empno,2)=1;


