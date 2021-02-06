/*[데이터베이스]
[하] 1. 설계의 정규화 과정에서 삽입,삭제,등록 이상이 무엇을 말하는지 기술하세요.
		-삽입 이상이란 테이블에 데이터를 삽입할때 빈 컬럼이 null로 채워지게 되는 것이다.
		-삭제 이상이란 지우고 싶은 데이터 외의 같은 값을 가지고 있는 데이터가 함께 삭제 되는것이다.
		-수정 이상이란 중복된 데이터가 함께 수정되어 수정에 이상이 생기는 것이다.					*/
		
/*[중] 2. 아래와 같은 데이터를 테이블로 만들고, 정규화 과정을 거친 테이블로 구성하세요.
    회원아이디  패스워드  회원명 구매할물건명  구매갯수  물건가격  재고량
    himan     7777   홍길동  사과        3      3000     27
    higirl    8888   신미나  사과        2      3000     25							*/

CREATE TABLE website(
	id varchar2(30),
	pass varchar2(30),
	name varchar2(30),
	prod varchar2(50),
	cnt NUMBER,
	price NUMBER,
	stock NUMBER
);
INSERT INTO website VALUES ('himan','7777','홍길동','사과',3,3000,27);
INSERT INTO website VALUES ('higirl','8888','신미나','사과',2,3000,25);

SELECT id, pass, name, prod FROM website;
SELECT prod, cnt, price, stock FROM website;

CREATE TABLE userInfo
AS SELECT id, pass, name, prod FROM website;

CREATE TABLE prodInfo
AS SELECT prod, cnt, price, stock FROM website;
/*
# 이상현상을 방지를 위해 3개의 테이블 분리
id, pass, name
/pid(새로 만들어야하는 컬럼)/, pname, price, stock
id, /pid/, pcnt
 */

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/* 
[js]
[하] 1. 함수의 기본형식과 호출방법을 기술하세요.
		function 함수명(매개변수1, 매개변수2){
			처리 프로세스..
			return 리턴데이터;
		}	
		==>
		1) 익명함수
		var 함수명 = function(매개1, 매개2){};
		2) 선언함수
		function 함수명(매개1, 매개2){
		}
		3) 호출 : 함수명(데이터1,데이터2);
		익명함수는 하단에 선언후 호출,
		선언함수는 앞에도 가능

[하] 2. 1~9숫자 3X3테이블에 해당 셀을 클릭시, 하단 h4 에 클릭시마다,
       합산한 결과가 출력되게 함수를 정의하고 처리하세요.
       예를 들어 1, 3 클릭시 4 출력														*/


/*
[하] 3. setTimeout, clearTimeout의 기본 생성 코드, 자원해제 코드를 기술하세요.

		1)기본 생성 코드
		setTimeout(function(){ 
			2번째 매개값의 시간 이후에 처리할 내용
		},1/1000초 시간)
		
		2)자원 해제 코드
		clearTimeout(변수);

[중] 4. 시작버튼 클릭시, h2 화면에 구구단 임의의 문제가 출력되고, 10문제 출력시, 끝나게 하세요.
*/
//

</script>
</head>
<body>
   <table align="center" width=300 height=300 border>
   	<tr><td>1</td><td>2</td><td>3</td></tr>
	<tr><td>4</td><td>5</td><td>6</td></tr>
   	<tr><td>7</td><td>8</td><td>9</td></tr>
   </table>
   <h4></h4>
</body>
<script type="text/javascript">
/* 
 
 
*/
   document.querySelector("h2").innerHTML="js 시작^^";
//

</script>