/*
[데이터베이스]
[하] 1. 직책별로 급여가 가장 많은 사람과 가장 적은 사람을 출력하세요*/
SELECT job, min(sal), max(sal)
FROM emp
GROUP BY job
ORDER BY job;
--쿼리1 union all 쿼리2 : 쿼리1과 쿼리2를 순차적으로 출력
SELECT *
FROM EMP
WHERE (job, sal) 
in(SELECT job, max(sal) sal
FROM EMP
GROUP BY job)
UNION ALL 
SELECT *
FROM emp
WHERE (job, sal)
in(SELECT job, min(sal) sal
FROM emp
GROUP BY job);

--[중] 2. 월별로 평균 급여(소수점 1자리 반올림)를 출력하세요.(월별정렬)
--to_char(hiredate,'MM') : hiredate 입사일 중에서 월을 추출
-- 추출한 월을 기준으로 group by 처리하면 월별 avg(sal) 그룹함수 용해서 평균 출력
SELECT to_char(hiredate,'MM') 월, round(avg(sal),1) 평균급여
FROM emp
GROUP BY to_char(hiredate,'MM')
order BY to_char(hiredate,'MM');

--[중] 3. 직책별로 근무일수가 가장 오래된 사원의 직책, 이름, 입사일을 출력(직책으로 정렬)하세요
SELECT job 직책, ename 이름, hiredate 입사일
FROM EMP e 
WHERE (job, hiredate) 
		in(	SELECT job, MIN(hiredate)
			FROM emp
			GROUP BY job )
ORDER BY job;
--해당 데이터가 단일 데이터일 경우 대입연산자를 활용한다.


/*[하] 4. rollup와 cube의 차이점을 기본예제를 통해서 기술하세요.
# rollup
==> 각각의 상위 항목별 통계치와 전체 통계치를 처리할때 rollup을 활용한다

- group by절과 같이 사용되며, group by절에 의해서 그룹 지어진 집합 결과에 대해서
	좀 더 상세한 정보를 반환하는 기능을 수행한다.
- 그룹데이터와 데이터의 총계를 구할 수 있다.
# cube
- rollup에서 전체데이터 summary 기능을 포함할 때 활용된다.*/
SELECT deptno, job, sum(sal)"합계", count(*)"데이터건수"
FROM emp
GROUP BY ROLLUP(deptno, job)
ORDER BY deptno, job;

SELECT deptno, job, sum(sal)"합계", count(*)"데이터건수"
FROM emp
GROUP BY CUBE(deptno, job)
ORDER BY deptno, job;

/*[하] 5. 조인이란 무엇인가? 개념과 기본형식을 기술하세요.
# 조인이란 ?
- 하나의 sql명령문에 의해 여러 테이블에 저장된 데이터를 한번에 조회할 수 있는 기능을 말한다.
- 두개 테이블에서 공통되는 컬럼을 기준으로 조건문을 만들어 조인을 한다.
- 기본형식
	select 테이블별칭.컬럼명, 테이블별칭.컬럼명	...
	from 테이블1 별칭, 테이블2 별칭
	where 별칭.공통컬럼 = 별칭.공통컬럼 */
SELECT e.*,d.*
FROM emp e, DEPT d 
WHERE e.DEPTNO =d.DEPTNO;

--[하] 6. 급여가 3000~4000 사이에 있는 부서명과 사원명,급여를 출력하세요.
SELECT dname, ename, sal
FROM DEPT d, emp e
WHERE d.DEPTNO = e.deptno
AND sal BETWEEN 3000 AND 4000;
--between 범위를 지정해서 사이에 in 범위가 아니고 특정한 데이터 지정해서 호출

--[하] 7. 부서위치가 DALLAS인 사원정보를 출력하세요.
SELECT dname, sal
FROM EMP e, DEPT d
WHERE e.DEPTNO = d.DEPTNO
AND loc='DALLAS';

--[하] 8. natural join과 일반 where문에 의한 조인을 차이점을 기술하세요. 
--	두형식 테이블에서 join하는 컬럼명을 지정하는 부분에 있어서, 명시성과 내부적 자동 조인처리에서 차이가 난다.
--	natural join은 foregin key 관계(제약키에서 언급)에 있으면 
--	자동으로 해당 칼럼을 명시적으로 지정하지 않더라도 join이 된다
SELECT *
FROM emp NATURAL JOIN dept;
SELECT *
FROM EMP e, DEPT d
WHERE e.deptno = d.deptno;


--[하] 9. non equi join에 대하여 emp, salgrade를 활용하여 설명하세요.
SELECT ename, sal, grade
FROM EMP e ,SALGRADE s 
WHERE sal BETWEEN losal AND hisal;

