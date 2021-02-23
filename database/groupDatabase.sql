CREATE TABLE customer (   
   customer_id varchar2(30),
   pw varchar2(30),
   name varchar2(30),
   address varchar2(200),
   email varchar2(40),
   phone varchar2(20),
   gender char(1), -- 'M','F'
   birth_date DATE,
   reg_date DATE -- 가입일
);

INSERT INTO customer values('himan','7777','홍길동','서울시 강남구 역삼동','himan@gmail.com','010-1234-1234','F',to_date('1995-08-16','YYYY-MM-DD'),sysdate);
INSERT INTO customer values('hiboy','1111','김길동','서울시 강남구 역삼동','hiboy@gmail.com','010-1111-1111','M',to_date('1994-12-11','YYYY-MM-DD'),sysdate);
INSERT INTO customer values('hihi','1212','강길동','경기도 성남시 분당구','hihi@gmail.com','010-3333-5555','F',to_date('1993-11-23','YYYY-MM-DD'),sysdate);
INSERT INTO customer values('leedong','6666','이동이','서울시 서초구','leedong@gmail.com','010-5566-5656','F',to_date('1996-04-23','YYYY-MM-DD'),sysdate);
INSERT INTO customer values('kangkang','3333','이강강','부산 수영구','kangkang@gmail.com','010-8888-8888','F',to_date('1992-08-16','YYYY-MM-DD'),sysdate);
INSERT INTO customer values('leelee','5892','이이삼','경기도 광주시','leelee@gmail.com','010-3333-1212','M',to_date('1990-01-02','YYYY-MM-DD'),sysdate);
INSERT INTO customer values('honghong','1234','홍홍동','서울시 광진구','honghong@gmail.com','010-1010-1010','M',to_date('1991-10-21','YYYY-MM-DD'),sysdate);
INSERT INTO customer values('lala','9999','라길동','서울 동작구','lalala@gmail.com','010-0000-2222','F',to_date('1993-11-11','YYYY-MM-DD'),sysdate);
INSERT INTO customer values('admin','1111','관리자','서울시 강남구 역삼동','admin@gmail.com','010-1111-1111','F',to_date('1994-02-02','YYYY-MM-DD'),sysdate);

SELECT * FROM customer;
DROP TABLE customer;
/*
 * ===========================================================================================================================================
 */
CREATE TABLE customer_manage( --회원관리
   customer_id varchar2(30),
   point NUMBER,
   grade char(1), -- 'A','B','C','D',....
   suspension_part varchar2(30),
   suspension_content varchar2(100),
   suspension_count NUMBER
);

CREATE TABLE questions( --문의
   customer_id varchar2(30),
   question_id NUMBER, -- index
   question_part varchar2(30),
   question_title varchar2(50),
   question_content varchar2(1000),
   question_written_date DATE,
   question_img_src varchar(300),
   question_progress varchar2(30), -- 문의상태
   answer_satisfied NUMBER --1,2,3,4,5
);
-- 관리자테이블
-- 관리테이블 분리?
CREATE TABLE admin( --관리자
   admin_id varchar2(30),
   admin_update_id NUMBER, --index
   last_connection_date DATE,
   admin_update_part varchar2(30),
   updated_table_name varchar2(30),
   updated_table_id NUMBER, --index, 회원 or 회원관리 테이블에 index 값이 필요한가
   updated_reason varchar2(30),
   updated_date date
);

CREATE TABLE review( --리뷰
   customer_id varchar2(30),
   review_id NUMBER,   --index
   review_title varchar2(50),
   review_content varchar2(1000),
   review_satisfied NUMBER,   --만족도
   review_img_src varchar(300), 
   review_written_date DATE,
   thumbs_up NUMBER, --좋아요
   product_id NUMBER,
   product_name varchar2(50)
);

CREATE TABLE forums( --게시판
   customer_id varchar2(30),
   forums_id NUMBER, --index
   forums_part varchar2(50),
   forums_content varchar2(1000),
   forums_written_date date
);

SELECT * FROM PRODUCts;
DROP TABLE products;

CREATE TABLE products( --물품
   product_name varchar2(50),
   product_id NUMBER,
   product_category varchar2(30),
   product_price NUMBER,
   product_stock NUMBER,
   product_rate NUMBER,
   product_img_src varchar2(300)
);

SELECT * FROM products;
DROP TABLE products;
CREATE SEQUENCE products_seq;

