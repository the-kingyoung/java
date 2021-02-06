/*
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	td{text-align:right;}
	.al{text-align:center;}
	table{border-collapse:collapse;}
</style>
</head>
<body>
<!--
1. [하]table의 cell과 두께 관련 속성을 예제를 통해서 기술하세요..
		-cell : 각각 테이블 구성요소로 만들어지는 것을 이 단위로 하여
		cellpadding : 셀안에 있는 글자와 border사이의 간격을 설정해준다.
		cellspacing : 셀과 셀간의 간격을 설정해준다.
		-border : 테두리의 굵기 설정.
	2) bgcolor="배경색"
	
2. [하]css을 사용하는 이유와 테이블 내부 글자의 정렬과 cell을 병합하는 속성과 속성값 기술하세요.
	-테이블 내부 글자의 정렬은 기본속성으로 지원이 되지 않으므로 css를 서언하여 정렬처리한다.
	-cell을 병합하는 속성과 속성값 = border-collapse:collapse;
	
	==>	1) 정렬 처리 : 테이블내의 글자에 대한 정렬은 기본속성으로 지원하지 않기 때문에
				 css을 선언하여 정렬 처리한다.
				 선택자{정렬속성:정렬속성값;}
				 td{test-align:정렬방식;}
		2) border에 대한 1라인 표시
			border-collapse:collapse;
				border의 2라인으로 입체감있게 표현되는 내용을 collapse(병합/붕괴)처리하겠다는 css속성
			border:선의 굵기 형식 색상;
				border가 있는 요소(태그)의 외곽석에 대한 옵션으로 매개값으로 굵기 형식 색상을 지정할 수 있다.
				ex) border:1px solid green;
					굵기를 1px로 형식을 단일라인으로 색상을 green으로 처리
					
3. [중]아래와 같은 테이블을 만드세요.
               성 적 표
    번호    이름   국어  영어  수학  => 타이틀 중앙정렬
     1   홍길동    90   90   70
     2   김길동    80   90   80
     3   신길동    70   80   70
    1) 테이블 전체 한 line표시 
    2) 번호와 이름은 중앙 정렬, 점수는 오른쪽 정렬
    3) 기타 화면상 적절한 색상과 cell간격 설정 통해 데이터 출력 처리.-->
    <h3 align="center">성 적 표</h3>
    <table border="1" width="400" height ="100" bgcolor="pink" align="center" cellpadding="3">
    <col width="15"><col width="40"> <col width="15"> <col width="15"> <col width="15">
    <tr><td class="al">번호</td><td class="al">이름</td><td class="al">국어</td>
    						<td class="al">영어</td><td class="al">수학</td></tr>
    <tr><td>1</td><td class="al">홍길동</td><td>90</td><td>90</td><td>70</td></tr>
    <tr><td>2</td><td class="al">김길동</td><td>80</td><td>90</td><td>80</td></tr>
    <tr><td>3</td><td class="al">신길동</td><td>70</td><td>80</td><td>70</td></tr>
    </table>
<!-- 
4. [하]a 태그의 주요 속성값과 의미를 기술하고, 내부페이지와 외부페이지 이동 예제를 만드세요.
	<a href="이동주소">이동주소이름</href> 하이퍼링크를 생성해주는 태그로 외부 내부의 페이지로 이동이 가능하다.
-->
	<a href="a01_start.html">외부페이지로 이동</a><br>
	<a href="#homework">내부페이지에서 이동</a>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<h4 id="homework">4번문제</h4>
<!--
5. [하]로그인메뉴 클릭시 로그인 화면 로딩화면 구현-->
	<a href="login.html">로그인메뉴</a>
<!-- 
6. [중]물품리스트화면과  특정 물품를 클릭시 특정한 상세화면페이지 등 이동 처리하는 화면을 구현해 보세요.
   (frame 사용하지 않음.) 
    번호 물건명  가격  갯수               
    1   사과   3000 2    ==> 클릭시 페이지 이동 ==>      사과 상세정보
    2   바나나  4000 5                                가격  3000
                                                    구매할 갯수  5 
                                                     창닫기 ==> 클릭시 원페이지 이동-->
<h2>물품리스트</h2>
<table border="1" width="200" height="100">
<tr><td>번호</td><td>물건명</td><td>가격</td><td>개수</td></tr>
<tr><td>1</td><td><a href="product_apple.html">사과</a></td><td>3000</td><td>2</td></tr>
<tr><td>2</td><td>바나나</td><td>4000</td><td>5</td></tr>
</table><br>

<!--                                                   
7. [하]frame의 계층 관계에 대하여 간단한 예제로 설명하세요.
	- 브라우저윈도우(parents윈도우)에서 프레임을 출력할때 출력된 프레임은 child윈도우,
	  child윈도우안에 child윈도우가 있다면 그 브라우저 윈도우와의 관계는 top윈도우로 계층구조를 갖고 있다.-->
	  
	  
<!--8. [중]iframe을 이용해서 상단/왼쪽/하단/메인 구조의 메인화면을 만들어 보세요. -->
<h1>iframe 예제</h1>
<iframe href="iframe1.html" width="510" height="100">
</iframe><br>
<iframe href="leftframe.html" width="100" height="500">
</iframe>
<iframe href="rightframe.html" width="400" height="500">
</iframe><br>
<iframe href="iframe2.html" width="510" height="100">
</iframe>

</body>
</html>
===============================================================================================
데이터베이스
1. 	[하]타입변환에서 명시적/묵시적 형변환의 의미를 기술하고, 묵시적 형변환이 일어나는 이유와 해당 예제를
	간단한 코드로 기술하세요.
	-	명시적 형변환은 to_char, to_date처럼 함수를 이용하여 데이터 타입을 명시적으로 변경해주는 것이고
		묵시적 형변환은 함수를 사용해서 데이터 타입을 변경하지 않더라도 자동으로 타입이 변환되는 것을 말한다.*/
	SELECT '25'+25		--to_number('25')이 생략
	FROM dual;
