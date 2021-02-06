/*# 주간정리과제
1. 컬럼과 테이블의 별칭에 대하여 예제를 통해서 기술하세요.*/
SELECT empno AS 사원번호, ename AS 사원이름 
FROM emp e;
SELECT * FROM emp;
==>
칼럼명의 별칭은 데이터 리스트 상단에 컬럼명으로 표기,
특수문자나 공백을 사용할 때는  ""사이에 입력하여 처리한다.
cf) 추후 데이터 연결시 중요한 컬럼지칭명으로 사용된다.
테이블 별칭은 다른 테이블과 중복적으로 조인시 활용되고,
전체 테이블의 컬럼에서 추가적인 컬럼을 처리할 때, 활용된다.
ex) SELECT a.*,nvl(comm,0)+sal "총계"
FROM emp a

SELECT 컬럼명 별칭
FROM 테이블 별칭

SELECT a.*, empno AS NO, ename name, job "직 책"
FROM emp a;

SELECT * FROM emp;
/*
2. 아래의 형식으로 emp 테이블을 출력하세요.
    사원명(사원번호)의 급여는 @@, 보너스는 @@ 합계 @@ 이다.*/
SELECT ename||'('||empno||')의 급여는 '||sal||', 보너스는'||nvl(comm,0)||', 합계 '||(sal+nvl(comm,0))||'이다.'
FROM emp;
/*
3. sql 명령문의 표준 형식을 간단한 예제를 통해서 설명하세요.*/
SELECT 컬럼명, 그룹함수()
FROM 테이블명
WHERE 조건(비교연산자/논리연산자)
GROUP BY 그룹처리할 컬럼명
HAVING 그룹함수()의 결과를 기준으로 (비교/논리연산자)
ORDER BY 컬럼명 asc(디폴트로 오름 차순), desc(내림 차순 정렬)
ex) SELECT deptno, avg(sal) savg	--부서 번호 별 평균 급여
	FROM emp
	WHERE deptno >=20	--부서번호 20 이상인 것
	GROUP BY DEPTNO 	--부서번호를 그룹함수로 처리
	HAVING savg>=2000	--avg(sal)사용 가능, 그룹함수가 적용된 부분은 where검색 불가능
	ORDER DEPTNO DESC;
/*
4. sql에서 null이란 무엇을 의미하는지 기술하고, null인 컬럼과 그렇지 않는 컬럼을 구분하세요.
null이란 데이터가 할당되어 있지 않은 경우를 뜻한다.*/
SELECT COMM,ename
FROM EMP ;

--null이란 특정 테이블의 컬럼에 데이터가 할당되지 않는 것을 말한다.
--cf) 이렇게 null으로 된 내용을 프로그래밍(java)에서 호출을 하면 숫자형 데이터는 0으로 처리되고
--	  String(문자열)로 된 데이터만 null로 할당되어 사용한다.
--	  데이터베이스에서는 숫자나 문자열 상관없이 null입력/출력.
SELECT * FROM emp
WHERE comm IS NULL; --comm이 null데이터를 로딩할때 활용한다.
/*
5. sql의 논리연산자와 비교연산자를 구분하여 기술하세요.(?)
		비교연산자 : =,!=,<>,<,<=,>,>=(연산자)
		논리연산자 : and, or, not
		
		==> sql 구문으로는 where 문과 having에서 활용한다.
		논리연산자(true/false)로 처리되는 구문. (=,!=,<>,<,<=,>,>=)
		논리연산자를 and, or로 연결할 것을 비교연산자. (조건1 and 조건2, 조건1 or 조건2)
		추가하여 not 연산자, between and, is null, in 구문을 활용하여
		조건문에 사용된다.
6. 데이터베이스에서 사용하는 데이터 타입의 종류를 기술하세요.
	-	char(size) : 고정 길이 문자 데이터 타입. 최대 2000바이트
		ex) char(5) 데이터 'a'할당되면 'a    '뒤에는 공백이 할당되어 크기를 동일하게 설정한다.

		varchar2(size) : 	가변 길이 문자 데이터 타입. 최대 4000바이트로 최대 크기를 설정하기에 
							그보다 작은 데이터 할당 시 효율적이다.

		number(p,s) : 정밀도(p)와 스케일(s)로 표현되는 숫자 데이터 타입, 전체크기 소수점 이하 크기 지정.
		
		date : 날짜/시간을 입력할 수 있는 데이터 유형
		timestamp(n) : date형의 확장 형태로 n millisecond로 세부적인 시간까지 처리해준다.
		blob : 대용량 바이너리 데이터(일반 파일, 이미지 등등)를 데이터 유형으로 할당 최대 4gb
		clob : 대용량 텍스트 데이터 할당. 최대 4gb
		bfile : 대용량의 파일형 데이터를 파일형으로 저장하기 위한 데이터 타입 최대 4gb
		rowid : 테이블 내 행의 고유 주소를 가지는 64진수 문자 유형

7. 위 데이터 타입을 이용하여 
    학번, 이름, 전공, 주소, 학년, 입학일 의  테이블을 구성하고, 데이터를 입력하세요.*/
