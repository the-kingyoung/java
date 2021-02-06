/*
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Homework 1223</title>
</head>
<body>
<!-- 
html
1. 	텍스트를 변경하는 코드에서 계층적 적용이라는 말의 의미를 설명하고, 
	이택릭체로 진하게 처리하는 안녕하세요 코드를 만들어 출력해보세요.-->
	계층적 적용이란? html의 고유 성격으로 상위 태그시작 하위 태그 시작 하위 태그 종료 상위 태그종료.
	
	<b>
		<i>안녕하세요</i>
	</b><br>계층적으로 부모/자식 관계로 설정되는 것을 말한다~
	<hr>
<!--
2. 	텍스트 꾸미기 코드의 사선과 언더라인, 첨자에 관련하여 기술하세요.
	==>텍스트 꾸미기 코드는 태그 자체 내에 코드를 랜더링할 때, 지원되는 특성을 말한다.
	b : 굵기, strong : 진하기, i : 이탤릭, del : 취소선, ins : 추가됨, sup : 윗첨자, sub : 아래첨자,
	mark : 하이라이트
	<br>
	<del>사선(취소선)</del>
	<ins>언더라인처리</ins>
	보통글자<sup>윗첨자</sup>
	보통글자<sub>아랫첨자</sub>
	
	사선 : 글씨 중앙에 밑줄이 그어지는것
	언더라인 : 글씨 하단에 밑줄이 그어지는것
	첨자 : 기본 글자보다 작은 글자가 위에 붙거나 아래 붙게 하는것
	
3. 	블럭과 인라인 태그의 의미와 코드를 분류하여 기술하고, 해당 내용에 간단한 예제를 만드세요.
	
	- 태그는 줄바꿈을 하는지 안하는지로 구분을 할 수 있다.
		1) 블록 태그 : p, h1, div, ul		==>태그를 사용하고 난 뒤에 줄바꿈이 일어난다.
		2) 인라인 태그 : 텍스트 꾸미기 관련 태그, a, img, span ==>태그를 사용하고 난 뒤에 줄바꿈이 일어나지않는다.
		<h1>블럭의 대표적인 예제</h1>
		<a href="www.naver.com">네이버 이동()</a>

4. 	이미지의 기본 속성을 기술하고, 좋아하는 애완 동물의 사진을 출력하는 코드를 작성하세요.-->
	이미지 기본 속성
	1. src : 이미지 경로를 설정..
	2. width : 이미지의 넓이 지정
	3. height : 이미지의 폭을 지정
	4. alt : alternative 이미지가 해당 경로에 없을 때, 지정된 문자열을 출력하는 내용
	<img title="하치" src="hachi1.jpg" width=150; height=200;>

<!--
5. 	웹에서 상대적 경로와 절대적 경로/외부 페이지의 차이를 기본적인 예제를 통하여 설명하세요.
	-이부분 다시 한번 설명 듣기.
	==>상대경로 : 현재페이지(a02_1223.html)를 기준으로 호출하는 파일(이미지, 내부서버의 페이지, 다운할 파일)을
				설정하는 것을 말한다.
				1) 현재페이지와 같은 폴드에 있을 때는 해당 파일명 그대로 활용하여도 된다.
					ex) a00_exp폴드에 퍼피01.png파일이 있으면 같은 경로로 사용할 수 있다.
						<img src="퍼피01"/>
				2) 현재페이지가 있는 폴드 하위에 폴드를 만들어 파일을 호출할 때..
				   폴드명/파일명으로 호출할 수 있다.
					ex)<img src="img(파일명)/Elvispresley.png"/>
				3) 현재페이지(a02_1223.html)와 다른 폴드 접근
					.. : 상위 계층의 폴드를 접근
					/폴드명 : 해당 폴드로 접근..
					  ../z02_img/퍼피03.png
					  현재폴드에서 상위폴드인 webcontent에 가서, 그 하위에 있는 z02_img폴드에 있는
					  퍼피03.png 파일 호출
					ex) <img src="../z02_img/퍼피03.png"/>
	==>절대경로 : 웹에서 tomcat was와 연동하여 실행하면 프로젝트명/에 해당하는 default경로가
				javaexp\WebContent하위와 연결되어 있어,
				http://localhost:7080/javaexp/ 경로와 동일하다.
				http://localhost:7080 이 부분은 소스에서 생략이 가능하다.
				
				http://localhost:7080/z01_img\banana.png
				javaexp\WebContent/z01_img\banana.png
				
				<img src="/javaexp/z01_img\banana.png"/>
				/프로젝트명/하위 기본 경로에서 z01_img\banana.png를 접근하여 호출할 수 있다.
			
				웹프로그램 소스에서는 소스마다 접근방식을 다르게 하고 있다.
				각 폴드마다 특별한 기능을 가진 폴드를 분류를 해놓고 사용하고 있다.
				ex) java소스 저장폴드, 설정파일, 컴파일된 파일, 웹화면을 출력할 파일폴드
				htm1, css,이미지 파일 (jsp)을 기본폴드에서 접근하게 설정하는 그것이 WebContent폴드이다.
				화면에 보여주는 부분을 특정하게 설정해서 처리하게끔 했다.
-->

  <h2>상대 경로</h2>
  <img src="hachi1.jpg" width="150" height="200">

  <h2>절대 경로</h2>
  <img src="/javaexp/a02_html/hachi1.jpg"width="150" height="200"/>
  
  외부파일링크
  로컬 서버 피씨로 서버 http://localhost:7080/javaexp/z01_img\banana.png로
  웹서버를 통해 설정한것은 목적 자체가 외부에서 이 페이지를 호출하기 위한 목적이기 때문에,
  localhost라는 곳에 ip주소나 domain주소를 넣으면 네트워크 상 다른 클라이언트가 접근이 가능하다.

<!-- 
6. 	간단한 맛집 투어라는 홈페이지를 h1, p, hr, img를 이용해서 나타내세요. img는 외부페이지 링크를 통해서 처리하세요.
h1 맛집 투어
p 문단처리..
img src="외부음식관련이미지링크"
-->
<h1>간단한 수원 맛집 투어!</h1>
<img src ="https://post-phinf.pstatic.net/MjAxNzA1MDhfMTg0/MDAxNDk0MjIwMzQyMTc2.HotRR6xQiai-Alz2o8fU69Eezr_WZV71HAMMK6M6E6cg.om8WyYPIV5iuFzjAH4fRrTECxieXsPtbGGDTxabP0Qkg.JPEG/0.jpg?type=w1200"width="200" height="200">
<p>
1. 수원 통닭거리 치킨!<br>
2. 수원 왕갈비!</p>
<!--
7. 	ul/ol/dt의 차이점과 속성을 기술하세요.
	ul : unordered line의 줄임말로 순서가 아닌 모양으로 나타낸 리스트
		1) type="disc/circle/square/none"
			disc : 디스크판 모양으로 원이 꽉찬 모양
			circle : 원모양 테두리
			square : 사각형 모양
			none : 아무것도 없음
	ol : ordered line의 줄임말로 숫자 또는 알파벳으로 순서를 나타낸 리스트
	dl : definition list의 줄임말로 <dt><dd>로 이루어진 계층을 갖는 리스트
	
8. 	계층형으로 취미 생활을 종류/타이틀을 넣고, 경험 내용을 ul, ol, dt를 이용하여 계층형으로 처리하는 페이지를 만드세요. -->
	<br>
	<h3>취미 생활</h3>
	<hr>
	<ul>
		<li>야구 경기 시청
			<ol>
				<li>LG경기 있을때 tv중계보기</li>
				<li>KT경기 있을때 tv중계보기</li>
				<li>KT 홈경기를 LG랑 할 때 직관 가기</li>
			</ol>	
		<li>피아노 치기
			<ol>
				<li>쇼팽곡 끄적거리기</li>
				<li>모차르트 곡 치기</li>
				<li>리스트 곡 끄적거리기</li>
			</ol>
		<li>축구 하기
			<ol>
				<li>2주에 한번씩 풋살</li>
				<li>조기축구회 나가기</li>
			</ol>
	</ul>
	<hr>
	<dl>
		<dt><strong>취미생활을 잘 즐기고 있는가?</strong>
		<dd>코로나로 인해 피아노 치는것만이 유일하게 허락된 취미 생활이다.
	</dl>
</body>
</html>

-----------------------------------------------------
database

--1. 부서 10과 30에 속하는 모든 사원의 이름과 부서번호를 이름과 알파벳 순으로 정렬되도록 질의문을 만드세요.*/
SELECT ename, deptno
FROM EMP e 
WHERE deptno IN (10,30)
ORDER BY ename ;
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
/*4. like 키워드에서 %, _ 의미를 기술하고 간단한 예제를 만드세요.
		- % = 기준 데이터 값 외에 값의 위치를 나타낸다.
		- _ = 찾고자하는 데이터의 자릿수를 나타낸다. 
*/
SELECT * FROM emp WHERE ename LIKE 'A%';
SELECT * FROM emp WHERE job LIKE '___E%';
--5. 가장 최근에 입사한 사원의 이름과 입사일을 출력하세요(in subquery구문 활용)
SELECT ename, hiredate
FROM emp 
WHERE HIREDATE in(SELECT max(HIREDATE) FROM emp);










