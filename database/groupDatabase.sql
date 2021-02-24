DROP TABLE purchase_record;
CREATE TABLE purchase_record( -- 구매기록
   customer_id varchar2(30),
   purchase_id NUMBER,
   product_name varchar2(50),
   product_id NUMBER,
   purchase_step varchar2(20), -- 장바구니 단계, 구매
   purchase_step_date DATE   -- 구매단계설정날짜
);
INSERT INTO purchase_record values('test',1,'볼볼홈파티 스푼',7,'장바구니',sysdate-100);
INSERT INTO purchase_record values('test',2,'볼볼홈파티 그릇',8,'장바구니',sysdate-95);
INSERT INTO purchase_record values('test',3,'볼볼홈파티 주병세트',9,'장바구니',sysdate-80);
INSERT INTO purchase_record values('test',4,'볼볼홈파티 시리얼',10,'구매완료',sysdate-70);
INSERT INTO purchase_record values('test',5,'볼볼홈파티 소서',11,'구매완료',sysdate-50);
INSERT INTO purchase_record values('test',6,'볼볼홈파티1',12,'구매완료',sysdate-46);
INSERT INTO purchase_record values('test',7,'볼볼홈파티2',13,'구매완료',sysdate-30);
INSERT INTO purchase_record values('test',8,'그릇4',4,'장바구니',sysdate-20);
INSERT INTO purchase_record values('test',9,'그릇5',5,'장바구니',sysdate-10);
INSERT INTO purchase_record values('test',10,'그릇6',6,'장바구니',sysdate);
INSERT INTO purchase_record values('hiboy',11,'볼볼홈파티 소서',11,'구매완료',sysdate-70);
INSERT INTO purchase_record values('himan',12,'볼볼홈파티1',12,'구매완료',sysdate-20);
INSERT INTO purchase_record values('hihi',13,'볼볼홈파티 소서',11,'구매완료',sysdate-5);
INSERT INTO purchase_record values('leedong',14,'볼볼홈파티 그릇',8,'구매완료',sysdate-3);
INSERT INTO purchase_record values('kangkang',15,'볼볼홈파티 주병세트',9,'구매완료',sysdate-1);
INSERT INTO purchase_record values('lala',16,'볼볼홈파티 소서',11,'구매완료',sysdate);
INSERT INTO purchase_record values('gilgil',17,'볼볼홈파티 그릇',8,'구매완료',sysdate-18);
SELECT * FROM purchase_record
WHERE purchase_step='장바구니'
ORDER BY purchase_step_date asc ;

DROP TABLE PURCHASE_RECORD ;

SELECT * FROM PURCHASE_RECORD;

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
CREATE SEQUENCE re_id_sequence
INCREMENT BY 1
START WITH 1000
MINVALUE 1000
MAXVALUE 9999;
SELECT * FROM review;
/*회원아이디,리뷰아이디,리뷰제목,리뷰내용,만족도,이미지,날짜,좋아요,제품아이디,제품명*/
INSERT INTO review values('aaa123',re_id_sequence.nextval,'매우만족','이뻐요.',
      4,'images/detail_img1.jpg',to_date('2020-03-08','YYYY-MM-DD'),10,'1000','자기그릇');
INSERT INTO review values('bbb123',re_id_sequence.nextval,'다소만족','귀여워요.',
      5,'images/detail_img2.jpg',to_date('2020-05-09','YYYY-MM-DD'),9,'1001','디저트그릇');
INSERT INTO review values('ccc123',re_id_sequence.nextval,'약간만족','튼튼해요.',
      3,'images/detail_img3.jpg',to_date('2020-08-12','YYYY-MM-DD'),8,'1002','빈티지그릇');
INSERT INTO review values('dd123',re_id_sequence.nextval,'보통','그냥 그래요.',
      3,'images/detail_img4.jpg',to_date('2020-09-01','YYYY-MM-DD'),7,'1003','레트로그릇');
INSERT INTO review values('eee123',re_id_sequence.nextval,'별로','금가서 왔어요.',
      1,'images/detail_img5.jpg',to_date('2020-10-07','YYYY-MM-DD'),6,'1004','특가그릇');
INSERT INTO review values('fff123',re_id_sequence.nextval,'불만족','화면이랑 달라요',
      1,'images/detail_img4.jpg',to_date('2020-07-01','YYYY-MM-DD'),7,'1003','레트로그릇');
