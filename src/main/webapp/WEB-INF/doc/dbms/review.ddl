/**********************************/
/* Table Name: ���� */
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

COMMENT ON TABLE review is '����';
COMMENT ON COLUMN review.reviewno is '���� ��ȣ';
COMMENT ON COLUMN review.title is '����';
COMMENT ON COLUMN review.review is '����';
COMMENT ON COLUMN review.rate is '����';
COMMENT ON COLUMN review.rdate is '���� ��¥';
COMMENT ON COLUMN review.payno is '���� ���� ��ȣ';
COMMENT ON COLUMN review.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN review.filmno is '��ȭ ��ȣ';

DESC review;


DROP SEQUENCE review_seq;

CREATE SEQUENCE review_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  

--------------------------------------------------------------------------------------------



-- ��CREATE��

INSERT INTO review(reviewno, title, review, rate, rdate, payno, memberno, filmno)
VALUES (review_seq.nextval, '��վ��', '�����ϰ� ��õ�մϴ�', 8.1, sysdate, 1, 1, 8);

INSERT INTO review(reviewno, title, review, rate, rdate, payno, memberno, filmno)
VALUES (review_seq.nextval, '���ƿ�', 'ų��Ÿ�ӿ����� ���ƿ�', 6.9, sysdate, 1, 2, 8);

INSERT INTO review(reviewno, title, review, rate, rdate, payno, memberno, filmno)
VALUES (review_seq.nextval, 'good', 'i really liked this film', 7.4, sysdate, 1, 3, 8);

COMMIT;

-- ��LIST��

SELECT reviewno, title, review, rate, rdate, payno, memberno, filmno
FROM review
ORDER BY reviewno;


SELECT reviewno, title , review, rate, rdate, payno, memberno, filmno
FROM review
WHERE memberno = 1
ORDER BY reviewno;



-- ��READ��

SELECT reviewno, title, review, rate, rdate, payno, memberno, filmno
FROM review
WHERE reviewno = 1;


-- ��UPDATE��

UPDATE review
SET review = 'Dublic Film Critics Circle', rate='Best Director'
WHERE reviewno = 1;



-- ��DELETE��

DELETE 
FROM review
WHERE reviewno=1; 



-- ��ȭ��ȣ �� ���� ���

SELECT m.memberno as m_memberno, m.nick,
           r.title, r.review, r.rate, r.rdate, r.payno, r.memberno r_memberno, r.filmno
FROM member m , review r
WHERE  m.memberno = r.memberno  AND r.filmno = 8
ORDER BY r.rdate DESC;











