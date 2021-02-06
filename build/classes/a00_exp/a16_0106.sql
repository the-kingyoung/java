/*
[하] 1. self 조인이란 무엇인가? 개념을 기술하세요.
	- 하나의 테이블 안에 컬럼끼리 연관관계가 있어, join형식으로 데이터를 처리하는 것을 말한다.
	
[중] 2. company테이블을 만들고 아래와 같은 직책과 상위 관리자를 만들어 
         @@@님의 현재 직책은 @@이고 직속상관은 @@@이며 @@직책에 있다. 출력하세요.*/
CREATE TABLE company(
	NO NUMBER,
	name varchar2(20),
	pos varchar2(20),
	ponum NUMBER
);
	INSERT into company values(1,'홍길동', '사장', 0);
	INSERT into company values(2,'신길동', '과장', 1);
	INSERT into company values(3,'이길동', '팀장', 2);
	INSERT into company values(4,'박길동', '대리', 3);
	INSERT into company values(5,'김길동', '인턴', 4);
SELECT a.name||'님의 현재 직책은 '||a.pos||'이고 직속상관은 '||b.name||'이며 '||b.pos||'직책에 있다.'
FROM company a, COMPANY b
WHERE a.ponum=b.no;

/*
[하] 3. sub query란 무엇인가? 기본 예제를 통해 개념을 설명하세요.
	- 하나의 sql명령문의 결과를 이를 포함하고 있는 상위 sql명령문에 전달하기 위해
		두개 이상의 sql명령문에 상위 sql명령문과 연결하여 처리하는 방법을 말한다.*/
--ex) 사원명 ALLEN의 직책과 같은 사원의 정보를 출력하라
		SELECT JOB 
		FROM emp
		WHERE ename='ALLEN'
--ALLEN의 직책을 우선 구하고
SELECT *
FROM emp
WHERE job=(
		SELECT JOB 
		FROM emp
		WHERE ename='ALLEN');
--대입을 한다.
/*
[하] 4. 단일행과 다중행 subquery의 차이점은 무엇인가 기술하세요.
		단일행 subquery는 단 하나의 행만을 검색하여 메인쿼리에 반환하는 질의문을 말하고
		다중행 subquery는 서브쿼리에서 실행한 결과값이 1행이상일 때 사용하는 것을 말한다.
		
[중] 5. 1981년 1~2사분기에 입사한 사람 중에서 가장 급여가 높은 사람 
        보다 많은 사원의 정보를 출력하세요.*/
SELECT *
FROM emp
WHERE sal>(SELECT max(sal)
FROM emp
WHERE to_char(hiredate,'YYYY')=1981	
AND to_char(hiredate,'Q')<3);

SELECT *
FROM emp
WHERE sal> all(SELECT sal
FROM emp
WHERE to_char(hiredate,'YYYY')=1981	
AND to_char(hiredate,'Q')<3);

	
/*
[하] 6. 다중행 subquery의 연산자에 대하여 차이점을 기술하세요.
		in : 결과값이 or 조건으로 처리해야할 필요가 있는 경우 활용된다.
		any, some : 결과값이 1개라도 있는 경우 min(조회데이터)과 동일
		all : 모든 결과값이 일치하는 경우 max(조회데이터)과 동일
		exist, not exist : 해당 sub query값이 존재하는 경우, 존재하지 않는 경우.
=========================================================================================		
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0106 과제</title>
<script type="text/javascript">
function call1(){
	alert("클릭 클릭!")
}
</script>
</head>
<body>
<!-- 
[하] 1. datalist의 기본 형식을 설명하고, 좋아하는 과일항목을 선택하는 예제를 만드세요.
	- 	입력(input)요소객체에 선택할 수 있는 데이터를 선언하고
		해당 리스트를 선택적으로 입력할 수 있게 처리해준다.-->
	<form>
	
	좋아하는 과일 : <input type="text" name="과일" list="fruit">
				 <datalist id="fruit">
				 <option value="딸기">
				 <option value="토마토">
				 <option value="사과">
				 <option value="복숭아">
				 </datalist>
	</form><br><br><br><br>
<!-- 
[하] 2. input의 type 속성중 button관련 속성값을 나열하고, 해당 내용을 특징을 기술하세요.
	1) type="text" : 일반적인 입력형식
	2) type="password" : 패스워드 입력가능처리 *****형태로 보임
	3) type="button|submit|reset" : 버튼모양
			value="버튼의 label표시"
			button : 버튼 통해서 클릭 시, 동적인 처리를 위해 사용 : js함수호출
			submit : form 하위에 있는 모든 입력 요소 객체를 네임값이 있을 때 서버로 전송 처리
			reset  : form 하위에 있는 모든 입력 요소객체의 입력값을 초기화 처리
	4) type="image" : 이미지 보이기
	5) type="radio" : 둥근 모양의 여러개 중 단일 선택
	6) type="checkbox" : 네모 모양의 여러개 중 다중 선택

[하] 3. 버튼을 클릭시, alert으로 '안녕하세요!'가 출력되게 처리하세요.-->
       <button type="submit" onclick="alert('안녕하세요!')">
		<img src="jajang.png" alt="이미지 버튼"></button><br>

<!-- 
[중] 4. 이미지를 처리하는 형식이 두가지가 있다. 두가지 형식에 대하여
       기술하고, 버튼 클릭이 '클릭클릭!'이라는 메시지가 처리 되게 하세요.-->
       
       <button type="submit" onclick="alert('클릭클릭!')">
		<img src="button.png" alt="이미지 버튼"></button><br>
	
		<input type="image" src="button.png" onclick="call1()"/><br>
	
<!--   
[하] 5. input type의 radio와 checkbox의 차이를 기술하고,
        여기서 name 속성은 어떤 역할을 하는지 설명하세요.
        - radio는 여러개의 둥근 모양 중 한개만 선택이 가능
        - checkbox는 여러개의 네모 모양 중 다중 선택이 가능
        이때 name은 주소에서의 선택지 이름을 뜻한다.(서버로 전송)
        
[하] 6. select의 속성과 option의 속성에 대하여 기술하세요.
	* select의 속성
		size="숫자" : 한번에 보이는 선택의 크기
		multiple : 다중 선택을 가능하게 하는 옵션	
	* option의 속성
		value : 선택되었을 때, 전송 또는 js로 처리되는 값
				value가 없을때는 
		selected : 초기에 선택되어서 나오게 할때 사용된다.
		
[하] 7. select를 이용해서 물건(사과/바나나/딸기), 갯수(1~10)를 선택하게
        만들고, 해당 내용을 선택했을 때, 값을 출력하게 하세요.-->
    <form>
	<select name="fruit1">
		<option value="apple">사과</option>
		<option value="banana">바나나</option>
		<option value="strawberry">딸기</option>
	</select>
	<select name="cnt">
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
		<option value="10">10</option>
		<input type="submit" value="등록">
<!-- http://localhost:8080/javaexp/homework/zzhomework0106.html?fruit1=banana&cnt=4 -->
	</select>
	</form>

</body>
</html>
*/