INSERT INTO review values('ggg123',re_id_sequence.nextval,'좋아요','이뻐요.',
      4,'images/detail_img3.jpg',to_date('2020-02-08','YYYY-MM-DD'),8,'1002','빈티지그릇');
INSERT INTO review values('hhh123',re_id_sequence.nextval,'별로','그저 그래요.',
      3,'images/detail_img1.jpg',to_date('2020-06-07','YYYY-MM-DD'),10,'1000','자기그릇');
INSERT INTO review values('iii123',re_id_sequence.nextval,'만족해요','이쁘네요.',
      5,'images/detail_img2.jpg',to_date('2020-05-04','YYYY-MM-DD'),9,'1001','디저트그릇');
INSERT INTO review values('jjj123',re_id_sequence.nextval,'좋아요','굿.',
      4,'images/detail_img4.jpg',to_date('2020-03-03','YYYY-MM-DD'),7,'1003','레트로그릇');
INSERT INTO review values('kkk123',re_id_sequence.nextval,'보통','재구매할게요.',
      4,'images/detail_img5.jpg',to_date('2020-04-09','YYYY-MM-DD'),6,'1004','특가그릇');

     SELECT * FROM review;


SELECT rownum, p.* from(
	SELECT * FROM products
	ORDER BY product_rate DESC
	)p
	WHERE rownum BETWEEN 1 AND 4;


SELECT * FROM products;
DROP TABLE products;
CREATE SEQUENCE products_seq;

CREATE TABLE products( --물품
   product_name varchar2(50),
   product_id NUMBER,
   product_category varchar2(30),
   product_price NUMBER,
   product_stock NUMBER,
   product_rate NUMBER,
   product_img_src varchar2(300)
);

INSERT INTO PRODUCTS VALUES('그릇1',products_seq.nextVal,'그릇/홈세트',5000,10,16,'images/detail_img3.jpg');
INSERT INTO PRODUCTS VALUES('그릇2',products_seq.nextVal,'그릇/홈세트',6000,10,15,'images/detail_img2.jpg');
INSERT INTO PRODUCTS VALUES('그릇3',products_seq.nextVal,'그릇/홈세트',7000,10,14,'images/detail_img1.jpg');
INSERT INTO PRODUCTS VALUES('그릇4',products_seq.nextVal,'그릇/홈세트',8000,10,13,'images/bowl08.jpg');
INSERT INTO PRODUCTS VALUES('그릇5',products_seq.nextVal,'그릇/홈세트',9000,10,12,'images/bowl07.jpg');
INSERT INTO PRODUCTS VALUES('그릇6',products_seq.nextVal,'그릇/홈세트',9000,10,11,'images/bowl06.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티 스푼',products_seq.nextVal,'그릇/홈세트',10000,10,10,'images/detail_img1.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티 그릇',products_seq.nextVal,'그릇/홈세트',20000,10,9,'images/detail_img2.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티 주병세트',products_seq.nextVal,'그릇/홈세트',8700,10,8,'images/detail_img3.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티 시리얼',products_seq.nextVal,'그릇/홈세트',7000,10,7,'images/detail_img4.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티 소서',products_seq.nextVal,'그릇/홈세트',6000,10,6,'images/detail_img5.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티1',products_seq.nextVal,'그릇/홈세트',10000,50,5,'images/list_img1.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티2',products_seq.nextVal,'그릇/홈세트',10000,50,4,'images/list_img2.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티3',products_seq.nextVal,'그릇/홈세트',10000,50,3,'images/list_img3.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티4',products_seq.nextVal,'그릇/홈세트',10000,50,2,'images/list_img4.jpg');
INSERT INTO PRODUCTS VALUES('볼볼홈파티5',products_seq.nextVal,'그릇/홈세트',10000,50,1,'images/list_img5.jpg');







SELECT p.*, purchase_step, PURCHASE_ID 
FROM PURCHASE_RECORD pr, PRODUCTS p 
WHERE pr.PRODUCT_NAME = p.PRODUCT_NAME
AND PURCHASE_STEP ='장바구니';


UPDATE purchase_record
SET  purchase_step='구매완료'
WHERE product_id = '';









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
INSERT INTO customer values('test','2222','이탁구','서울 강남구','test@gmail.com','010-1234-5678','F',to_date('1993-11-11','YYYY-MM-DD'),sysdate);

SELECT * FROM customer;


