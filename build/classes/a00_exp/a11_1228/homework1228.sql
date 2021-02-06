/*
1. 숫자형 함수의 종류와 기능상 특징을 기술하세요.
	- 숫자형 데이터의 연산, 수학적 처리를 도와 원하는 값의 형태로 출력을 도와줌
	1) round(데이터,자리수)	: +값은 소수점 자리를 뜻하고 -는 10의자리 숫자를 표현, 지정한 자리로 반올림을 도와준다.
	2) trunc(데이터,자리수)	: 지정한 소수점 자리수까지 남기고 절삭
	3) mod(데이터, i)		: 데이터를 i로 나눈 나머지, %의 기능을 한다.
	4) ceil				: 지정한 값보다 큰 수 중에서 가장 작은 정수
	5) floor			: 지정한 값보다 작은 수 중에서 가장 큰 정수
	
	==> 1. 자리수 처리
		round(데이터, 자리수) : 반올림
		trunc(데이터, 자리수) : 절삭처리
		2. 정수로 처리
		ceil(데이터) : 올림
		floor(데이터): 내림
		3.mod(m,n)	: m에서n을 나눈 나머지 
	
2. 부서 번호를 %로 해서, 10 ==> 10%, 20==>20%..
   보너스를 정하여, sal기준으로 원금+보너스 합산을 출력하되,
   10자리단위로 반올림 처리하여 출력하세요
   사원명, 급여, 보너스(%), 보너스, 총계*/
SELECT * FROM emp;
SELECT ename 사원명, sal 급여, rpad(deptno,3,'%') "보너스(%)",
		sal*(deptno/100) 보너스,round(sal+sal*(deptno/100),-1)  총계
FROM emp;

/* 3. 사번이 짝수인 사원의 사번과 이름과 급여를 출력하되, 급여는 100자리 수로 절삭하여 처리하세요.*/
SELECT empno 사번, ename 이름,sal 급여, trunc(sal,-2) 급여
FROM emp
WHERE MOD(empno,2)=0;

/* 
4. floor와 trunc의 차이점을 기본 예제로 설명하세요.
	- floor은 아예 정수로 절삭처리를 하는 반면 trunc는 범위를 지정할 수 있다.
	
	- floor()	: 정수로 절삭(소수점 이하는 절삭)
	- trunc()	: 지정한 자리수만큼 확보하여 절삭
	**/
	SELECT 24.75, floor(24.75),trunc(24.75,1)
	FROM dual;
/*
5. 날짜형 데이터에 증감단위를 일, 월, 년을 정할 때, 사용되는 연산자와 함수 또는 연산자+함수 조합으로
   처리되는 내용을 예제로 기술하세요.
   - 날짜형 데이터 +1 : 일단위 증가, add_months(날짜데이터,1) : 한달 증가, 
   	 add_months(날짜데이터,월*12) : 연단위 증가
   
   
    */
	SELECT sysdate 오늘날짜, ADD_MONTHS(sysdate,1) "한달뒤 날짜", ADD_MONTHS(SYSDATE,12) "1년뒤 날짜",
			ADD_MONTHS(SYSDATE,12*10) "10년뒤 날짜"
	FROM dual;

--6. 사원, 이름과 입사후 300일 날짜, 지금까지 근무연한(일년 - 365 기준)를 출력
SELECT empno, ename, hiredate+300 "입사후 300일날짜", 
	floor(MONTHS_BETWEEN(sysdate, HIREDATE)/12)||'년' "지금까지 근무한 년수"
FROM emp;


SELECT ename, hiredate +300 "입사후 300일",
	floor((SYSDATE-hiredate)/365) "근무 년수"
FROM emp;

--7. 오늘을 1일로, 1000일 후 개월수, 10000 후 년수를 출력하세요.*/
select SYSDATE 오늘, floor(MONTHS_BETWEEN(sysdate+1000,sysdate))||'개월' "1000일 후 개월수",
		floor(MONTHS_BETWEEN(SYSDATE+10000,sysdate)/12)||'년' "10000일 후 년수"
FROM dual;

SELECT sysdate "1일", SYSDATE+1000 "1000일 후",
		substr(sysdate+1000,4,2)"1000일후 월수",
		SYSDATE +10000 "10000일 후"
FROM dual;


=====================================================================================================
/*
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
1. table에서 rowspan, colspan의 의미와 col태그의 의미를 기본 예제(3X3 테이블)와 함께 기술하세요.
	rowspan : 행 병합
	colsapn : 열 병합
	col 태그	: 
-->
<h2 align='center'>ex1)</h2>
 <table width="100" height="100" border="1" align='center'>
 	<col width="33%">
 	<col width="33%">
 	<col width="33%">
 	<tr><td colspan="2">1,2</td><td>3</td></tr>
 	<tr><td>4</td><td rowspan="2">5,8</td><td>6</td></tr>
 	<tr><td>7</td><td>9</td></tr>
 </table>
<!--
2. 3*3테이블에서
       1  2  3    
       4  5  6
       7  8  9
       1,4,7 병합처리, 2,3병합, 8,9병합 -->
 <h2 align='center'>ex2)</h2>
 <table width="200" height="200" border="1" align='center'>
 	<tr><td rowspan="3">1</td><td colspan="2">2</td></tr>
 	<tr><td>5</td><td>6</td></tr>
 	<tr><td colspan="2">8</td></tr>
 </table>
<!--
3. 4*4테이블에서 
    1  2  3  4
    5  6  7  8
    9 10 11 12
   13 14 15 16   1,5,9,13 병합, 6,7,10,11 병합, 14,15,16 병합 처리하세요.-->
<h2 align='left'>4X4</h2>
 <table width="200" height="200" border="1" align='left'>
 <col width="25%">
 <col width="25%">
 <col width="25%">
 <col width="25%">
 	<tr><td rowspan="4">1</td><td>2</td><td>3</td><td>4</td></tr>
 	<tr><td rowspan="2" colspan="2">6</td><td>8</td></tr>
 	<tr><td>12</td></tr>
 	<tr><td colspan="3">14</td></tr>
 </table> 
<!--
4. 5*5 테이블 만들어 모두의 마블 같은 모양으로 테두리를 1부터시작하여 번호를 넘버링하고, 중간을 비운 테이블을 구성하세요.-->
 <h2 align='center'>모두의 마블</h2>
 <table width="200" height="200" border="1" align='center'>
 	<col width="20%">
 	<col width="20%">
 	<col width="20%">
 	<col width="20%">
 	<col width="20%">
 	<tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td></tr>
 	<tr><td>16</td><td rowspan="3" colspan="3"></td><td>6</td></tr>
	<tr><td>15</td><td>7</td></tr>
	<tr><td>14</td><td>8</td></tr>
	<tr><td>13</td><td>12</td><td>11</td><td>10</td><td>9</td></tr>
 </table>

</body>
</html>
*/