CREATE TABLE univ(
	stnum NUMBER,
	name varchar2(20),
	major varchar2(20),
	address varchar2(200),
	grade NUMBER,
	stday date
);
INSERT INTO univ values(1234,'홍길동', '컴퓨터 공학과','서울 잠실','1','2003-03-02');
INSERT INTO univ values(2345,'신길동', '전자 공학과','서울 강남','3','2007-03-02');
INSERT INTO univ values(3456,'김길동', '미술 학과','경기도 수원','2','2005-03-02');
SELECT ''||stnum 학번,name 이름, major 전공,address 주소, grade 학년, stday 입학날짜
FROM univ;


CREATE TABLE student(
	schid char(10), --입학년도, 단과정보, 그외 sequence(순서)
	name varchar2(50),
	major varchar2(30),
	address varchar2(200),
	grade NUMBER,
	cre_dte DATE	--입학/등록 정보를 날짜 유형으로 설정
);
INSERT INTO student values('hr2170885','홍길동', '컴퓨터공학과', '서울 신림동',1,sysdate);
INSERT INTO student values('hr1870885','김형철', '산업디자인과', '서울 방배동',4,'2018-03-01');
--sysdate : 현재 날짜와 시간을 date형식으로 입력할 때, 활용된다.
--ex) select sysdate from dual;
--날짜형식을 입력시에는 문자열==> 날짜로 변환하는 함수인 to_date()를 활용하여 입력한다.
/*
8. 함수란 무엇이며, 함수에 단일행 함수와 다중행 함수의 차이점을 예시를 통해서 설명하세요.
	- 단일행 함수 : 	테이블에 저장되어 있는 개별 행을 대상으로 하는 함수를 적용하여
					하나의 결과를 반환하는 함수
	- 복수행 함수 : 	조건에 따라서 여러 행을 그룹화하여 그룹별로 결과를 하나씩 반환하는 함수..
	
	==>함수의 매개변수를 통해 데이터가 입력되면, 함수로 인하여 원하는 데이터 형식으로 변경하여
	효율적으로 활용하기 위하여 사용된다.
*/
SELECT LOWER(job)
FROM emp;

SELECT deptno, min(sal)
FROM emp
GROUP BY deptno;
/*
9. 문자 함수가 사용되는 용도에서 웹화면에 물품명을 대소문자 관련없이 검색한다고 가정할 때,
    product(테이블명), pname(검색할 물건명) 을 기준으로 sql을 작성하세요.
    물건명 [ 		][검색] 검색 클릭시, 대소문자 관련없이 키워드 검색이 되게 처리하려면?*/
CREATE TABLE product(
	pname varchar2(20)
);
INSERT INTO product values('orange');
INSERT INTO product values('Apple');
INSERT INTO product values('BANANA');
SELECT pname 과일이름
FROM product;

SELECT pname
FROM product
WHERE upper(pname) LIKE '%'||upper(pname)||'%';

--==>
SELECT * 
FROM product 
WHERE upper(pname) LIKE upper('%'||검색데이터||'%')

/*    

10. length와 lengthb를 차이를 기술하고,  dual을 이용해서 한글과 영문을 비교하세요.
	- length는 문자열의 길이를 나타내고 lengthb는 바이트를 나타낸다.*/
SELECT LENGTH ('안녕하세요')"length(한)",LENGTHB('안녕하세요')"lengthb(한)", 
		LENGTH ('Hello')"length(영)",LENGTHB('Hello')"lengthb(영)"
FROM dual;
/*	
11. ||, substr  이용하여  [ename(deptno)의 직책은 job 입니다. ] 형식으로 출력하세요.   
    ename : 앞에서 3자 추출
    job :뒤에서 5자 추출*/
SELECT substr(ename,1,3)||'('||deptno||')의 직책은 '||substr(job,-5)||' 입니다.'
FROM emp;
/*
12. lpad와 ltrim의 기본적인 형식을 기본예제와 함께 기술하세요.
	lpad : 지정된 문자열 왼쪽에 덧붙이기(문자열 길이 포함 숫자를 지정)
	ltrim: 왼쪽 지정된 문자 삭제하기*/
SELECT lpad('lpad',7,'*')
FROM dual;

SELECT ltrim('******ltrim','*')
FROM dual;

