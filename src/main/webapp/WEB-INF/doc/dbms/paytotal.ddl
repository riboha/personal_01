/**********************************/
/* Table Name: �Ѱ��� */
/**********************************/

DROP TABLE paytotal CASCADE CONSTRAINTS;

CREATE TABLE paytotal(
        paytotalno                          NUMBER(10)       NOT NULL        PRIMARY KEY,
        pricetotaloriginal                  NUMBER(10)       DEFAULT 0       NOT NULL,
        pricetotaldiscount                  NUMBER(10)       DEFAULT 0       NOT NULL,
        pricetotalfinal                  NUMBER(10)       DEFAULT 0       NOT NULL,
        pntsave                             NUMBER(10)       DEFAULT 0       NOT NULL,
        method                              NUMBER(1)        DEFAULT 0       NOT NULL,
        paytotaldate                        DATE         DEFAULT '0000-00-00'        NOT NULL,
        memberno                            NUMBER(10)       NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE paytotal is '�Ѱ���';
COMMENT ON COLUMN paytotal.paytotalno is '�Ѱ��� ��ȣ';
COMMENT ON COLUMN paytotal.pricetotaloriginal is '�Ѱ��� �� �ݾ�';
COMMENT ON COLUMN paytotal.pricetotaldiscount is '�Ѱ��� ���� �ݾ�';
COMMENT ON COLUMN paytotal.pricetotalfinal is '�Ѱ��� ���� �ݾ�';
COMMENT ON COLUMN paytotal.pntsave is '�Ѱ��� ���� ����Ʈ';
COMMENT ON COLUMN paytotal.method is '���� ���';
COMMENT ON COLUMN paytotal.paytotaldate is '���� ����';
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

INSERT INTO paytotal ( paytotalno, 
                pricetotaloriginal, pricetotaldiscount, pricetotalfinal, pntsave,
                method, paytotaldate, memberno )

INSERT INTO paytotal ( paytotalno, memberno )
VALUES (paytotal_seq.nextval, 1);

INSERT INTO paytotal ( paytotalno, memberno )
VALUES (paytotal_seq.nextval, 1);

INSERT INTO paytotal ( paytotalno, memberno )
VALUES (paytotal_seq.nextval, 1);

COMMIT;


-- ��LIST��

SELECT paytotalno, 
          pricetotaloriginal, pricetotaldiscount, pricetotalfinal, pntsave,
          method, paytotaldate, memberno
FROM paytotal
ORDER BY paytotalno;



-- ��READ��

SELECT paytotalno, 
          pricetotaloriginal, pricetotaldiscount, pricetotalfinal, pntsave,
          method, paytotaldate, memberno
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































