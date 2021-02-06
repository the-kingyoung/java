/*
[데이터베이스]
[하] 1. exists, not exists 연산자의 기능과 기본예제를 기술하세요.
		exists연산자
		- 서브쿼리의 결과값이 있는지 여부를 확인해서 메인쿼리를 실행해준다.
		
		==> 해당 내용으로 값이 있는지? true/false을 처리해주는 기능을 한다.
		where 조건문(true/false)
		where exists(subquery)
		where not exists(subquery)

[하] 2. sql을 통해서 부서번호 40이 없을 때, 부서번호 10인 데이터를 조회하는 처리를 하세요.
SELECT *
FROM EMP
WHERE DEPTNO =40;

SELECT*
FROM EMP
WHERE DEPTNO=10
AND NOT EXISTS(
SELECT *
FROM EMP
WHERE DEPTNO =40;
);



[하] 3. 데이터의 단일행 입력 구문 2가지 형식과 예제를 통해 처리해 보세요.
		1) 기본 구문
		insert into 테이블명(컬럼1, 컬럼2..) values (데이터1, 데이터2);
		insert into 테이블명 values (테이블 구조 순서에 따른 데이터1, 데이터2);

[하] 4. 복사테이블 emp15(구조만 복사)를 만들고, ename/job의 크기를 50으로 변경하고, 
        데이터를 입력처리(전체데이터입력, 부분컬럼입력) 하세요*/
	CREATE TABLE emp15
	AS SELECT * FROM emp WHERE 1=0; --구조복사

	ALTER TABLE emp15 MODIFY ename varchar2(50);
	ALTER TABLE emp15 MODIFY job varchar2(50);

	INSERT INTO emp15(ename, job) values('박지성','축구선수');
	INSERT INTO emp15 values(1111,'손흥민','축구선수',1633,to_date('1992/07/08','YYYY/mm/dd'),
							10000,10000,40);
	
/*
[하] 5. 다중행 insert 형식을 기술하세요.
	-데이터를 하나의 테이블에 여러 행을 한번에 입력하는 query를 말한다.
	- 형식
	1) insert명령문에서 서브쿼리로 다른 테이블에서 조회해 와서 입력 처리
	2) insert명령문에 의해 한번에 여러 행을 동시에 입력
	
[중] 6. 부서별 최고급여의 구조와 데이터를 가진 복사 테이블 emp20을 만들고, emp20테이블에 subquery를 활용하여,
        부서번호 10 데이터를 입력하세요.*/
	CREATE TABLE emp20
	AS SELECT *
		FROM emp
		WHERE (deptno,sal) IN (
		SELECT deptno, max(sal)
		FROM emp
		GROUP BY deptno);
	/*
	 create table emp20
	 as select deptno, max(sal) sal
	 from emp
	 group by deptno;
	 select * from emp20;
	
	 insert into 테이블명
	 select * from 테이블명
	 
	 insert into emp20
	 select deptno, sal
	 from emp
	 where deptno=10;
	 테이블과 데이터를 만들기 위한 컬럼을 alias(별칭)로 설정해주면
	 그 이름으로 테이블이 만들어진다.
	 */

	INSERT INTO emp20
	SELECT *
	FROM emp
	WHERE deptno=10;

SELECT * FROM emp20;						
/*
[하] 7. emp21,emp22,emp23 테이블을 만들고, 급여 2000인 이상의 데이터를 각 테이블에 입력 처리하세요.*/

CREATE TABLE emp21 AS SELECT * FROM emp WHERE 1=0;
CREATE TABLE emp22 AS SELECT * FROM emp WHERE 1=0;
CREATE TABLE emp23 AS SELECT * FROM emp WHERE 1=0;
SELECT * FROM emp21;
SELECT * FROM emp22;
SELECT * FROM emp23;
INSERT ALL
into emp21(empno, ename, job, sal, deptno) values(empno, ename, job, sal, deptno)
into emp22(empno, ename, job, sal, deptno) values(empno, ename, job, sal, deptno)
into emp23(empno, ename, job, sal, deptno) values(empno, ename, job, sal, deptno)
SELECT empno, ename, job, sal, deptno
FROM emp
WHERE sal>=2000;