SELECT * FROM emp;
--================================================================================================
/*
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
hr{height : 5px; background-color : gray;}
	h1:active{color:red;}
	h2:active{color:orange;}
	h3:active{color:yellow;}
	h4:active{color:green;}
	h5:active{color:skyblue;}
	h6:active{color:blue;}
</style>
<script type="text/javascript">
			function a1(obj) {//메소드의 역할을 하는것...(?)
				obj.style.backgroundColor = "red";
				obj.innerHTML = "빨간색";}
			function a2(obj) {
				obj.style.backgroundColor = "orange";
				obj.innerHTML = "주황색";}
			function a3(obj) {
				obj.style.backgroundColor = "yellow";
				obj.innerHTML = "노란색";}
			function a4(obj) {
				obj.style.backgroundColor = "green";
				obj.innerHTML = "초록색";}
			function a5(obj) {
				obj.style.backgroundColor = "skyblue";
				obj.innerHTML = "파란색";}
			function a6(obj) {
				obj.style.backgroundColor = "blue";
				obj.innerHTML = "남색";}
			
</script>
</head>
<body>

<!--
1. 웹 페이지의 구성요소 3가지는 기술하고, 간단하게 해당 구성요소를 이용하여 화면을 처리해보세요.
    	html :	웹화면의 기본적인 태그를 통한 구성(정적 화면)
		css	 :	기본적인 태그를 확장해서 보다 여러가지 속성값을 설정(정적 속성 확장/동적 속성 추가)
		js	 :	기본태그를 dom(document object model)로 객체화하여 여러가지 동적으로 속성을 변경하거나
				추가화면을 만드는 프로그래밍.-->
<h3 title="과제">간단한 화면</h3>
<b>진하게 글씨 쓰기</b>
<hr>

<!--
2. h1 ~ h6 까지 초기에는 색상 정보만 출력하다가 외부 파일로
   click이벤트로 클릭시마다, 빨, 주, 노, 초, 파, 남 색상으로
   배경색상이 변경되게 처리하세요.-->
   
   <h1 onclick="a1(this)">빨</h1>
   <h2 onclick="a2(this)">주</h2>
   <h3 onclick="a3(this)">노</h3>
   <h4 onclick="a4(this)">초</h4>
   <h5 onclick="a5(this)">파</h5>
   <h6 onclick="a6(this)">남</h6>
   <hr>
<!--
3. h1~h6, p, hr, br을 활용하여, internet에서 개념을 검색하여
   설명 내용이 들어 있는 페이지를 만드세요.-->
<h1>Internet</h1>
<hr>
<h3>개념</h3>
<p>
<h4>인터넷(Internet)은 인터넷 프로토콜 스위트(TCP/IP)를 기반으로 하여 전 세계적으로 연결된 컴퓨터 네트워크를 일컫는 말이다.
</h4>
</p>
<h5>끝!</h5><br>
 <!-- 
4. 테이블의 계층 구조별 태그를 정리하고 기술하세요.
			1) table : 테이블을 만들기 위한 최상위 태그
			2) thead : 테이블의 해드부분을 작성하기 위한 태그
			3) tfoot : 테이블의 footer를 작성하기 위한 태그
			4) caption : 테이블의 이름을 정의하기 위한태그
			5) tr : 테이블의 행을 추가하기 위한 태그로 th, td의 상위 태그이다.
			6) th : 테이블 head 주로 테이블의 타이틀로 중앙정렬과 bold처리를 해준다.
			7) td : 테이블의 내용을 넣을 수 있는 태그
5. 테이블을 이용하여 database EMP테이블의 데이터리스트를 출력해보세요
   (3row정도만 출력)-->
   <table border="2">
   <caption>데이터베이스 emp테이블</caption>
   <thead>
   <tr><th>EMPNO</th><th>ENAME</th><th>JOB</th><th>MGR</th><th>HIREDATE</th><th>SAL</th><th>COMM</th><th>DEPTNO</th></tr>
   </thead>
   <tbody>
   <tr><td>7369</td><td>SMITH</td><td>CLERK</td><td>7902</td><td>1980-12-17 00:00:00</td><td>800</td><td>null</td><td>20</td></tr>
   <tr><td>7499</td><td>ALLEN</td><td>SALESMAN</td><td>7698</td><td>1981-02-20 00:00:00</td><td>1600</td><td>300</td><td>30</td></tr>
   <tr><td>7521</td><td>WARD</td><td>SALESMAN</td><td>7698</td><td>1981-02-22 00:00:00</td><td>1250</td><td>500</td><td>30</td></tr>
   </tbody>
   </table>
<!--  
6. 테이블이 가지고 있는 속성을 예제를 통해서 처리하세요. 
	1) width : 테이블 전체 폭
	2) height: 테이블 전체 높이
	3) align : 전체화면대비 정렬 위치 left, right, center
	4) border: cell로 구분지정.-->
<h3 align="center">ex)6</h3>
<table width="150" height="100" border="3" align="center">
<tr><td>1</td><td>2</td><td>3</td></tr>
<tr><td>4</td><td>5</td><td>6</td></tr>
</table>

</body>
</html>
*/