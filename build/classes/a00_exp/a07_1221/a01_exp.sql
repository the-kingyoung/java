/*
1. 조회의 기본 형식을 기술하고, 예제를 통해서 그 의미를 기술하세요.
	-	SELECT * FROM EMP; 
		EMP테이블에 있는 전체 컬럼을 조회하는 기본형식
	
	- 	SELECT * | 컬럼리스트
		FROM 테이블명;
		
2. 컬럼의 별칭사용 형식을 기술하고, 기본 예제를 통해 기술하세요.
	-	1) select 컬럼명 AS 별칭명 
		2) select 컬럼명 별칭명
		3) select 컬럼명 "# 별 칭 명 #"	<--공백또는 특수문자 이용시
 		기본 테이블에서 지정한 컬럼명이외에 다른 이름으로 컬럼명써주고 싶으면 콤마 뒤 원하는 컬럼명을 입력한다.
 		컬럼명 안에 공백 또는 특수문자를 활용하고 싶으면""큰 따옴표를 이용한다.

3. dbeaver에서 데이터 베이스서버에 연결하는 핵심 정보를 기술하세요.
	- scott...(?)
4. @@님의 사원번호는 @@이고, 올해 연말보너스는 연봉의 20%인 @@원입니다.
*/
SELECT ename||'님의 사원번호는 '||empno||'이고, 올해 연말보너스는 연봉의 20%인 '||sal*0.2||'만원 입니다.'
FROM emp;

/*
5. sql문의 기본 형식을 기술하고, 각 기본 형식에서 활용되는 keyword를 예제별로 기술하세요.
	
 	select distinct{ /컬럼명} /distinct = 중복된 데이터 처리../
 	from 테이블명
 	//동일한 사원번호를 모두 배제하고 싶을때
 	SELECT DISTINCT empno
 	FROM emp;
 	
 	where 조건 : 특정컬럼의 조건
 	//1000이상의 sal만 출력하고 싶을때
 	SELECT sal
 	FROM emp
 	where sal>=1000;
 	
 	group by 그룹함수를 활용할 때, 그룹핑할 컬럼.
 	//동일한 숫자들을 모두 묶어주고 싶을때
 	SELECT deptno
 	FROM emp
 	GROUP BY deptno
 	
 	order by 정렬할 컬럼.
 	//동일한 숫자들 끼리 정렬하고 싶을때
 	SELECT deptno
 	FROM emp
 	ORDER BY deptno
 	
6. 컬럼명을  별칭명으로 사용할 때, ""를 활용하는 이유는 무엇인가?
	- 공백과 특수문자가 들어가기 때문에
	
7. sql에서 ||와 + 의 차이점을 기술하세요.
	-	||는 문자와 문자 또는 문자와 숫자를 연결하는 연산자이고 +는 숫자형 데이터 컬럼을 연산한다.
	
8. sql을 이용하여 @@번 부서의  사원 @@@(사원번호)의 현재 연봉은 @@ 만원입니다.
 	를 한 라인으로 출력하되, 연봉이 3000이상인 사원만 출력되게 하세요.
 	SELECT deptno||'번 부서의 사원'||ename||'('||empno||')'||'의 현재 연봉은 '||sal||'만원 입니다.'
	FROM EMP
	WHERE sal>=3000;
 	
*/

 --처음부터 만들지 않는 sql편집기는 저장시, 연결이 끊기는 부작용이 있기 때문에
 --과제 제출시 기존 새 편집기에서 작성해 script를 개인톡에 붙여서 보내기
 	