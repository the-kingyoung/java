CREATE TABLE customer (   --회원
   customer_id varchar2(30),
   pw varchar2(30),
   name varchar2(30),
   address varchar2(100),
   email varchar2(40),
   phone varchar2(20),
   gender char(1), -- 'M','F'
   birth_date DATE,
   reg_date DATE -- 가입일
);

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

CREATE TABLE products( --물품
   product_name varchar2(50),
   product_id NUMBER,
   product_category varchar2(30),
   product_price NUMBER,
   product_stock NUMBER,
   product_weight NUMBER, -- 중량
   product_capacity NUMBER, -- 용량
   product_img_src varchar2(300),
   packing_type varchar2(50) -- 포장타입
);
SELECT * FROM PRODUCts;
DROP TABLE PRODUCTs;
/*
1. 데이터를 products에 다 집어넣는다. 단 img는 찾아갈수 있게 경로를 지정한다.
 */
CREATE SEQUENCE products_seq;

INSERT INTO PRODUCTS VALUES('그릇1',products_seq.nextVal,'음식접시',5000,3,100,10,'images/bowl02.jpg','박스포장');
INSERT INTO PRODUCTS VALUES('그릇2',products_seq.nextVal,'음식접시',5000,3,100,10,'images/bowl03.jpg','박스포장');
INSERT INTO PRODUCTS VALUES('그릇3',products_seq.nextVal,'음식접시',5000,3,100,10,'images/bowl04.jpg','박스포장');

CREATE TABLE purchase_record( -- 구매기록
   customer_id varchar2(30),
   purchase_id NUMBER,
   product_name varchar2(50),
   product_id NUMBER,
   purchase_step varchar2(20), -- 장바구니 단계, 구매
   purchase_step_date DATE   -- 구매단계설정날짜
);