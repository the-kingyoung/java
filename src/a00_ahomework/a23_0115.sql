/*
# 과제 준비
[데이터베이스]
[하] 1. 데이터베이스 설계에서 entity, entity type, reference를 구분하여 기술하세요.
		entity : '개체'로써 저장할 가치가 있는 중요 데이터를 갖고 있는 사람, 사물, 개념, 사건 등을 뜻한다.
				 현실세계에서 조직을 운영하는데 꼭 필요한 사람, 사물과 같이 구별되는 모든 것을 말한다.
		entity type : '개체 타입'으로 객체를 고유의 이름과 속성들로 정의한 것을 말한다.
					  추후 컬럼의 데이터 타입으로 설정된다.
		reference : 실제 위에 지정한 컬럼에 데이터를 할당한 row단위를 말한다.
					파일구조의 레코드를 의미한다.
		
[하] 2. 무결성 제약조건 5가지를 기술하세요.
		1) primary key : not null + unique
		2) not null : 반드시 값을 입력해야 할 때
		3) unique : 고유키 (.중복 허용하지 않음)
		4) check : 해당 데이터만 입력 가능
		5) foreign : 한열과 참조된 테이블 열간의 외래키 설정
				reference 참조할 테이블과 컬럼 지정.
		
[하] 3. 가계부테이블을 만들어 온라인 가계부를 처리할려고 한다. pk를 비롯한 제약조건이 있는 속성을 도출하고 
테이블을 만들고 데이터를 등록해서 select문으로 출력하세요.*/
CREATE TABLE account(
	salary NUMBER CONSTRAINT acc_sal_pk PRIMARY KEY,
	income NUMBER CONSTRAINT acc_inc_nn NOT NULL,
	outlay NUMBER	
);
INSERT INTO account values(10000,199999,1999999);
SELECT * FROM account;

--==>
CREATE TABLE mn_book(
	NO NUMBER CONSTRAINT mn_book_no_pk PRIMARY KEY,
	idate DATE NOT NULL,
	kind char(6) NOT NULL,
	content char(50),
	val number	
);
/*
 --가계부--
 
[no]		날짜		수입/지출구분		항목		금액		잔액
1			1/18	수입				용돈		10000	10000
2			1/18	지출				차비		5000	9500

1. 설계시, 화면에 보이지 않지만 반드시 추가할 컬럼	ex) no (식별자)
2. 화면에 보이지만 데이터로 관리되지 않은 데이터		ex) 잔액/총계/평균값 등 연산처리 결과값
 * */

/*
[하] 4. primary key와 not null을 함께 사용하는 테이블을 일상에서 생각해서 테이블을 각각의 컬럼에
    지정하고 선언해 보세요.
    학과 관리 프로그램에서 학생의 식별자와 이름, 도서관리 프로그램에서 도서식별자와 도서명 등은 
    primary key와 not null로 사용한다.
    
    create table book(
    	bk_kd number primary key,
    	bname varchar2 not null,
    	isuse number(1),	
    	--대출여부 boolean값은 데이터베이스에서 없다. 
    	--number(1) 0/1로 설정하면 boolean전환가능
    	loc char(7)	--위치를 코드값으로 설정, 코드값을 일반적으로 지정된 크기로 char로 설정,
    );
    **/
CREATE TABLE idcard(
	name varchar(20) CONSTRAINT idc_name_nn NOT NULL,
	idno char(13) CONSTRAINT idc_idn_pk PRIMARY KEY,
	address varchar(300) CONSTRAINT idc_addre_nn NOT NULL
	);
INSERT INTO idcard VALUES('홍길동','9001011234567','부천시 원미구 중동');
SELECT * FROM idcard;

/*
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

//[하] 1. js의 기본 출력 형식을 기본 예제를 통해서 기술하세요.
//		alert("출력1");
		console.log("출력2");
		document.write("<h2>출력3</h3>");
		--DOM객체 처리..
		body 하단에 body에서 선언한 h1이 있으면
		document.querySelector("h1").innerHTML="출력4";
		
//[하] 2. js의 기본 데이터 유형에 데이터를 할당해서 확인하고, 데이터유형을 확인 하는 함수를 통해서 유형을 확인하세요.
 	var stringVar = 'String';			문자열
 	var numberVar = 273;				숫자형
 	var booleanVar = true;				불리언
 	var functionVar = function(){ };	함수형
 	var objectVar = {};					객체형
 	
	typeof(변수명|데이터) : 해당 데이터유형을 확인할 수 있는 내장함수.
	 	
 	console.log("typeof(stringVar):"+typeof(stringVar));
 	console.log("typeof(numberVar):"+typeof(numberVar));
 	console.log("typeof(booleanVar):"+typeof(booleanVar));
 	console.log("typeof(functionVar):"+typeof(functionVar));
 	console.log("typeof(objectVar):"+typeof(objectVar));
 
[하] 3. js의 입력/출력 형식과 해당 기능에 대하여 기술하세요.
		# 입력
		- confirm() : boolean(true/false)
		- prompt("메시지","초기값") : 입력된 문자열/null
		
		# 출력
		alert() : 그냥 출력
		console.log()
		document.write()						*/

/*
//[중] 4. 기본 입력/출력 형식을 이용해서 학생의 이름, 국어, 영어, 수학 점수를 입력 받아서, 해당 내용을 
//h3로 화면에 출력하되, 마지막에 평균 출력 여부를 확인하여 확인시에 평균값을 출력하고 취소시 총액을 출력하세요.
		var sname="홍길동";
		var kor = 100;
		var eng = 80;
		var math = 98;
		
document.write("<h3>학생 이름 : "+ sname+"</h3><h3>국어 : "+kor+"</h3><h3>영어 : "+eng+"</h3><h3>수학 : "+math);

var avgOrtotal = confirm("평균값은 확인, 총점은 취소를 눌러주세요.");

if(avgOrtotal){
	 document.write("<h3>평균 : "+(kor+eng+math)/3+"</h3>");
}else{
	 document.write("<h3>총점 : "+(kor+eng+math)+"</h3>");
}

//[중] 5. 물건명/가격/갯수를 입력받아, 출력형식을 선택하게 하여 1:alert(), 2:console, 3:웹화면 로 하여
//    해당 형식으로 화면에 출력하세요 하세요.
	//var name ="사과";
	//var price= 3000;
	//var cnt = 10;
	
	alert("물건명 : "+name+"\n가격 : "+price+"\n갯수 : "+cnt);
	console.log(`물건명 : ${name}
가격 : ${price}
갯수 : ${cnt}`);
 	document.write("<h2>물건명 : "+name+"</h2><h2>가격 : "+price+"</h2><h2>갯수 : "+cnt+"</h2>");
	
//[하] 6. let/var 변수의 차이를 기본예제를 통해서 기술하세요
//		var는 선언하는 순간 전역변수로써 사용이 되는 것이고
//		let는 전역변수와 지역변수를 명확히 구분한다.
{ var variable = 273; }
{console.log("다른 블럭variable:"+variable);}
console.log("전역 블럭variable:"+variable);

{ let variable2 = 273; }
{ console.log("다른 블럭variable2:"+variable2); }
console.log("전역 블럭variable2:"+variable2);
</script>
</head>
<body>
   <h2></h2>
</body>
<script type="text/javascript">
/* 
 
 
*/

//

</script>
*/