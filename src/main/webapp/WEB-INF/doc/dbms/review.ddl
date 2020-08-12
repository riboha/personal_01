/**********************************/
/* Table Name: 리뷰 */
/**********************************/

DROP TABLE review CASCADE CONSTRAINTS;

CREATE TABLE review(
		reviewno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		title                         		VARCHAR2(100)		 NOT NULL,
		review                        		VARCHAR2(1000)		 NOT NULL,
		rate                          		NUMBER(2, 1)		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		payno                         		NUMBER(10)		 NOT NULL,
		memberno                      		NUMBER(10)		 NOT NULL,
		filmno                        		NUMBER(10)		 NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (payno) REFERENCES pay (payno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE review is '리뷰';
COMMENT ON COLUMN review.reviewno is '리뷰 번호';
COMMENT ON COLUMN review.title is '제목';
COMMENT ON COLUMN review.review is '내용';
COMMENT ON COLUMN review.rate is '평점';
COMMENT ON COLUMN review.rdate is '리뷰 날짜';
COMMENT ON COLUMN review.payno is '결제 세부 번호';
COMMENT ON COLUMN review.memberno is '회원 번호';
COMMENT ON COLUMN review.filmno is '영화 번호';

DESC review;


DROP SEQUENCE review_seq;

CREATE SEQUENCE review_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO review(reviewno, title, review, rate, rdate, payno, memberno, filmno)
VALUES (review_seq.nextval, '재밌어요', '강력하게 추천합니다', 8.1, sysdate, 1, 1, 8);

INSERT INTO review(reviewno, title, review, rate, rdate, payno, memberno, filmno)
VALUES (review_seq.nextval, '좋아요', '킬링타임용으로 좋아요', 6.9, sysdate, 1, 2, 8);

INSERT INTO review(reviewno, title, review, rate, rdate, payno, memberno, filmno)
VALUES (review_seq.nextval, 'good', 'i really liked this film', 7.4, sysdate, 1, 3, 8);

COMMIT;

-- ♣LIST♣

SELECT reviewno, title, review, rate, rdate, payno, memberno, filmno
FROM review
ORDER BY reviewno;


SELECT reviewno, title , review, rate, rdate, payno, memberno, filmno
FROM review
WHERE memberno = 1
ORDER BY reviewno;



-- ♣READ♣

SELECT reviewno, title, review, rate, rdate, payno, memberno, filmno
FROM review
WHERE reviewno = 1;


-- ♣UPDATE♣

UPDATE review
SET review = 'Dublic Film Critics Circle', rate='Best Director'
WHERE reviewno = 1;



-- ♣DELETE♣

DELETE 
FROM review
WHERE reviewno=1; 



-- 영화번호 별 리뷰 목록

SELECT m.memberno as m_memberno, m.nick,
           r.title, r.review, r.rate, r.rdate, r.payno, r.memberno r_memberno, r.filmno
FROM member m , review r
WHERE  m.memberno = r.memberno  AND r.filmno = 8
ORDER BY r.rdate DESC;











