/*
[데이터베이스]
[하] 1. 테이블 구조변경 형식을 기본 예제와 함께 기술하세요.
		alter table 테이블명
		modify 컬럼 데이터 유형 옵션1*/
	
		ALTER TABLE student2
		MODIFY code varchar2(20);/*

[하] 2. 테이블 구조변경의 한계(데이터 입력, 유형, 크기 별로)를 기술하세요.
		
		- 기존 컬럼에 데이터가 없는 경우에는 컬럼 타입 또는 크기 변경이 자유롭게 가능하다.
		큰데이터 <=변경가능=> 작은데이터
		하지만 기존 컬럼에 데이터가 있는 경우에는 char, varchar2만이 허용이 가능한데
		기존 저장된 데이터의 크기보다 크거나 같을 경우에만 가능하다
		- default값 변경의 경우 변경 후에 입력되는 데이터부터 적용이 가능하다.

[중] 3. 테이블 구조복사 종합예제
    1) emp54으로 구조복사해서 테이블 만들고,*/
		CREATE TABLE emp54
		AS SELECT * FROM emp WHERE 1=0;
		
  /*2) 테이블을 dname, position 를 추가. 
       grade char(1) 추가
       tmp_empno char(8)로 추가*/
	ALTER TABLE emp54
	ADD (dname varchar2(30), POSITION varchar2(50), grade char(1), tmp_empno char(10));
  /*3) 입사년월(4)부서번호(2)사원번호(4) 로 tmp_empno 할당 처리,
		
		to_char(hiredate,'YYMM')||deptno||empno "tmp_empno"*/
		SELECT * FROM emp54 ;
	
  /*4) subquery를 이용해서 해당 데이터에 맞게 데이터를 입력처리.
        grade는 sal의 등급에 따라 5000이상 A, 4000 이상 B, .. C...로 할당 처리.
        입력할 테이블의 테이블 구조 확인*/
		SELECT * FROM emp54 ;
	--	입력할 데이터의 subquery를 일단 데이터 sql로 확인
		INSERT INTO emp54
		SELECT empno, ename, job, mgr, hiredate, sal, comm,
				d.deptno, dname, loc position,
				decode(floor(sal/1000),1,'E',2,'D',3,'C',4,'B',5,'A','F') "grade",
				to_char(hiredate,'YYMM')||e.deptno||e.empno "tmp_empno"
		FROM emp e, DEPT d 
		WHERE e.DEPTNO = d.DEPTNO;
		
  /*5) hiredate는 credte로 변경 char(8)  YYYYMMDD  변경처리*/
	ALTER TABLE emp54
	RENAME COLUMN hiredate TO credte;
--데이터가 있을 때 컬럼의 데이터 타입을 변경하고, 다시 해당 유형으로 데이터를 입력할때
--1. emp테이블이 없을때 임시테이블에 복사 처리.
--	 key인 empno와 함께 복사할 컬럼을 지정해야한다.
CREATE TABLE emp54_tmp
AS SELECT empno, credte FROM emp54;
SELECT * FROM emp54_tmp;
	
	UPDATE EMP54 
	SET credte = NULL;--해당 컬럼 null값으로 수정
	
	ALTER TABLE emp54
	MODIFY credte char(8);

	UPDATE emp54 b
	SET credte = (SELECT to_char(credte,'YYYYMMDD')
					FROM emp54_tmp a
					WHERE b.empno =a.empno);
				
				SELECT * FROM emp54;
  /*6) empno 컬럼 삭제 처리, tmp_empno는 empno로 컬럼명 변경*/
	ALTER TABLE EMP54 
	DROP COLUMN empno;

	ALTER TABLE EMP54 
	RENAME COLUMN tmp_empno TO empno;

	SELECT * FROM emp54;


/*
[html]
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#div:hover {
   position : absolute;
   left : 50%;
   top : 50%;
   background : green;
   color : white;
}
#menubar {
   background : pink;
}
#menubar ul{
   margin : 0;
   padding : 5;
   width : 567px;
}
#menubar ul li{
   display : inline-block;
   list-style-type : none;
   padding : 5px 15px;
}
#menubar ul li a {
   color : white;
   text-decoration : none;
}
#menubar ul li a:hover{
   color : red;
}
</style>
<script type="text/javascript">
   function hi(obj){
      obj.style.visibility='hidden';
   }
   function vi(obj){
	      obj.style.visibility='visible';
	   }
</script>
</head>
<body>
<!-- 
[하] 1. position의 속성과 속성값의 내용에 대하여 설명하세요.
		position의 속성
		- static : 기본
		- relative : 상대적 위치 (이전 태그를 기준으로 상대적 위치)
		- absolute : 절대적 위치 (전체화면을 기준으로 절대적 위치)
		- fixed : 고정위치
		- float : 유동 위치
		속성값 : top, bottom, left, right, height
		
[하] 2. hello를 글자로 div 속성으로 만들고, 모든 div가 가상클래스 속성으로
          마우스 오버했을 때, 절대적 위치로 중앙에 위치가 되고 배경색상과 글자 색상이 변경 되게 하세요.-->
    <div id="div">hello</div>      
<!--
[하] 3. display:fixed;와 float:right|left;의 차이점을 기술하세요.  
[하] 4. visibility와 overflow의 공통 속성과 다른 속성을 기술하세요.
		visibility
		1) visible : 보이는 처리
		2) hidden : 보이지 않게 처리
		
		overflow
		1) visible : 넘는 부분을 그대로 둔다
		2) hidden : 넘는 부분을 잘려서 보이게 한다.
		3) scroll : scroll생성으로 전체가 보일수 있게 한다.
		
[중] 5. button으로 클릭시, 특정 이미지가 보였다가 보이지 않기를 반복처리 되게 하세요.-->
	<hr>
	<img id="jajang" src="jajang.png" width="150" height="150"><br>
	<button onclick="vi(jajang)">보이기</button>
	<button onclick="hi(jajang)">숨기기</button>
<!-- 
[하] 6. 메뉴항목을 ul,li, a로 상단에 왼쪽으로 리스트 처리하고 iframe으로 해당 내용이 변경되게 처리하세요. -->
<nav id="menubar">
   <ul>
      <li><a href="asdfasdf.html" target="iframe">Home</a></li>
      <li><a href="http://op.gg" target="iframe">op.gg</a></li>
      <li><a href="http://www.daum.net" target="iframe">다음</a></li>
      <li><a href="http://www.google.com" target="iframe" >구글</a></li>
   </ul>
</nav>
<iframe name="iframe" width="1000" height="500"></iframe>
</body>
</html>
*/