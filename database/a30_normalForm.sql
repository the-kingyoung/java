/*
# 정규화
1. 이상 현상이 발생하지 않도록, 릴레이션을 관련있는 속성들로만 
구성하기 위해 릴레이션을 분해(decomposition)하는 과정
함수적 종속성을 판단하여 정규화를 수행함
-릴레이션 : 테이블 내에 컬럼들간의 관계

2. 함수 종속
-테이블 내의 컬럼간의 속성이 서로 연관관계를 확인할 때, 사용되는 개념.
ex) 사원테이블에서 사원번호와 사원명과의 관계를 함수적으로 종속이 되느냐를
	확인하는 부분
	사원번호를 알때, 학년, 사원명, 주민번호, 전공명
	
"X가 Y를 함수적으로 결정한다"
릴레이션 내의 모든 투플에서 하나의 X값에 대한 Y값이 항상 하나임
X와Y는 하나의 릴레이션을 구성하는 속성들의 부분 집합
"Y가 X에 함수적으로 종속되어있다"와 같은 의미
X->Y로 표현(X는 결정자, Y는 종속자)
3. 함수 종속 관계 판단 시 유의 사항
속성 자체의 특성과 의미를 기반으로 함수 종속성을 판단해야함
속성 값은 계속 변할수 있으므로 현재 릴레이션에 포함된 속성 값만으로 판단하면 안됨
일반적으로 기본키와 후보키는 릴레이션의 다른 모든 속성들을 함수적으로 결정함
기본키나 후보키가 아니어도 다른 속성 값을 유일하게 결정하는 속성은 함수 종속 관계에서 
결정자가 될 수 있음

4. 완전 함수 종속(FFD; Full Functional Dependency)
릴레이션에서 속성 집합 Y가 속성 집합 X에 함수적으로 종속되어 있지만,
속성 집합 X의 전체가 아닌 일부분에는 종속되지 않음을 의미
일반적으로 함수 종속은 완전 함수 종속을 의미함
ex) 당첨여부는 {고객아이디, 이벤트번호}에 완전 함수 종속됨
* 테이블의 구성은 모든 키에 완전 함수 종속성이 있을때 완성된다.
* 
5. 부분 함수 종속 (PFD; Partial Functional Dependency)
릴레이션에서 속성 집합 Y가 속성 집합 X의 전체가 아닌 일부분에도 함수적으로 종속됨을 의미
6. 정규화(normalization)
1) 개념
	함수 종속성을 이용해 릴레이션을 연관성이 있는 속성들로만 구성되도록 분해해서,
	이상 현상이 발생하지 않는 올바른 릴레이션으로 만들어가는 과정
	기본 목표 : 관련이 없는 함수 종속성은 별개의 릴레이션으로 표현
2) 주의 사항
	정규화를 통해 릴레이션은 무손실 분해(nonloss decomposition)되어야 함
	릴레이션이 의미상 동등한 릴레이션들로 분해되어야 하고, 분해로 인한 정보 손실이 발생하지 않아야함
	분해된 릴레이션들을 자연 조인하면 분해 전의 릴레이션으로 복원 가능해야함
3) 정규형(NF; Normal Form)
	릴레이션이 정규화된 정도
	각 정규형마다 제약조건이 존재
	정규형의 차수가 높아질수록 요구되는 제약조건이 많아지고 엄격해짐
	릴레이션의 특성을 고려해서 적합한 정규형을 선택
4) 정규화 과정.
	- 제 1 정규형(1NF; First Normal Form)
	릴레이션의 모든 속성이 더는 분해되지 않는 원자 값(atomic value)만 가지면
    제 1정규형을 만족함 제 1 정규형을 만족해야 관계 데이터베이스의 릴레이션이 될 자격이 있음
    예) 고객이름은 {고객아이디, 이벤트번호}에 부분 함수 종속됨
*/
CREATE TABLE normalform1(
	cus_id varchar2(30),
	event_no varchar2(30),
	is_checked varchar2(30),
	grade varchar2(30),
	discount number
);
SELECT * FROM event;
INSERT INTO normalform1 values('apple','E001,E005,E010','Y,N,Y','gold',0.5);
INSERT INTO normalform1 values('banana','E002','N,Y','vip',0.2);
INSERT INTO normalform1 values('carrot','E003,E007','Y,Y','gold',0.1);
INSERT INTO normalform1 values('orange','E004','N','silver',0.05);
SELECT * FROM normalform1;
-- normalform1를 원자값:테이블의 컬럼에 데이터는 1개의 데이터가 들어서 처리되어야 한다.
--제1정규화가 처리된 normalform2테이블을 만들고 데이터 입력 처리 결과를 확인 해주세요.
CREATE TABLE normalform2(
	cus_id varchar2(30),
	event_no varchar2(30),
	is_checked varchar2(30),
	grade varchar2(30),
	discount number
);
INSERT INTO normalform2 values('apple','E001','Y','gold',0.5);
INSERT INTO normalform2 values('apple','E005','N','gold',0.5);
INSERT INTO normalform2 values('apple','E010','Y','gold',0.5);
INSERT INTO normalform2 values('banana','E002','Y','vip',0.2);
INSERT INTO normalform2 values('banana','E002','N','vip',0.2);
INSERT INTO normalform2 values('carrot','E003','Y','gold',0.1);
INSERT INTO normalform2 values('carrot','E007','Y','gold',0.1);
INSERT INTO normalform2 values('orange','E004','N','silver',0.05);
SELECT * FROM normalform2;
/*
	- 제 2 정규형(2NF; Second Normal Form)
	릴레이션이 제 1 정규형에 속하고, 기본키가 아닌 모든 속성이 기본키에
	완전 함수 종속되면 제 2 정규형을 만족함
	제 1 정규형에 속하는 릴레이션이 제 2 정규형을 만족하게 하려면 ?
	부분 함수 종속을 제거하고 모든 속성이 기본키에 완전 함수 종속되도록 분해
	ex) 1정규화가 끝난 테이블을 완전 함수 종속적으로
	normalform3_1, normalform3_2로 테이블을 분리시켜 2정규화를 처리하세요 
*/
CREATE TABLE normalform3_1
AS SELECT DISTINCT cus_id, grade, discount FROM normalform2;