INSERT INTO PRODUCTS VALUES('그릇1',products_seq.nextVal,'그릇/홈세트',5000,10,1,'images/detail_img3.jpg');
INSERT INTO PRODUCTS VALUES('그릇2',products_seq.nextVal,'그릇/홈세트',6000,10,2,'images/detail_img2.jpg');
INSERT INTO PRODUCTS VALUES('그릇3',products_seq.nextVal,'그릇/홈세트',7000,10,3,'images/detail_img1.jpg');
INSERT INTO PRODUCTS VALUES('그릇4',products_seq.nextVal,'그릇/홈세트',8000,10,4,'images/bowl08.jpg');
INSERT INTO PRODUCTS VALUES('그릇5',products_seq.nextVal,'그릇/홈세트',9000,10,5,'images/bowl07.jpg');
INSERT INTO PRODUCTS VALUES('그릇6',products_seq.nextVal,'그릇/홈세트',9000,10,6,'images/bowl06.jpg');

INSERT INTO PRODUCTS VALUES('볼볼홈파티 스푼',products_seq.nextVal,'그릇/홈세트',10000,10,7,'images/detail_img1.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티 그릇',products_seq.nextVal,'그릇/홈세트',20000,10,8,'images/detail_img2.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티 주병세트',products_seq.nextVal,'그릇/홈세트',8700,10,9,'images/detail_img3.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티 시리얼',products_seq.nextVal,'그릇/홈세트',7000,10,10,'images/detail_img4.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티 소서',products_seq.nextVal,'그릇/홈세트',6000,10,11,'images/detail_img5.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티1',products_seq.nextVal,'그릇/홈세트',10000,50,12,'images/list_img1.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티2',products_seq.nextVal,'그릇/홈세트',10000,50,13,'images/list_img2.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티3',products_seq.nextVal,'그릇/홈세트',10000,50,14,'images/list_img3.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티4',products_seq.nextVal,'그릇/홈세트',10000,50,15,'images/list_img4.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티5',products_seq.nextVal,'그릇/홈세트',10000,50,16,'images/list_img5.jpg');

/*
 * ===========================================================================================================================================
 */
CREATE TABLE purchase_record( -- 구매기록
   customer_id varchar2(30),
   purchase_id NUMBER,
   product_name varchar2(50),
   product_id NUMBER,
   purchase_step varchar2(20), -- 장바구니 단계, 구매
   purchase_step_date DATE   -- 구매단계설정날짜
);
INSERT INTO purchase_record values('test',1,'어반데일리 플레이트',100,'장바구니',sysdate-100);
INSERT INTO purchase_record values('test',2,'볼볼빈티지 플레이트',101,'장바구니',sysdate-95);
INSERT INTO purchase_record values('test',3,'볼볼홈파티 플레이트',102,'장바구니',sysdate-80);
INSERT INTO purchase_record values('test',4,'레트로라인 플레이트',103,'구매완료',sysdate-70);
INSERT INTO purchase_record values('test',5,'디저트 플레이트',104,'구매완료',sysdate-50);
INSERT INTO purchase_record values('test',6,'오발 플레이트',105,'구매완료',sysdate-46);
INSERT INTO purchase_record values('test',7,'멀티볼',106,'구매완료',sysdate-30);
INSERT INTO purchase_record values('test',8,'볼볼빈티지 공기',107,'장바구니',sysdate-20);
INSERT INTO purchase_record values('test',9,'볼볼빈티지 대접',108,'장바구니',sysdate-10);
INSERT INTO purchase_record values('test',10,'레트로 라인 대접',109,'장바구니',sysdate);
SELECT * FROM PURCHASE_RECORD pr ;
DROP TABLE PURCHASE_RECORD ;

SELECT product_name, product_price FROM PRODUCTS
WHERE product_id=(SELECT max(product_id)
            FROM PRODUCTS);
           
SELECT product_name, product_price FROM products
ORDER BY PRODUCT_ID ;
           
SELECT product_name, product_price FROM PRODUCTS
WHERE product_id <(SELECT max(PRODUCT_ID) FROM products);


SELECT rownum, p.* from(
	SELECT * from products 
	ORDER BY product_price DESC
)p
WHERE rownum BETWEEN 1 AND 4;


SELECT * FROM emp;

CREATE TABLE review(
   customer_id varchar2(30),
   re_id NUMBER, /*리뷰아이디*/
   re_pass varchar2(30), /*리뷰비밀번호(수정,삭제페이지에서 본인확인용)*/
   re_title varchar2(50), 
   re_content varchar2(3000),
   re_grade NUMBER,
   re_date DATE,
   product_id NUMBER,
   product_name varchar2(50)
);
