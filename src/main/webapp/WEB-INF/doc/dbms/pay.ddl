/**********************************/
/* Table Name: ���� */
/**********************************/

DROP TABLE pay CASCADE CONSTRAINTS;

CREATE TABLE pay(
        payno                               NUMBER(10)       NOT NULL        PRIMARY KEY,
        pntdisc                             NUMBER(10)       DEFAULT 0       NOT NULL,
        promodiscper                        NUMBER(10)       DEFAULT 0       NOT NULL,
        promodiscsub                        NUMBER(10)       DEFAULT 0       NOT NULL,
        priceoriginal                       NUMBER(10)       DEFAULT 0       NOT NULL,
        price                               NUMBER(10)       NOT NULL,
        memberno                            NUMBER(10)       NOT NULL,
        paytotalno                          NUMBER(10)       NOT NULL,
        promono                             NUMBER(10)       NOT NULL,
        filmno                              NUMBER(10)       NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (paytotalno) REFERENCES paytotal (paytotalno),
  FOREIGN KEY (promono) REFERENCES promotion (promono),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE pay is '����';
COMMENT ON COLUMN pay.payno is '���� ��ȣ';
COMMENT ON COLUMN pay.pntdisc is '����Ʈ ���ξ�';
COMMENT ON COLUMN pay.promodiscper is '���θ�� ������';
COMMENT ON COLUMN pay.promodiscsub is '���θ�� ���ξ�';
COMMENT ON COLUMN pay.priceoriginal is '���� �� �ݾ�';
COMMENT ON COLUMN pay.price is '���� ���� �ݾ�';
COMMENT ON COLUMN pay.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN pay.paytotalno is '�Ѱ��� ��ȣ';
COMMENT ON COLUMN pay.promono is '���θ�� ��ȣ';
COMMENT ON COLUMN pay.filmno is '��ȭ ��ȣ';


DESC pay;


DROP SEQUENCE pay_seq;

CREATE SEQUENCE pay_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  

--------------------------------------------------------------------------------------------



-- ��CREATE��

INSERT INTO pay (payno, 
                        pntdisc, promodiscsub, promodiscper, 
                        priceoriginal, price, 
                        memberno, paytotalno, promono, filmno)
VALUES (pay_seq.nextval, 
            0, 1000, 15,
            10000,  7650,
            1, 1, 1, 8);
            
INSERT INTO pay (payno, 
                        pntdisc, promodiscsub, promodiscper, 
                        priceoriginal, price, 
                        memberno, paytotalno, promono, filmno)
VALUES (pay_seq.nextval, 
            500, 1000, 20,
            20000,  14800,
            1, 1, 1, 8);

INSERT INTO pay (payno, 
                        pntdisc, promodiscsub, promodiscper, 
                        priceoriginal, price, 
                        memberno, paytotalno, promono, filmno)
VALUES (pay_seq.nextval, 
            0, 1000, 15,
            10000,  7650,
            1, 1, 1, 8);
            
COMMIT;

-- ��LIST��

SELECT payno, pntdisc, promodiscper,  promodiscsub, priceoriginal, price, 
            memberno, paytotalno, promono, filmno
FROM pay
ORDER BY payno;


-- ��READ��

SELECT payno, pntdisc, promodiscper,  promodiscsub, priceoriginal, price, 
            memberno, paytotalno, promono, filmno
FROM pay
WHERE payno = 1;


-- ��UPDATE��

UPDATE pay
SET paynameen = 'Maya Hawke', paynamekr='���� ȣũ', birth='1998-07-08', nation='USA', 
        paypic=null, paythumb=null, paypicsize=0
WHERE payno = 1;


-- ��DELETE��

DELETE 
FROM pay
WHERE payno=1;  


