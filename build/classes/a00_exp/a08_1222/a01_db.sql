/*1. sql 명령문의 종류(ex DQL, DDL...)와 기능을 설명하고 주요 명령문의 예제 확인해서 정리하세요.
1) 질의어(DQL : data query language) : 데이터를 검색시 사용 ex)select*from 테이블

2) 데이터 조작어 (DML : data manipulation language) : 데이터를 입력/수정/삭제
		-INSERT into 테이블명(컬럼명1,컬럼명2...) values(데이터1,데이터2...);
		
		-UPDATE 테이블명
		    set 컬럼명 = 변경할데이터,
		   	    컬럼명 = 변경할데이터
		  where 조건문;
		
		-DELETE
		 from 테이블명
		 where 조건문;	삭제는 row단위로 하기때문에 컬럼명을 지칭할 필요가 없음
		
3) 데이터 정의어(DDL : data definition language) : 데이터정의어 
	객체 생성(create), 객체구조변경(alter)(ex-컬럼의 타입변경..), 
	객체 삭제 (drop), 객체 이름 변경(rename), 데이터 및 저장 공간 삭제(truncate)	
	
4) 트랜잭션 처리어(TCL : transaction control language) : 트랜잭션의 정상적인 종료
	(dml 처리 후, session별(계정접속) 트랜잭션 처리 완료 및 취소를 해주는 것을 말한다.)
		 처리(commit), 트랜잭션 취소(rollback)(dml처리 취소), 트랜잭션내의 임시 저장점 설정(savepoint)(임의의 저장지점 설정)
		ex) 사용자1이 scott계정 접근, 데이터 조작어 insert를 하면, 현재 사용자1 화면에서는 입력이 되어 있지만
			다른 사용자2로 해당 계정에 접근하면 입력되어있지 않다. 이때 사용자1이 입력후 commit하는 순간
			다른 사용자로 접근해서 해당 테이블에 데이터가 입력된 것을 확인할 수 있다.	
			
5) 데이터 제어어(DCL : data controll language) : 계정별 권한을 부여 처리..
	데이터 객체에 대한 접근 권한 부여(grant), 
	데이터베이스 객체에 대한 접근 권한 취소(revoke)*
	
	
2. sal+comm으로 연산하는 경우 comm null인 경우, 문제가 발생한다. 어떤 문제이고 이것을 해결할려면 어떤 처리를 하는지 정리하세요.
	- 	comm이 null인 경우 연산을 하게 되면 답도 null로 나오게 된다. 
		따라서 nvl함수 nvl(컬럼, null경우 초기 데이터)를 이용하여 연산이 가능하게 도와준다.
		위 경우
		1) select sal + nvl(comm,0)총계
		2) select sal + comm
		   from emp
		   where comm is null;
	

	==>데이터베이스에서 null인 데이터는 연산을 처리시, 연산결과가 null로 처리된다.
		null인 경우 숫자값을 default인 0으로 설정해주는 함수로 지정하는 경우와 조건절에서 null을 배제하는 경우가 있다.
	
3. 오라클에서 사용하는 주요 데이터 타입의 종류를 예시와 함께 기술하세요.
	==>데이터베이스에서 각 컬럼에 대한 데이터 타입을 설정하여, 적절한 데이터의 크기와 유형과 사용형태에 맞게 설정해준다.
		create table 테이블명(컬럼명1 데이터타입, 컬럼명2 데이터타입,....);
		
		1) varchar2(최고크기) : 	사용하는 최고크기를 설정하고, 입력되는 데이터에 따라 가변적으로 데이터크기가 
								설정되는 것을 말한다. 최대 4000바이트.. - 메모리효율화를 이룰 수 있다.
								
		2) number,number(p,s):	정수/실수 등 숫자형 데이터를 설정할 때 활용된다. 정밀도(p)와 스케일(s)로 표현된다.
								전체크기, 소수점 이하 크기로 쉽게 표현한다.
								
		3) date				:	날짜/시간 형식을 저장하기 위한 데이터 타입..
		
		4) char				: 	고정길이 문자 데이터타입, 최대 2000바이트
								코드성 데이터 즉, 학번, 사번, 주민번호 등과 같이 길이가 일정하여 
								변경될 일이 없는 경우 사용, 가변형에 비해 입력 속도가 빠르다.
		5) nvarchar2(최고크기):	국가별 문자 집합에 따른 최고크기의 문자를 설정하는 가변형 데이터 처리.
		6) rowid			:	테이블 내 행의 고유 주소를 가지는 64진수 문자 타입. 행당 6바이트 또는 10바이트
		7) blob				:	대용량의 바이너리 데이터를 저장하기 위한 데이터타입, 최대 4GB
		8) clob				:	대용량의 문자열 데이터를 저장하기 위한 데이터타입, 최대 4GB
		9) bfile			:	대용량의 바이너리 데이터를 파일 형태로 저장하기 위한 데이터타입, 최대 4GB
		10) timestamp(n)	:	날짜형 데이터타입의 확장된 형태, n은millisecond,자리수는 최대 9자리까지 표현 가능
	- 주로 주민번호, 학번과 같은 고정된 값에 사용이 되는 char(size값)
		create table personnel(
			civilnum char(13)
		);
	- 가변 길이 문자 데이터 타입인 varchar2(size값)
		create table personnel(
			name varchar2(15)
		);
	- 숫자 데이터 타입인 number.
	
4. 문자열을 저장하는 데이터 중, 고정형과 가변형이 있다. 두 데이터 유형의 차이점을 기술하세요.
	==> 고정형 char은 데이터를 입력시, 크기가 작은 문자열을 입력하더라도 공백으로 해당 크기만큼 저장된다.
		가변형 varchar2는 최대크기 이하 데이터를 입력시, 해당 크기만큼 데이터가 저장된다. 
	
	-  	고정형으로는 char(size값)이 있고 가변형으로는 varchar2(size값)이 있다.
		고정형의 경우 정해진 데이터의 값이 있고 가변형의 경우 최대 크기를 할당시켜 놓은 뒤 한도 내에서 사용이 가능하다.
	- 
5. 데이터 유형을 확인하고, 학생테이블(번호, 이름, 국어, 영어, 수학)을 만들고 데이터를 입력하세요.
*/
	CREATE TABLE class(
		num NUMBER,
		name varchar2(20),
		kor NUMBER,
		eng NUMBER,
		math NUMBER
	);
	--select a.*, kor+eng+math 총계, round(kor+eng+math)/3,1) 평균 from class a;
	--테이블의 별칭.* : (전체컬럼)에서 추가할 때는 테이블 테이블의 별칭으로 설정
	--컬럼을 통한 연산이나 함수를 통해서 처리될 수 있는 데이터는 테이블로 관리하지 않는다.
	--round(컬럼, 소수점자리수) : 해당 자리수만큼 반올림처리
	INSERT INTO class values (1,'홍길동',100,56,52);
