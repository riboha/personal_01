/**********************************/
/* Table Name: ���� */
/**********************************/

DROP TABLE pay CASCADE CONSTRAINTS;

CREATE TABLE pay(
        payno                               NUMBER(10)       NOT NULL        PRIMARY KEY,
        optionlan                           VARCHAR2(10)         NOT NULL,
        optionqual                          VARCHAR2(10)         NOT NULL,
        optionrent                          VARCHAR2(10)         NOT NULL,
        priceoriginal                       NUMBER(10)       NOT NULL,
        pricediscount                       NUMBER(10)       DEFAULT 0       NOT NULL,
        pricefinal                          NUMBER(10)       NOT NULL,
        payvalid                            NUMBER(1)        DEFAULT 1       NOT NULL,
        memberno                            NUMBER(10)       NOT NULL,
        paytotalno                          NUMBER(10)       NOT NULL,
        promono                             NUMBER(10)       DEFAULT 0       NOT NULL,
        filmno                              NUMBER(10)       NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (paytotalno) REFERENCES paytotal (paytotalno),
  FOREIGN KEY (promono) REFERENCES promotion (promono),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE pay is '����';
COMMENT ON COLUMN pay.payno is '���� ��ȣ';
COMMENT ON COLUMN pay.optionlan is '�ɼ� ���';
COMMENT ON COLUMN pay.optionqual is '�ɼ� ȭ��';
COMMENT ON COLUMN pay.optionrent is '�ɼ� �뿩';
COMMENT ON COLUMN pay.priceoriginal is '���� �� �ݾ�';
COMMENT ON COLUMN pay.pricediscount is '���� ���� �ݾ�';
COMMENT ON COLUMN pay.pricefinal is '���� ���� �ݾ�';
COMMENT ON COLUMN pay.payvalid is '���� ��ǰ ��ȿ ����';
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
                        optionlan, optionqual, optionrent,
                        priceoriginal, pricediscount, pricefinal, payvalid,
                        memberno, paytotalno, promono, filmno)
VALUES (pay_seq.nextval, 
            'EN', '720p', '7��',
            5000, 0, 5000, 1,
            1, 1, 1, 1); 
               
            
COMMIT;

-- ��LIST��

SELECT payno, 
            optionlan, optionqual, optionrent,
            priceoriginal, pricediscount, pricefinal, payvalid,
            memberno, paytotalno, promono, filmno
FROM pay
ORDER BY payno;


-- ��READ��

SELECT payno, 
            optionlan, optionqual, optionrent,
            priceoriginal, pricediscount, pricefinal, payvalid,
            memberno, paytotalno, promono, filmno
FROM pay
WHERE payno = 1;


-- ��UPDATE��


-- ��DELETE��

DELETE 
FROM pay
WHERE payno=1;  


