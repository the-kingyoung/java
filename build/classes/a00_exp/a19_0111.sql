/*
[데이터베이스]
[하] 1. merge의 형식으로 테이블간, 입력데이터간 처리 기본형식을 기술하세요.
 		
 		merge into 테이블명 a
 		using 테이블명 b or dual
 		on a와b의 특정한 컬럼 비교
 		when matched then : 두개의 테이블의 특정 컬럼에 데이터가 있을때
 			update set : 수정처리
 		when not matched then
 			insert into values : 등록처리
 		
 		
[중] 2. dept구조 복사 테이블 dept10, dept11을 만들고, 위에 기술한 merge입력처리 예제, 
    테이블간 복사 merge예제를 만드세요*/
CREATE TABLE dept10
AS SELECT * FROM dept WHERE 1=0;
CREATE TABLE dept11
AS SELECT * FROM dept WHERE 1=0;

SELECT * FROM dept;
SELECT * FROM dept10;
SELECT * FROM dept11;

MERGE INTO dept10 a
USING dual
on (LOC = '강남')
WHEN MATCHED THEN 
UPDATE SET 	deptno=10, dname='경영'
WHEN NOT MATCHED THEN 
INSERT 
VALUES (10,'경영','강남');

MERGE INTO dept11 b
USING dept10 c
ON (b.loc=c.loc)
WHEN MATCHED THEN 
UPDATE SET deptno=20, dname='비서'
WHEN NOT MATCHED THEN 
INSERT (deptno, dname, LOC)
VALUES (20,'비서','마포');

UPDATE dept10
	SET dname='회계'
	WHERE deptno=10;

INSERT INTO dept10 values(50,'인사','서울강남');
--웹프로그램에서
--부서번호[	]
--부서명[	]
--부서위치[	]
--[등록/수정] - 요청값을 전달해서 자바 프로그램에서 db처리할 때 활용된다.
MERGE INTO dept11 a
USING dual
on(a.deptno =30)
WHEN MATCHED THEN 
UPDATE SET a.dname='영업',
a.loc='개포동'
WHEN NOT MATCHED THEN 
insert(deptno,dname,LOC)
VALUES (30,'영업','개포동');

SELECT * from dept11;
/*

[html]
[하] 1. css의 색상 표현 방법 2가지는 기본예제를 통해서 기술하세요.
		
- 16진수 코드 표현
	선택자{color:#8A2BE2;}
- 10진수 RGB()로 표현
	rgb(0~255,0~255,0~255)
		10진수로 3원색을 혼합하여 처리한다.
		
[하] 2. css의 margin이란 무엇이면 방향별로 설정형식을 기술하세요.

- margin : 현재요소객체의 border와 외부와의 여백을 지정할 때 활용된다.
			div{margin:10px;} : div의 왼쪽 오른쪽 위 아래 방향으로 외부 여백을 10px 설정
			1) margin-방향 : 해당 방향의 여백을 상세 설정.
			div{
				margin-left
				margin-right
				margin-top
				margin-bottom
				color
				}
				
[하] 3. 글자 관련 스타일 속성을 기술하고, a href에 underline을 제거하고 글자색과 배경색상을 지정하여 
    처리한 코드를 기술하세요.
-  	text-align : 해당 객체 안에 있는 문자열이나 요소객체들의 정렬방식
- 	text-decoration : 텍스트에 선을 입력하는 처리에 관련된 설정
	none : 선이 없게 처리
	underline : 하단에 선을 그어준다. 
				ex) a href은 default로 underline이 있다.
	overline : 해당 텍스트의 상단에 선을 그어준다.
	line-through : 해당 텍스트에 중간에 선을 그어준다.
-	text-intent : 숫자값으로 들여쓰기를 처리한다.

예제
<style>
a{
text-decoration:none;
color:yellow;
}
</style>

<body>
<a href="http://www.naver.com" style="background-color : pink; font-color:green;
text-decoration:none;">네이버</a>
</body>
    */