CREATE TABLE normalform3_2
AS SELECT DISTINCT cus_id, event_no, is_checked
FROM normalform2
ORDER BY event_no;

SELECT * FROM normalform3_1;
SELECT * FROM normalform3_2;

/*
	- 이행적 함수 종속(transitive FD)
	릴레이션을 구성하는 3개의 속성 집합X, Y, Z에 대해 함수 종속 관계 X->Y와 Y->Z가
	존재하면 논리적으로 X->Z가 성립되는데, 이때 Z가 X에 이행적으로 함수 종속되었다고 함
	
	-제 3 정규형(3NF; Third Normal Form)
		릴레이션이 제 2 정규형에 속하고, 기본키가 아닌 모든 속성이 기본키에 이행적 함수 종속이
		되지 않으면 제 3 정규형을 만족함. 제 2 정규형에 속하는 릴레이션이 제 3정규형을 만족하게 하려면 ?
		모든 속성이 기본키에 이행적 함수 종속이 되지 않도록 분해
		ex)normalform3_1테이블을 이행적 함수 종속에 의해 분리시켜
		normalform4_1, normalform4_2로 분리시켜 제 3 정규형 처리를 완료하세요.
*/
CREATE TABLE normalform4_1
AS SELECT DISTINCT cus_id, grade FROM normalform2;

UPDATE NORMALFORM3_1 
SET discount=0.1
WHERE grade='gold';

CREATE table normalform4_2
AS SELECT DISTINCT grade, discount
FROM normalform3_1
ORDER BY grade;

SELECT * FROM normalform4_1;
SELECT * FROM normalform4_2;
/*
# 보이스/코드 정규형(BCNF; Boyce/Codd Normal Form)
1. 필요성
하나의 릴레이션에 여러개의 후보키가 존재하는 경우, 제 3 정규형까지 모두 만족해도 이상 현상이 발생할 수 있음
2. 의미
강한 제 3 정규형(strong 3NF)
후보키를 여러개 가지고 있는 릴레이션에 발생할 수 있는 이상 현상을 해결하기 위해
제 3 정규형보다 좀 더 엄격한 제약조건을 제시
보이스/코드 정규형에 속하는 모든 릴레이션은 제 3 정규형에 속하지만,
제 3정규형에 속하는 모든 릴레이션이 보이스/코드 정규형에 속하는 것은 아님.
*/
CREATE TABLE normalBCNF(
	cus_id varchar2(20),
	inter_less varchar2(30),
	tech_no char(4)
);
SELECT * FROM normalBCNF;
INSERT INTO normalBCNF values('apple','영어회화','P001');
INSERT INTO normalBCNF values('banana','기초토익','P002');
--삭제이상  : banana로 신청한 기초토익과 담당강사번호 정보가 삭제가 된다.
INSERT INTO normalBCNF values('carrot','영어회화','P001');

INSERT INTO normalBCNF values('carrot','기초토익','P004');
--데이터 불일치 : 입력 오류로 불일치 발생.
INSERT INTO normalBCNF values('orange','영어회화','P003');
INSERT INTO normalBCNF values('orange','기초토익','P004');
--데이터 불일치 : 입력오류로 불일치 발생.
INSERT INTO normalBCNF values(NULL,'중급토익','P005');
--강좌와 담당 강사 번호만 입력했을 때, 삽입이상이 발생한다.

CREATE TABLE normalBCNF2
AS SELECT cus_id,tech_no FROM normalBCNF;

CREATE TABLE normalBCNF3
AS SELECT DISTINCT tech_no, inter_less FROM normalBCNF
ORDER BY tech_no;

SELECT * FROM normalBCNF2;
SELECT * FROM normalBCNF3;



















