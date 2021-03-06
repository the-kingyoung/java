/*데이터베이스

[하] 1. case문의 기본 형식을 기술하세요.
	
	select 컬럼
		case[컬럼명]
		when 논리|산술|관계 then 처리할 데이터
		when 논리|산술|관계 then 처리할 데이터
		else 기타 처리할 데이터
		end 컬럼명
	from 테이블명
	
	select 컬럼
		case[컬럼명]
		when 데이터1 then 처리할 데이터
		when 데이터2 then 처리할 데이터
		else 기타 처리할 데이터
		end 컬럼명
	from 테이블명
	
[하] 2. job에 따른 인턴기간을 다르게 설정하였다고 한다.
    사원별 인턴기간의 만료일을 입사일과 인턴기간의 만료일을 설정하세요.*/
SELECT * FROM emp;
	SELECT job, sysdate 입사일,
	CASE WHEN job='CLERK' THEN sysdate+30
		 WHEN job='SALESMAN' THEN sysdate+60
		 WHEN job='ANALYLIST' THEN sysdate+150
		 WHEN job='MANAGER' THEN sysdate+120
		 WHEN job='PRESIDENT' THEN sysdate+180
	END "인턴 만료일" 
	FROM emp;


SELECT ENAME 사원명, JOB 직업, HIREDATE 입사일,
	CASE JOB 
	WHEN 'CLERK' THEN ADD_MONTHS(HIREDATE, 1)
  	WHEN 'SALESMAN' THEN ADD_MONTHS(HIREDATE, 2)
  	WHEN 'MANAGER' THEN ADD_MONTHS(HIREDATE, 4)
  	WHEN 'ANALYST' THEN ADD_MONTHS(HIREDATE, 5)
  	WHEN 'PRESIDENT' THEN ADD_MONTHS(HIREDATE, 6)
   END AS 인턴만료일
  FROM EMP;
 
 	SELECT ename, job,hiredate,
	CASE job
		 WHEN 'CLERK' THEN 1
		 WHEN 'SALESMAN' THEN 2
		 WHEN 'ANALYLIST' THEN 5
		 WHEN 'MANAGER' THEN 4
		 WHEN 'PRESIDENT' THEN 6
		 ELSE 0
	END "개월",
	ADD_MONTHS(HIREDATE,CASE job 
		 				WHEN 'CLERK' THEN 1
		 				WHEN 'SALESMAN' THEN 2
		 				WHEN 'ANALYLIST' THEN 5
		 				WHEN 'MANAGER' THEN 4
		 				WHEN 'PRESIDENT' THEN 6
		 				else 0 end) 인턴만료일
	FROM emp;
 
/*
[중] 3. sal등급을 만들고 0~999,1000~1999,.... 등급별 인원수를 group 함수를 통해 처리하세요.
*/

	SELECT 
	CASE WHEN floor(sal/1000)=1 THEN 'F등급'
		 WHEN floor(sal/1000)=2 THEN 'D등급'
		 WHEN floor(sal/1000)=3 THEN 'C등급'
		 WHEN floor(sal/1000)=4 THEN 'B등급'
		 ELSE 'A등급'
		 END "등급",
		 COUNT(*)
	FROM emp
	GROUP BY floor(sal/1000)
	ORDER BY floor(sal/1000);

SELECT decode(floor(sal/1000),5,'A',4,'B',3,'C',2,'D',1,'E','F')등급, count(*) 인원수
FROM emp
GROUP BY floor(sal/1000)
ORDER BY floor(sal/1000);


/*
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- html
[하] 1. 시맨틱 태그를 활용하는 이유와 주요 시맨틱 태그의 의미를 기술하세요.
`		1) 문서의 구조와 의미를 전달하는 태그
		header, section, article, main, summary, mark, time
		
		2) 시맨틱 태그의 의미
		header - 페이지나 섹션의 머리말 표현, 페이지 제목, 페이지 소개하는 간단한 설명
		nav	- 	하이퍼링크들을 모아놓은 특별한 섹션
				페이지 내 목차를 만드는 용도
		section - 문서의 장 혹은 절을 구성하는 역할, 일반 문서에 여러 장이 있듯이 웹 페이지에 여러 section 가능
				  헤딩 태그(h1-h6)를 사용하여 절 혹은 섹션의 주제 기입
		article - 본문과 연관 있지만, 독립적인 컨텐츠 담는 영역
				  보조 기사, 블로그 포스트, 댓글 등 기타 독립적인 내용을 담는다.
				  article에 담는 내용이 많은 경우 여러 section을 둘 수 있음.
		aside - 본문에 약간 벗어난 노트나 팁
				신문. 잡지에서 주요 기사 옆 관련 기사, 삽입 어구로 표시된 논평 등
				페이지 오른쪽이나 왼쪽에 주로 배치
		footer - 꼬리말 영역, 주로 저자나 저작권 정보
[하] 2. 아래 내용을 시맨틱 태그로 변경 처리하세요.-->
	<div>
		<header>
			<h1>
				<a href="https://www.facebook.com/elvis">Elvis Presley</a>
			</h1>
		</header>


		<section>
			<article>
				<h2>
					<a href="https://ko.wikipedia.org/wiki/엘비스_프레슬리"> Who is Elvis?</a>
				</h2>
				<div class="entry">
					<p>엘비스 프레슬리는 20세기 가장 잘 알려진 미국 가수 중 한 명이었다. 하나의 문화 아이콘으로, 엘비스의
						음악들은 세계적으로 선풍적인 인기를 끌었으며 "로큰롤의 제왕"으로 불리곤한다. 그는 미시시피 주의 투펄로에서 태어났다.</p>
				</div>
			</article>
			<article>
				<h2>
					<a href="http://www.biography.com/people/elvis-presley-9446466">
						His music and life</a>
				</h2>

				<div class="entry">
					<p>Presley received his first guitar as a gift from his mother
						on his 11th birthday in 1946 and had his first taste of musical
						success a few years later when he won a talent show at Humes High
						School in Memphis.</p>
				</div>
			</article>

			<aside>
				<a href="">&laquo; Previous Entries</a>
			</aside>
		</section>

		<nav>
			<ul>
				<li><h2>Archives</h2>
					<ul>
						<li><a href="http://www.elvisthemusic.com/">Elvis The
								Music</a></li>
						<li><a href="http://www.graceland.com/">Elvis Home
								Graceland</a></li>
						<li><a href="http://www.last.fm/music/Elvis+Presley">Free
								Listening, Video</a></li>
					</ul></li>
			</ul>
		</nav>
		<footer>
			<p>Copyright 2015 Elvis</p>
		</footer>
</body>
</html>*/