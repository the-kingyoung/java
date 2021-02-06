/*
1. 테이블명의 변경
	1) 형식
		rename 기존테이블명 to 새로운 테이블명
*/
SELECT * FROM emp51;

RENAME emp51 TO emp52;

SELECT * FROM emp52;
/*
2. 컬럼명 변경
 	1) alter table 테이블명
 	   rename column 기존컬럼명 to 새로운 컬럼명;
*/
SELECT * FROM emp50;
ALTER TABLE EMP50 
RENAME COLUMN empno TO NO;
/*
1. 테이블 변경명 명령어를 활용하여 아래 내용을 처리하세요.
	1) emp53으로 구조복사해서 테이블 만들고,
	*/
	CREATE TABLE emp53
	AS SELECT * FROM emp WHERE 1=0;
/*
	2) dept테이블의 dname, loc를 추가
	 	salgrade의 grade 추가
	 		*/
	ALTER TABLE emp53
	add(dname varchar2(30), loc varchar2(30), grade number(1));
/*
	3) deptno 컬럼 삭제.
		*/
	ALTER TABLE emp53
	DROP COLUMN deptno;
/*
	4) subquery를 이용해서 해당 데이터에 맞게 데이터를 입력
		*/
	INSERT INTO emp53
	SELECT empno, ename, job, mgr, hiredate, sal,
			comm, dname, loc, grade
	FROM emp e, dept d, salgrade s
	WHERE e.deptno = d.deptno
	AND e.sal BETWEEN s.losal AND s.hisal;

SELECT * FROM emp53;
	
/*
	5) hiredate의 credte로 컬럼명 변경, 
	*/
	ALTER TABLE emp53
	RENAME COLUMN hiredate TO credte;
/*	데이터가 입력된 상황에서 데이터 유형이 다른 컬럼으로 변경처리 할때
 * 	1. 임시테이블이나 다른 테이블에 해당 key와 변경할 데이터가 저장되어 있어야 한다.
 * 
	6) 데이터 삭제 후 varchar2로 변경하여 2001/12/12 형식으로 데이터 입력 처리
	--특정한 컬럼의 데이터의 삭제는 update구문을 통해서 처리한다.
	--기본에 있는 데이터의 type를 문자=>숫자, 날짜=>문자 는 데이터를 삭제 후 처리한다.
*/
	UPDATE emp53
	SET credte = NULL;
	ALTER TABLE emp53
	MODIFY credte char(10);
/*
 	7) 데이터 입력처리
 */
	UPDATE emp53 b
	SET credte = (SELECT to_char(hiredate,'YYYY/MM/DD')
					FROM emp a
					WHERE a.empno=b.empno);
	--수정처리할 기준으로 기존테이블에 있는 empno와 
	--입력할 테이블 empno의 join관계로 수정.
	
	SELECT * FROM emp53;