INSERT INTO class values (2,'신길동',78,78,13);
INSERT INTO class values (3,'김길동',89,76,90);
	SELECT num 번호, name 이름, kor 국어, eng 영어 ,math 수학
	FROM class;


/*
6. 스포츠 스타의 이름 소속사 올해 성적을 입력하는 테이블을 만들고 데이터를 입력하고 조회하세요.
*/
	CREATE TABLE Son(
		name varchar2(20),
		team varchar2(20),
		goal NUMBER,
		assist NUMBER
	);
INSERT INTO Son values('손흥민','토트넘',14,4);
SELECT name 이름, team 소속팀, goal 득점, assist 도움
FROM Son;
/*
7. select에서 쓰이는 컬럼과 where 조건의 비교 연산자에 쓰이는 컬럼은 어떤 차이가 있는가?
	- select  선택컬럼1, 선택컬럼2 
	  from 테이블
	  where 조건컬럼1 = 데이터,
	  and 조건컬럼2 = 데이터
	
	선택컬럼 : 출력할 컬럼에 대한 선택을 처리한다.(열단위 선택)
	조건컬럼 : 출력할 row단위 filtering 처리 (행단위 filtering처리)
	# 2차원의 데이터를 SELECT, WHERE에 의해서 행/열 단위로 선택 및 FILTERING을 해준다.
	
	
8. where 조건에 쓰이는 비교 연산자의 종류와 논리 연산자의 종류를 기술하세요.
	- AND, OR, IN, BETWEEN A AND B
	WHERE 컬럼명1 = 데이터
	AND 컬럼명2 = 데이터
	비교연산자 : =,!=,<>,<,<=,>,>=(연산자)
	논리연산자 : and, or, not
	기타 함수나 키워드 : ,between a and b, is null, in...
	
9. between, in 구문의 기본형식을 선언하고, 기본 예제를 기술하세요.
	SELECT *
	FROM emp
	WHERE 컬럼명 IN (데이터1,데이터2)
	==> 컬럼명 IN (데이터1,데이터2...), 컬럼명 IN (SUBQUERY)
	
	SELECT *
	FROM emp
	WHERE 컬럼명 BETWEEN 데이터1 AND 데이터2
--------------------------------------------------------------------------------------------------						
1. html 내부에 html, css, js의 기능적 특성을 간단한 예제와 함께 서술하세요.
2. html과 jsp의 차이점을 기술해 보세요
3. 클라이언트 웹 브라우저를 통해서 html을 호출할 때, http://localhost:7080/javaexp/call.html url 주소가 사용될 때
   주소의 구성요소가 의미하는 것에 대하여 기술하세요.
4. 웹프로그램에서 클라이언트와 서버는 무엇을 말하는지? 프로그램 위주로 설명하세요.

5. html 초기 페이지로 상단타이틀, 툴팁, h1~6, 문단을 이용하여, 좋아하는 시를 표현해보세요..
	-캡쳐
6. html에서 &nbsp; pre 태그와 br을 쓰는 이유에 대하여 각 태그에 기능적 특성 위주로 기술하세요.
	- &nbsp;는 공백 문자를 추가 처리 해주는 것
	- <pre>는 사용자가 입력한 문자 그대로 출력해주고 싶을 때 사용하는 것
	- <br>는 줄바꿈 처리를 해줄때 사용하는 것
*/