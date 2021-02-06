/*
[데이터베이스]
[하] 1. seqence의 생성 기본 형식을 기술하세요.
	-create sequence 시퀀스명
		increment by n : 증가 단위
		start with n : 초기 번호
		maxvalue n | nomaxvalue : 최대 데이터
		minvalue n | nominvalue : 최소 데이터
		cycle | nocycle : 최대/최소에 이를때 반복여부
		cache | nocache : 속도향상을 위한 캐시메모리
				사용 여부;
				
[하] 2. 게시판 테이블을 번호, 제목, 작성자, 내용, 조회수로 생성하고,
        sequence로 번호를 만들어 입력 처리하게 하세요..*/
	CREATE TABLE board(
		num NUMBER,
		title varchar2(30),
		writer varchar2(20),
		contents varchar2(100),
		views number
	);
	CREATE SEQUENCE board_seq
	START WITH 1
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 100
	CYCLE;

SELECT * FROM board;
INSERT INTO board values(board_seq.nextval,'알림','홍길동','날씨',3);

/*
[중] 3. student2테이블 학번, 이름, 학과 테이블이다.
        학번을 올해연도(2)학과코드(CS)번호(4)로 해당 자리수로 설정할 때,
        테이블과 sequence를 만들고 데이터를 입력 처리하세요*/
	CREATE TABLE student2(
		syear NUMBER,
		code NUMBER,
		snum NUMBER
	);
SELECT * FROM student2;
	CREATE SEQUENCE stu_seq
	START WITH 1000
	INCREMENT BY 1
	MINVALUE 1000
	MAXVALUE 9999;
SELECT to_char(sysdate,'yy')||'CS'||stu_seq.nextval "학번" FROM dual;

/*
[하] 4. sequence의 변경/삭제 구문을 기술하고, 한계를 예제를 통해서 나타내세요.
	-변경 기본 형식
		alter sequence 시퀀스명
	 	increment by n
	 	maxvalue n|nomaxvalue
	 	minvalue n|nominvalue
	 	cycle|nocycle
	 	cache|nocache
	 	-start with의 값은 변경이 불가하다.
	 	
	 -삭제 기본 형식
		drop sequence 시퀀스명;
		
[하] 5. 테이블의 생성 기본형식을 옵션과 함께 기술하세요.
	- 테이블 생성 기본 형식
	create 옵션1 table 옵션2.테이블명(
		컬럼명 데이터유형 옵션3 옵션4
		컬럼명 데이터유형 옵션3 옵션4
		..
		컬럼명 데이터유형 옵션3 옵션4	
	);
	옵션1 : global temporary - 임시테이블 만들 때 사용 
			해당 세션(클라이언트)에만 보임
	옵션2 : 스키마(사용자계정) - 다른 계정에서 호출해서 사용한다.
		ex) system계정으로 접속해서 scott계정에서 사용할 테이블을 만들때
			반드시 스키마를 선언하여야 한다.			
	옵션3 : default 데이터 선언 - 데이터를 입력하지 않을때 null값 대신에
			들어가는 데이터를 선언할 수 있다.
	옵션4 : 제약조건 - primary key, not null등 무결성 제약조건을 선언할 수 있다.
	
[하] 6. 테이블 생성시, default 데이터의 입력의 제약사항에 대하여 기술하세요.
	- 	리터럴 값, 표현식, sql함수, sysdate, user를 사용할 수 있다.
		특정 컬럼이나 의사컬럼(nextval, currval)은 사용할 수 없다.
		
[하] 7. 테이블의 구조 변경 형식을 지정하고, 복사테이블 emp60만들고, 부서명, 부서위치를 추가 처리하세요
		- alter table 테이블명
 		  add 컬럼명 데이터유형 [default 디폴트데이터], [제약조건]*/
	CREATE TABLE emp60("부서명","부서위치")
	AS SELECT dname, loc FROM dept;
	SELECT * FROM emp60;

/*
[하] 8. 컬럼의 삭제 처리하는 형식을 기술하고, 위 emp60에서 부서위치를 삭제 처리하세요.
		- alter table 테이블명 drop column 컬럼명;*/
	ALTER TABLE emp60 DROP COLUMN "부서위치";

