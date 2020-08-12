/**********************************/
/* Table Name: �Ѱ��� */
/**********************************/
DROP TABLE paytotal CASCADE CONSTRAINTS;

CREATE TABLE paytotal(
        paytotalno                          NUMBER(10)       NOT NULL        PRIMARY KEY,
        pricetotal                          NUMBER(10)       NOT NULL,
        pntsave                             NUMBER(10)       DEFAULT 0       NOT NULL,
        method                              NUMBER(1)        NOT NULL,
        paydate                             DATE         NOT NULL,
        memberno                            NUMBER(10)       NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE paytotal is '�Ѱ���';
COMMENT ON COLUMN paytotal.paytotalno is '�Ѱ��� ��ȣ';
COMMENT ON COLUMN paytotal.pricetotal is '�� ������';
COMMENT ON COLUMN paytotal.pntsave is '���� ����Ʈ';
COMMENT ON COLUMN paytotal.method is '���� ���';
COMMENT ON COLUMN paytotal.paydate is '���� ����';
COMMENT ON COLUMN paytotal.memberno is 'ȸ�� ��ȣ';


DESC paytotal;


DROP SEQUENCE paytotal_seq;

CREATE SEQUENCE paytotal_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  

--------------------------------------------------------------------------------------------



-- ��CREATE��

INSERT INTO paytotal(paytotalno, pricetotal, method, paydate, memberno)
VALUES (paytotal_seq.nextval, 50000, 1, sysdate, 1);

INSERT INTO paytotal(paytotalno, pricetotal, method, paydate, memberno)
VALUES (paytotal_seq.nextval, 50000, 2, sysdate, 1);

INSERT INTO paytotal(paytotalno, pricetotal, method, paydate, memberno)
VALUES (paytotal_seq.nextval, 50000, 3, sysdate, 1);

COMMIT;

-- ��LIST��

SELECT paytotalno, pricetotal, method, paydate, memberno, pntsave
FROM paytotal
ORDER BY paytotalno;

SELECT paytotalno, pricetotal, method, paydate, memberno, pntsave
FROM paytotal
WHERE memberno = 1
ORDER BY paytotalno;


-- ��READ��

SELECT paytotalno, pricetotal, method, paydate, memberno, pntsave
FROM paytotal
WHERE paytotalno = 1;


-- ��UPDATE��

UPDATE paytotal
SET pricetotal = 40000, method=3
WHERE paytotalno = 1;


-- ��DELETE��

DELETE 
FROM paytotal
WHERE paytotalno=1;  