/*
2.	[하]명시적 형변환 3가지의 기본형식과 기본예제를 기술하세요.*/
	SELECT ename, hiredate, to_char(hiredate,'YYYY') "명시적 형변환1"
	FROM emp;

	SELECT to_number('25')+25 "명시적 형변환2"
	FROM dual;

	SELECT sysdate, to_date('2020/12/31 23:59:59','YY/MM/DD HH24:mi:ss') "명시적 형변환3"
	FROM dual;
/*
2. 	[중]매월 첫째주에 입사한 사원의 이름과 년도 입사월과 주,요일을 표기하세요.*/
	SELECT ename,
			to_char(hiredate,'YYYY') 연도,
			to_char(hiredate,'MM') 월,
			to_char(hiredate,'W') 주,
			to_char(hiredate,'DAY') 요일
			FROM emp
			WHERE to_char(hiredate,'W') ='1';

/* 
3. 	[중]입사일을 상/하반기로 나누어서 상반기에 입사한 사람의 이름, 입사월, 상하반기구분으로 출력하세요.*/
	SELECT ename, to_char(hiredate,'MM"월"Q"분기') 상반기
	FROM emp
	WHERE to_char(hiredate,'Q')<=2;

	SELECT ename, to_char(hiredate, 'MM') 입사월,
		decode(to_char(hiredate,'Q'),'1','상반기','2','상반기','하반기')
	FROM emp;
	
	SELECT ename, to_char(hiredate,'MM')입사월,
			floor(to_number(to_char(hiredate,'Q')))
			
			
	SELECT ename, to_char(hiredate,'MM') 입사월
   	FROM EMP e
    WHERE to_number( to_char(hiredate,'Q') ) < 3;
   
   	SELECT ename, to_char(hiredate,'MM') 입사월,
         floor(to_number(to_char(hiredate,'Q'))/3) "상하반기 구분"
   	FROM emp
	WHERE to_number( to_char(hiredate,'Q') ) < 3;
  --to_char(hiredate,'Q') : 1~4 문자열
  --to_number()/3 : 숫자로 전환해서 1,2:소수점이하. 	3,4: 1이상
  --floor() 소수점이하 제거. 1,2==>0  3,4==>1
--   WHERE to_number( to_char(hiredate,'Q') ) < 3;

   SELECT ename, to_char(hiredate,'MM') 입사월,
         decode( floor(to_number(to_char(hiredate,'Q'))/3),0,'상반기','하반기') "상하반기구분"
   FROM emp;
  --decode(특정데이터,1번째경우,1번째경우 처리할 데이터, 2번째경우, 2번째경우 처리할 데이터, 그외 처리할 데이터)
   --WHERE to_number( to_char(hiredate,'Q') ) < 3; 

/*
4. 	[하]시간의 문자열 형식을 나열하고, 입사일을 기준으로 @@@@년 @@월 @@일 @@시@@분@@초 형식으로 입사일
   	표기하세요.*/
	SELECT ename, hiredate, to_char(hiredate,'YYYY"년 "MM"월 "DD"일 "HH24"시 "mi"분 "ss"초"') 입사일
	FROM emp;
/*
5. 	[중] emp03 복사테이블을 만들고 각분기별로 입사한 사원정보를 시간까지 입력하여 등록하고, 
    YYYY/MM/DD일 @@/4분기에 @@요일 @@:@@:@@ 입사 형식으로 출력하세요.
    1) 복사테이블 만들기
   	2) 입사한 사원정보 시간 입력
   	3) 형식 맞게 조회
    
    **/
CREATE TABLE emp03
AS SELECT * FROM emp;
SELECT * FROM emp03;
INSERT INTO emp03(ename,hiredate)
	values('홍길동',to_date('2021-01-05 09:00:04','YYYY-MM-DD HH24:mi:ss'));
INSERT INTO emp03(ename,hiredate)
	values('신길동',to_date('2021-04-09 09:03:07','YYYY-MM-DD HH24:mi:ss'));
INSERT INTO emp03(ename,hiredate)
	values('김길동',to_date('2021-08-18 08:58:32','YYYY-MM-DD HH24:mi:ss'));
INSERT INTO emp03(ename,hiredate)
	values('홍길동',to_date('2021-11-25 10:18:18','YYYY-MM-DD HH24:mi:ss'));

SELECT ename, to_char(hiredate,'YYYY/MM/DD" "Q"/4분기 "DAY", "HH24:mi:ss')
FROM emp03;