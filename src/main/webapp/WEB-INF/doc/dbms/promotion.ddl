/**********************************/
/* Table Name: ���θ�� */
/**********************************/

DROP TABLE promotion CASCADE CONSTRAINTS;

CREATE TABLE promotion(
        promono                             NUMBER(10)       NOT NULL        PRIMARY KEY,
        promotitle                          VARCHAR2(300)        NOT NULL,
        promocontent                        CLOB(300)        NOT NULL,
        promodisc                           NUMBER(3)        DEFAULT 0       NOT NULL
);

COMMENT ON TABLE promotion is '���θ��';
COMMENT ON COLUMN promotion.promono is '���θ�� ��ȣ';
COMMENT ON COLUMN promotion.promotitle is '���θ�� ����';
COMMENT ON COLUMN promotion.promocontent is '���θ�� ����';
COMMENT ON COLUMN promotion.promodisc is '���θ�� ������';


DROP SEQUENCE promo_seq;

CREATE SEQUENCE promo_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  

--------------------------------------------------------------------------------------------

-- ��CREATE��

INSERT INTO promotion(promono, promotitle, promocontent, promodisc)
VALUES (promo_seq.nextval, 'Summer Event', '10% off', 10);

INSERT INTO promotion(promono, promotitle, promocontent, promodisc)
VALUES (promo_seq.nextval, 'Rain Event', '15% off', 15);

INSERT INTO promotion(promono, promotitle, promocontent, promodisc)
VALUES (promo_seq.nextval, 'Surprise Event', '25% off', 25);


-- ��LIST��

SELECT promono, promotitle, promocontent, promodisc
FROM promotion
ORDER BY promono;


-- ��READ��

SELECT promono, promotitle, promocontent, promodisc
FROM promotion
WHERE promono = 1;


-- ��UPDATE��

UPDATE promotion
SET promotitle = 'New Year Event', promocontent = '20% off', promodisc = 20,
WHERE promono = 1;


-- ��DELETE��

DELETE 
FROM promotion
WHERE promono=1;  
















































