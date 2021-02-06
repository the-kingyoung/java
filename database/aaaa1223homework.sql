database

--1. 부서 10과 30에 속하는 모든 사원의 이름과 부서번호를 이름과 알파벳 순으로 정렬되도록 질의문을 만드세요.
SELECT ename, deptno
FROM EMP e 
WHERE deptno IN (10,30)
ORDER BY ename;
--2. 1982년도에 입사한 모든 사원의 이름과 입사일을 출력하세요(like %활용).
--hiredate는 date타입이기때문에 보이는 모양과 문자열로 접근해서 보이는 모양은 차이가 난다.
--''||날짜형 => 강제 타입캐스팅		HIREDATE LIKE '%82%'; 문자열 타입캐스팅된 내용을 비교
--원칙적으로는 날짜형 ==> 함수에 의해 ==>문자열로 변환		변환된 문자열을 비교 연산자로 비교..
SELECT ename, hiredate 입사일,''||HIREDATE "입사일(문자)"
FROM emp 
WHERE HIREDATE LIKE '%82%';
--==============================알아두기===========================================================

--3. 보너스가 급여의 20%이상이고 부서번호가 30인 모든 사원에 대하여 이름, 급여, 그리고 보너스를 출력하세요.
SELECT ename 이름, sal 급여, comm 보너스, sal+nvl(comm,0) 합산
FROM emp
WHERE sal*0.2<=COMM ;

SELECT ename, sal, COMM
FROM EMP 
WHERE comm>=sal*0.2
AND deptno = 30;
/*4. like 키워드에서 %, _ 의미를 기술하고 간단한 예제를 만드세요.
		- % = 기준 데이터 값 외에 값의 위치를 나타낸다.
		- _ = 찾고자하는 데이터의 자릿수를 나타낸다. 
		
		1. 앞뒤에서 시작하는 문자열 검색 : 
				컬럼명 like '시작문자열%'
				컬럼명 like '%마지막문자열'
		2. 정확한 자리수에 문자/문자열		_(언더바를 활용)
			ex)두번째에 A가 들어가는 문자열 검색 : 컬럼명 like '_문자열%'
			
		%는 중간에 문자의 갯수 제한 없고, _ 해당 문자의 갯수를 체크
*/
SELECT * FROM emp WHERE ename LIKE 'A%';
SELECT * FROM emp WHERE job LIKE '___E%';
--5. 가장 최근에 입사한 사원의 이름과 입사일을 출력하세요(in subquery구문 활용)
SELECT ename, hiredate
FROM emp 
WHERE HIREDATE in(SELECT max(HIREDATE) FROM emp);

SELECT max(hiredate)
FROM emp;
SELECT ename, hiredate
FROM emp 
WHERE HIREDATE in(SELECT max(HIREDATE)FROM emp);


SELECT ename, sal, DEPTNO 
FROM EMP e
ORDER BY sal DESC, deptno DESC ;

SELECT *
FROM emp
WHERE comm IS NULL 
AND job in('MANAGER','CLERK')
AND ename NOT LIKE '_L%';





