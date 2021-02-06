/*
[데이터베이스]
[하] 1. subquery를 통한 수정 처리 기본형식을 기술하세요
			update 테이블명
			set 컬럼1 = 변경할데이터,
				컬럼2 = 변경할데이터,
				컬럼3 = 변경할데이터
			where 조건문
			where 절을 생략하면 테이블 모든 행이 수정된다.

[하] 2. job이 CLERK이고 부서번호가 20인 사람을 SAL와 COMM을 각각20% 인상
      처리 하세요.*/
	UPDATE emp30
	SET sal = sal*1.2,
		comm= comm*1.2
	WHERE job='CLERK' AND deptno = 20;

/*
[하] 3.  comm이 null이거나 0인데이터를 sal의 15%로 comm으로 지정하고, 
      hiredate를  2000-01-01로 변경하세요.*/
	
	UPDATE emp30
	SET hiredate = to_date('2000/01/01','YYYY/MM/DD'),
		comm = sal*0.15
	WHERE comm IS NULL or comm=0;
--where nvl(comm,0)=0;
SELECT * FROM emp30;

/*   
[중] 4. emp21복사테이블을 만들고, 부서별 최고 급여자의 사원번호를 확인하고, 
        10=>20, 20=>30, 30 => 10으로 변경하고, 평균 급여로 변경
        처리하세요.*/
CREATE TABLE emp31
AS SELECT * FROM emp21;

SELECT deptno,max(sal)
FROM emp31
GROUP BY deptno;

SELECT empno,deptno, sal
FROM emp31
WHERE (deptno,sal) in(
			SELECT deptno,max(sal)
			FROM emp31
			GROUP BY deptno
);

SELECT *
FROM emp31;

UPDATE EMP31
   SET DEPTNO = CASE DEPTNO 
   				WHEN 10 THEN 20 
   				WHEN 20 THEN 30 
   				WHEN 30 THEN 10 END,
   		  SAL = (	SELECT avg(sal)
   		  			FROM emp31)
 WHERE EMPNO IN(SELECT EMPNO
  				  FROM EMP31
					WHERE (deptno,sal)in(
					SELECT deptno,max(sal)
					FROM emp31
					GROUP BY deptno
));
--1. 부서별 최고 급여
SELECT deptno, max(sal)
FROM EMP31
GROUP BY deptno;
--2. 부서별 최고 급여의 사원번호, 부서번호, 급여
SELECT empno, deptno, sal
FROM EMP31 
where(deptno,SAL) in(
SELECT deptno, max(sal)
FROM EMP31
GROUP BY deptno);
--3. 사원번호별로 변경 처리
--	10=>20, 20=>30, 30=>10 : decode함수 이용
UPDATE emp31
SET deptno = decode(deptno, 10,20,20,30,10),
	sal = (SELECT avg(sal FROM emp31)
WHERE empno = @@@@; --사원번호 확인 입력
--4. subquery 이용해서 한번에 처리.
UPDATE emp31
SET deptno = decode(deptno, 10,20,20,30,10),
	sal = (SELECT avg(sal FROM emp31)
WHERE empno IN(
SELECT empno
FROM EMP31 
where(deptno,SAL) in(
SELECT deptno, max(sal)
FROM EMP31
GROUP BY deptno);



/*
[하] 5. 삭제구분의 기본형식을 기술하세요
	-기본형식-
	delete
	from 테이블명
	where 조건
	행단위로 삭제가 되기 때문에 delete구문이하의 컬럼을 정할 필요가 없다.
	
[하] 6. emp22복사 테이블 만들고, 부서별 최저 급여 데이터를 삭제 처리하세요.*/

CREATE TABLE emp32
AS SELECT * FROM emp22;

DELETE 
FROM emp32
WHERE (deptno,sal) in(SELECT deptno, min(sal)
FROM emp32
GROUP BY deptno);

/*	homework.css(file)
 * body{background-color : plum;	color : blue;
	margin-left:30px;	margin-right:30px;}*/

/*
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h1 {
	background-color: pink;
}
</style>
<link type="text/css" rel="stylesheet" href="homework.css">
</head>
<body>
	<!--
[html]
[하] 1. css란 무엇인가? 개념과 기본 구성에 대하여 기술하세요
	- html문서의 색이나 모양 등 외관을 꾸미는 언어를 말한다.
	- html의 기본 태그에서 지원하지 않는 확장된 기능을 지원하기 위하여 사용된다.

[하] 2. css 사용 형식 3가지(외부,내부,인라인)는 예제를 통해서 설명하세요.
	- 외부스타일 호출.
	외부에 @@.css파일로 스타일 선언이 된 파일을 만들고
	link href="파일명"으로 호출하여 사용한다.
	cf) 여러 페이지에 공통되는 css을 적용할때 많이 활용된다.-->
	<p>예제 1번입니다</p>
	<!--
	- 내부 스타일 호출
	head부분에 style로 선언하고 해당 페이지에 적용할 css선언한다.-->
	<h1>예제 2번</h1>

	<!--- 각 요소객체의 style 속성으로 선언(인라인)
	<요소태그 style="속성:속성값;..">형식으로 선언한다.-->
	<h4 style="color: yellow;">예제 3번</h4>

	<!-- 
[하] 3. css 선택자 선언의 우선 순위를 기술하세요.
		- inline이 가장 먼저 처리가 된다.
		- 페이지 선언 style, 외부 style : 순서로 우선순위 설정.
		- 일반적으로는 외부 style을 선언 후, 페이지 style을 선언하여 우선순위를 잡는 경우가 많다.
 -->
</body>
</html>
*/