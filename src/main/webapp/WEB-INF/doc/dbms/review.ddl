/**********************************/
/* Table Name: ���� */
/**********************************/

DROP TABLE review CASCADE CONSTRAINTS;

CREATE TABLE review(
        reviewno                            NUMBER(10)       NOT NULL        PRIMARY KEY,
        review                              VARCHAR2(1000)       NOT NULL,
        rate                                NUMBER(1)        DEFAULT 1       NOT NULL,
        rdate                               DATE         NOT NULL,
        payno                               NUMBER(10)       NOT NULL,
        memberno                            NUMBER(10)       NOT NULL,
        filmno                              NUMBER(10)       NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (payno) REFERENCES pay (payno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE review is '����';
COMMENT ON COLUMN review.reviewno is '���� ��ȣ';
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

INSERT INTO review(reviewno, review, rate, rdate, payno, memberno, filmno)
VALUES (review_seq.nextval, '��վ��', 5, sysdate, 1, 1, 8);

INSERT INTO review(reviewno, review, rate, rdate, payno, memberno, filmno)
VALUES (review_seq.nextval, '���ƿ�', 4, sysdate, 1, 2, 8);

INSERT INTO review(reviewno, review, rate, rdate, payno, memberno, filmno)
VALUES (review_seq.nextval, 'good', 5, sysdate, 1, 3, 8);

COMMIT;

-- ��LIST��

SELECT reviewno, review, rate, rdate, payno, memberno, filmno
FROM review
ORDER BY reviewno;


SELECT reviewno, review, rate, rdate, payno, memberno, filmno
FROM review
WHERE memberno = 1
ORDER BY reviewno;



-- ��READ��

SELECT reviewno, review, rate, rdate, payno, memberno, filmno
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