--[하]10. outer join과 일반 공통 컬럼 join과의 차이점을 기술하세요.
--데이터의 존재여부에 상관없이 조인하여 현재 부서번에 따른 할당 내용을 확인하고자 outer join을 활용한다
/*
두개의 테이블 관계에 있어서, 공통되는 컬럼에 연결되는 데이터가 없을 때라도 데이터를 출력하고자 할 때 사용된다.
where 테이블명.공통컬럼=테이블명.공통컬럼(+)
해당 정보가 없는 컬럼에 (+)기호를 붙인다.
emp와 dept관계에 있어서 dept의 모든 데이터가 emp에 없을지라도 아웃조인을 통해서 처리할 수 있다.
 */

/*
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
[하] 1. 시맨틱 태그 중에 figure태그에 대하여 기본예제(css란?-기본형식 표현)를 통해 간략하게 설명하세요.
		=>본문에 삽입하는 소스코드, 사진, 차트 등에 내용과 설명으로 표현할 때 사용된다-->
	<h3>예제 1번</h3>
	<hr>
	<figure>
		<figcaption>CSS란?</figcaption>
		<pre>
 	<code>body { background-color : linen; color : green;
            	margin-left : 40px; margin-right : 40px;}
 	
		</pre>
		<hr>
		<mark>실행결과</mark>
		<pre>
 		<img src="캡쳐.png" alt="실행결과">
 	</pre>
	</figure>
	<hr>
	<!--
[하] 2. details 태그를 통해서, 많이 하는 질문이라는 코너를 처리하세요.-->
	<h3>예제2번</h3>
	<hr>
	<details>
		<summary>많이 하는 질문1</summary>
		<p>이름이 뭡니까</p>
	</details>
	<details>
		<summary>많이 하는 질문2</summary>
		<p>나이가 어떻게 되십니까</p>
	</details>
	<hr>
<!-- 
[하] 3. 인라인 시맨틱 태그의 종류와 속성값에 대하여 구체적으로 기술하세요.
	- 태그를 통해서 의미와 기능을 가지고 있으며, 블럭형식(줄바꿈)을 가지지 않는 태그를 말한다.
	- mark : 중요 텍스트 표시(노랑색 배경색),
	  time : 시간 처리 표시(의미 시맨틱),
	  meter : 주어진 범위나 %로 스크롤 표기,
			- 브라우저 호환성에 영향을 받아 특정한 경우에  text로만 보이는 경우가 있음.
	  progress : 작업의 진행 정도를 전체 값 대비 현재 value로 표기 한다.
			   - 일반적으로 진행도 나타내는데 많이 쓰임(동적)-->

<!-- 
[하] 4. form의 속성과 하위에 태그의 기능에 대하여 기술하세요.
		속성 type에 따라 입력되는 형식에 차이가 있음.
		1) text : 기본 문자열 입력
		2) password : 패스워드 형식 입력
		3) submit : 버튼모양으로 해당 내용을 클릭하는 순간, form에서 
			지정하는 페이지로 입력된 데이터를 전송한다.
			
[하] 5. 하위 태그 중에 input type="submit"는 어떤 기능을 하는가?
		- 버튼모양으로 해당 내용을 클릭하는 순간, form에서 
		  지정하는 페이지로 입력된 데이터를 전송한다.
			
[중] 6. form 태그와 하위에 input을 이용하여 로그인화면을 만들고,
        로그인 클릭시, result.jsp에
        id=himan&pass=7777 형식으로 전달되게 하세요.
        로그인페이지(login.html), 결과페이지(result.jsp)
        
        http://localhost:8080/javaexp/homework/result.jsp?id=himan&pass=7777
        -->
        
        <form name="fo" method="get" action="result.jsp">
        
        사용자 ID :	<input type="text" name="id" size="10" value=""><br>
		비밀 번호 	: 	<input type="password" name="pass" size="15" value="">
					<input type="submit" value="로그인">
        
<!--        
[하] 7. input태그와 textarea의 기본 속성들을 기술하세요.
		-1) input 태그
				- type : text, password, submit
				- name
				- size : 화면에 보여지는 크기 설정
				- maxlength : 실제 문자열의 길이 설정
				- value : 초기 값 설정
		 	2) textarea tage : 여러줄 입력
		 		- cols : 열 크기 설정
		 		- rows : 행 크기 설정
		 		
[중] 8. 위 form의 input/textarea를 이용해서 아래와 같은 구매물품 명세서를
        작성해보세요
        구매 물품 명세서
        물품명:[     ]
        가격 :[     ]
        갯수 :[     ]
        기타요청사항
        [다중입력textarea]
           [등 록]-->

		<h3>구매 물품 명세서</h3>
		<hr>
		<form>
			물품명 : <input type="text" value="" size="2" maxlength="5"><br>
			가격 : <input type="text" value="" size="4" maxlength="4"><br>
			갯수 : <input type="text" value="" size="4" maxlength="3"><br>
		</form>
		<form>
		<h3>기타 요청 사항</h3>
			<textarea cols="20" rows="5">기타요청사항을 적어주세요.</textarea><br>
			<input type="submit" value="등록">
		</form></body>
</html>
*/