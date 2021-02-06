/*[데이터베이스]
[하] 1. 사원 테이블 emp60테이블을 emp테이블에서 복사를 하여, empno 프라이머리, ename not null, job (emp의 job데이터), 
					hiredate(2001이후로 입력), sal(0이상), deptno(dept테이블 deptno참조) 로 설정해서 입력 하세요*/
CREATE TABLE emp60
AS SELECT * FROM emp;

ALTER TABLE EMP60 
ADD CONSTRAINT emp_empno_pk PRIMARY KEY(empno);

ALTER TABLE EMP60 
MODIFY(ename CONSTRAINT emp_ename_nn NOT null);

ALTER TABLE EMP60 
ADD CONSTRAINT emp60_emp_fk FOREIGN KEY(job) REFERENCES emp(job);
--해당 내용이 foreign key는 unique/primary key/////////////////////////////
SELECT DISTINCT job FROM EMP ;
ALTER TABLE emp60 ADD CONSTRAINT emp60_job_ck
CHECK(job IN('CLERK','SALESMAN','PRESIDENT','MANAGER','ANALYST'));

CREATE TABLE TMP_EMP
AS SELECT EMPNO, ADD_MONTHS(HIREDATE,12*20) HIREDATE FROM EMP;

UPDATE EMP60 a
SET hiredate = (
SELECT hiredate FROM tmp_emp b WHERE a.empno=b.empno
);

SELECT * FROM emp60;

ALTER TABLE EMP60 
ADD CONSTRAINT emp60_hiredate_ck CHECK(hiredate>to_date('2001-01-01','YYYY-MM-DD'));


ALTER TABLE EMP60 
ADD CONSTRAINT emp60_sal_ck check(sal>=0);

ALTER TABLE EMP60 
ADD CONSTRAINT emp60_deptno_fk FOREIGN key(deptno) REFERENCES dept(deptno);

/*[하] 2. emp60 설정된 제약조건, 삭제, 활성화/비활성화 처리를 하세요. */
ALTER TABLE EMP60 
disable CONSTRAINT emp_empno_pk;

ALTER TABLE EMP60 
ensable CONSTRAINT emp_empno_pk;

ALTER table emp60;
drop constraint emp_empno_pk;

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
</head>
<body>
      	<h3>예제1번</h3>
   		<table width="30%" border>
			<tr><th>번호</th><th>순위</th><tr>	
   		</table>
   		
   		<h2>무지개</h2>
   		
</body>
<script type="text/javascript">
/* 
[하] 1. 배열에 좋아하는 가수이름을 3명 선언하고, 테이블 형식(번호, 이름)으로 출력하세요.*/
		var singer = ["chopin","liszt","mozart"];
		var show="";
		
		for(var idx=0; idx<singer.length; idx++){
			show+="<tr><td>"+(Number(idx)+1)+"</td><td>"+singer[idx]+"</td></tr>";
		}
		document.querySelector("table").innerHTML+=show;
		
/*
[하] 2. js의 for 반복문 형식 3가지를 기술하세요.
			-for(var idx=0; idx<배열명; idx++){}
			-for(var idx in 배열명){
			idx : 배열의 index 값
			배열명[idx] : 배열의 값
			}
			-for(var idx in 배열)						*/
				
//[하] 3. 무지개 보이기 - 배열선언후(한글무지개색상),for in 활용하여 h2(7개가) 무지개 글자로(빨/주/노/초/파/남/보)으로 출력되게 하게요.
		var rainbow = ["빨","주","노","초","파","남","보"];
		var show1 = "";
		
		for(var idx in rainbow){
			show1+="<h2>"+rainbow[idx]+"</h2>";
		}
		document.querySelector("h2").innerHTML += show1;
//[중] 4. 무지개 보이기 - 배열선언후(영문무지개색상)h1을 클릭시, 
//		forEach활용하여 보이지 않던 하단의 h2(7개가) 배경색상을 무지개 색상으로 글자는 영문으로 출력되게 하게요.


</script>