SELECT * FROM emp23;
DELETE 
FROM EMP23
WHERE ename IS NULL;
/*

[하] 8. 수정문의 기본형식을 기술하세요.
	update 테이블명
	set 컬럼1 = 변경할데이터,
		컬럼2 = 변경할데이터,
		컬럼3 = 변경할데이터
	where 조건문
	
[중] 9. emp10 테이블에서 입사일이 2000년도 이전 데이터에 대하여, 입사년도는 + 10(년)을 더하고, 급여는 +1000을 더하여
       수정 처리하세요.
       
       날짜데이터 + 1 : 1일이후, *365(*366)
       ADD_MONTH(날짜,추가할 월단위) : 날짜에서 추가할 월 이후 날짜
       **/
	UPDATE EMP10 
	SET sal = sal+1000
	SET hiredate = ADD_MONTHS(hiredate,120)
	WHERE to_char(hiredate,'YYYY')<'2000';
--	WHERE to_number(to_char(hiredate,'YYYY'))<2000;
--	묵시적 형변환 보다는 명시적으로 함수를 기술하는 것이 효과적이다.



/*
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background-color: #FFFF00;
}
</style>
</head>
<body>
	<!-- 
[html]
[하] 1. 캡션이란 무엇이며, 기본 형식과 기본 예제(물건명,가격 등록) 기술하세요.
	캡션이란 
	특정한 요소 객체의 타이틀을 나타내는 label과, 요소 객체를 묶음 단위로 처리하여
	특정한 요소객체의 기능을 명시화하여 연결하는 것을 말한다.
	해당 타이틀을 클릭시, 요소객체로 focusing 된다.
	- 기본 형식
	<label>타이틀부분<요소객체/></label>
	<label for="아이디명">타이틀</label><요소객체 id="아이디명"/>
	
[하] 2. rgb형식의 색상코드값에 대하여 기술하고, css로 body의 배경색상으로 노랑색상(rgb코드값 확인)을 설정해보세요.
	#rrggbb : red, green, blue 3원색을 16진수로 처리하여(0~255)로 각 색상의 
	농도를 설정, 혼합하여 전체 색상을 만들어갈 수 있다.
	 
[중] 3. 배경색상 선택:[color요소객체1], 글자색상 선택:[color요소객체2]로 
       html 해당 페이지의 전체 배경색상과 글자색상을 변경 처리하게 하세요.-->
	<hr>
	배경색 선택
	<input type="color" value="#00BFFF"
		onchange="document.body.style.backgroundColor=this.value"> 글자색
	선택
	<input type="color" value="#00BFFF"
		onchange="document.body.style.color=this.value">
	<hr>
	<!-- 
[하] 4. 날짜와 시간의 기본형식을 기술하세요.
	날짜 시간 정보 처리.
	- 형식
	input type="month|week|date|time|datetime-local" 
	- 속성값
	month : 년/월
	week : 년/년안에 몇번째 주
	date : 년/월/일
	datetiem-local : 년/월/일/오전.오후/시/분/초 100분의 1초
	time : 시/분
	
[하] 5. type의 number와 range의 속성값을 이용하여 물건가격(500~10000로 변경 단계는 500단위 설정 표시),
         중량g(50~1000)를 표기하세요.-->
	물건가격
	<input type="number" max="10000" min="500" step="500" value="500">
	<br> 중량 50g
	<input type="range" min="50" max="1000" value="0" list="gram">1000g
	<datalist id="gram">
		<option value="235" label="low">
		<option value="525" label="midium">
		<option value="765" label="high">
	</datalist>

	<!--[하] 6. fieldset과 legend를 활용하여, login화면을 구성해보세요. -->
	<br>
	<br>
	<form>
		<fieldset>
			<legend>로그인 화면</legend>
			<tr>
				<th>아이디 :</th>
				<td><input type="text" placeholder="아이디를 입력해주세요"></td>
			</tr>
			<br>
			<tr>
				<th>비밀번호 :</th>
				<td><input type="password" maxlength="10"
					placeholder="비밀번호를 입력해주세요"></td>
			</tr>
			<input type="submit" value="로그인">
		</fieldset>
		
	</form>
</body>
</html>



*/