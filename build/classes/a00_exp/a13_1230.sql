/* 		````	
데이터베이스
[하]1. nvl2, nullif의 기본형식을 예제를 통해 기술하세요*/
	--nvl2(데이터, null아닐때 처리할 데이터, null일때 처리할 데이터)
		SELECT comm,nvl2(comm,comm+100,100) FROM emp;
	/*nullif(데이터1, 데이터2)
		두개의 매개변수로 받는 데이터를 비교하여 동일하면 null을 반환하고, 
		동일하지 않으면 첫번째 데이터1을 반환처리하는 함수를 말한다.*/
	SELECT nullif('a','a') FROM dual;
	SELECT nullif('a','b') FROM dual;
/*
[중]2. deptno가 30이면 보너스는 100%, 그외에는 deptno로 보너스를 처리하고자 한다.
      이름, 부서번호, 보너스(%), 보너스 를 출력하세요*/
SELECT 	ename, deptno, 
		nvl2(NULLIF(deptno,30),deptno,100)||'%' "보너스(%)",
		nvl(NULLIF(deptno,30),100)||'%' "보너스(%)",
		sal*nvl2(NULLIF(deptno,30),deptno,100)/100 "보너스"
FROM	emp;
/*
[하]3. decode함수의 기본형식을 예제를 통해 기술하세요.
		decode(기준이 되는 데이터,	case1, case1일때 처리할 데이터,
								case2, case2일때 처리할 데이터,
								case3, case3일때 처리할 데이터,	 
						   위 내용에 해당하지 않을 때 처리할 데이터)*/
SELECT 	ename, job, 
		decode(job,'CLERK','사무원',
				'SALESMAN','영업원',
				'MANAGER','매니저','대통령') "한글직업"
FROM emp;
/*
[중]4. hiredate기준  상반기(1~6), 하반기(7~12) 하여 sal 기준으로 보너스를 100%, 200%
      처리하고자 한다. 중첩함수 이용해서 출력하세요
      사원명, 상/하반기구분(보너스%), 급여, 보너스 */
SELECT 	ename, to_char(hiredate,'q') "분기",
		decode(to_char(hiredate,'q'),1,100,2,100,200)||'%' "상/하반기(보너스)",
		sal, (sal*decode(to_char(hiredate,'q'),1,100,2,100,200)/100) "보너스"
FROM emp;
/*
[하]5. sal를 기준으로 5000이상 A등급, 4000이상 B등급, 3000이상 C등급, 2000이상 D등급, 
      1000이상 E등급, 1000미만 F등급으로 급여등급표기하세요
      사원명, 급여, 등급*/
	SELECT ename, sal,decode(sal,mod(sal,1000),'F등급',
						  		 mod(sal,2000),'E등급',
						  		 mod(sal,3000),'D등급',
						  		 mod(sal,4000),'C등급',
						  		 mod(sal,5000),'B등급',
						  		 'A등급') "등급"
	FROM emp;

SELECT ename, sal, floor(sal/1000),
		decode(floor(sal/1000),5,'A등급',4,'B등급',3,'C등급',2,'D등급',1,'E등급','F등급') "등급"
		FROM emp;

/*
html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
html
[하]1. a 태그에 target속성에 있어서 속성값에 대한 연관관계를 간단한 예제로 설명하세요.
1. target="right"을 설정하면 상단에 선언되 <iframe의 name="right">에 mapping된 frame이 변경이 된다
2. _self: 현재 페이지 변경	: 현재 프레임이 변경
3. _top	: 최상위 윈도우 변경: 이 프레임으로 포함하고 있는 페이지 전체가 변경
4. _blank: 새 창에서 해당 페이지 로딩
 -->
	<a href="http://www.w3c.org" target="right">W3C</a><br>
	<a href="http://www.etnews.com" target="_self">전자신문</a><br>
	<a href="http://www.mk.co.kr" target="_top">매일경제신문</a><br>
	<a href="http://www.w3c.org" target="_blank">새창에W3C</a><br>
	<!-- 
[하]2. 비디오/오디오 관련 속성을 기본 예제와 함께 설명하세요.-->
	<br>
	<video id="vi" src="media/bear.mp4" width="320" height="240" 
	controls autoplay="autolay" muted="muted"> 브라우저가 video 태그를 지원하지 않습니다.
	</video>
	<br>
	<audio src="media/EmbraceableYou.mp3" controls autoplay="autoplay" loop>
		브라우저가 audio 태그를 지원하지 않습니다.
	</audio><br><br><br><br><br>
<!--
[중]3. 프로젝트형 과제의 메인화면을 iframe으로 구성하여 link 이동까지 처리해보세요.-->
	<iframe src="pre2.html" width="200" height="200"></iframe>
	<iframe src="pre1.html" width="100%" height="200"></iframe>

</body>
<script type="text/javascript">
	document.querySelector("audio").play();
	document.querySelector("#id").play();
</script>
</html>
*/