/*
[html]
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
div{
	border : 3px dotted yellow;
	color : red;
	background : pink;
}

</style>
</head>
<body>
<!-- 
[하] 1. font에 관련된 속성을 기술하고, 해당 속성에 따른 기본값을 예제를 통해 나타내세요.
1. 폰트의 종류 font-family : 폰트의 종류 궁서체, 맑은 고딩, Arial등, 굴림체
2. 폰트의 크기 font-size : 표준 단위로 크기를 설정..
		ex) h1{font-size:2.0em;}
3. 폰트의 스타일 font-style : 기울림(italic), oblique..
4. 폰트의 굵기 font-weight : bold, boder, light...,100-900범위 굵기
5. 한번에 폰트의 속성을 지정..
	font : font-style font-weight font-size font-family
	ex) p{font : italic bold 20px consolas,sans-serif;}
	ex) h4{font : 20px consolas,sans-serif;}
		font-size, font-family 외 생략 가능

[하] 2. css의 표준 단위에 대하여 기술하세요.
1. em : 배수 ex) 기본적으로 지원하는 크기에서 배수로 처리할 때 활용
				font-size : 3em;
2. % : 퍼센트 ex) 해당 지원하는 크기에 %로 크기 설정.
				 font-size :200%;
3. px : 픽셀수 ex) 절대적인 픽셀단위 크기 설정.
4. pt : 포인트 1pt = 1in(인치)의 1/72 크기
5. cm|mm : ex) 절대적 cm|mm크기로 설정.
6. in : 인치 = 2.54cm = 96px ex) margin:2in;	왼쪽 여백 2인치
7. pc : 피카소(picas) 1pc = 12pt
8. deg : 각도		ex) transform:rotate(20deg) : 시계방향 20도 회전

[하] 3. box의 기본 속성값 3개와 방향속성값과 연관관계, border속성값에서 추가되는 속성을 기술하세요.
		- margin(여백) : 외부 객체와 사이 간격
		- border(테두리): div 객체의 테두리 선을 말한다.
		- padding : 박스모델의 내부에 포함된 컨텐츠와 테두리 사이 간격
		전체 방향을 설정할 수도 있고 bottom, top, left, right을 통해 방향을 정할 수도 있다.
		
		border속성값에서 추가되는 속성으로는 
		width(굵기)|style(스타일)|color(색상)가 있다.

[하] 4. border 테두리 관련 속성값을 기술하세요.
		style="border : 
		n px(선굵기)
		solid : 일반 테두리
		none/hidden : 테두리 없음
		dotted : 점선 테두리
		dashed : 굵은 점선 테두리
		double : 두줄 테두리
		groove : 우하향에서 좌상향으로 빛을 쏠때 그림자
		ridge : 좌상향에서 우하향으로 빛을 쏠때 그림자
		inset : 구덩이에 좌상향에서 우하향으로 빛을 쏠때 그림자
		outset : 구덩이에 우하향에서 좌상향으로 빛을 쏠때 그림자
		
[하] 5. box관련 배경이미지 속성과 속성값을 기술하세요.
		background-color : 배경색
		background-image : url("이미지주소/파일경로");
		background-position : center center
		x축과 y축 위치
		background-repeat
		-none : 반복x
		-repeat : x->y 위->아래 반복
		-repeat-x : x축 왼쪽 -> 오른쪽 반복
		-repeat-y : y축 위->아래 반복
		
[하] 6. block, inline, inline-block의 차이점을 좋아하는 과일 리스트를 div에 넣고 화면에 표시하세요.

 -->
 좋아하는 과일은 <div style="display:none">
	딸기</div>입니다.<br><br>
좋아하는 과일은 <div style="display:block">
			귤</div>입니다.<br><br>
 좋아하는 과일은 <div style="display:inline">
	사과</div> <div style="display:inline">귤</div>입니다.<br><br>
 좋아하는 과일은 <div style="display:inline-block; height:50px">
	복숭아<br>포도</div> 입니다.<br><br>
</body>
</html>
*/
