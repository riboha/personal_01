/**********************************/
/* Table Name: ���θ�� */
/**********************************/

DROP TABLE promotion CASCADE CONSTRAINTS;

CREATE TABLE promotion(
        promono                             NUMBER(10)       NOT NULL,
        promotitle                          VARCHAR2(300)        NOT NULL,
        promocontent                        CLOB        NOT NULL,
        promodisc                           NUMBER(3)        DEFAULT 0       NOT NULL,
        promovalid                          NUMBER(1)        DEFAULT 1       NOT NULL,
        promostart                          DATE         NOT NULL,
        promoend                            DATE         NOT NULL
);

COMMENT ON TABLE promotion is '���θ��';
COMMENT ON COLUMN promotion.promono is '���θ�� ��ȣ';
COMMENT ON COLUMN promotion.promotitle is '���θ�� ����';
COMMENT ON COLUMN promotion.promocontent is '���θ�� ����';
COMMENT ON COLUMN promotion.promodisc is '���θ�� ������';
COMMENT ON COLUMN promotion.promovalid is '���θ�� ���� ����';
COMMENT ON COLUMN promotion.promostart is '���θ�� ����';
COMMENT ON COLUMN promotion.promoend is '���θ�� ����';


DROP SEQUENCE promo_seq;

CREATE SEQUENCE promo_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  

--------------------------------------------------------------------------------------------

-- ��CREATE��

INSERT INTO promotion(promono, promotitle, promocontent, promodisc, 
                                promovalid, promostart, promoend )
VALUES (promo_seq.nextval, 'Summer Event', '10% off', 10, 
            1, '2020-08-11', '2020-08-20');

INSERT INTO promotion(promono, promotitle, promocontent, promodisc, 
                                promovalid, promostart, promoend )
VALUES (promo_seq.nextval, 'Rain Event', '15% off', 15,
            1, '2020-08-11', '2020-08-20');
             
INSERT INTO promotion(promono, promotitle, promocontent, promodisc, 
                                promovalid, promostart, promoend )
VALUES (promo_seq.nextval, 'Surprise Event', '25% off', 25,
            1, '2020-08-11', '2020-08-20');

COMMIT;

-- ��LIST��

SELECT promono, promotitle, promocontent, promodisc, promovalid, promostart, promoend
FROM promotion
ORDER BY promono;


-- ��READ��

SELECT promono, promotitle, promocontent, promodisc, promovalid, promostart, promoend
FROM promotion
WHERE promono = 1;


-- ��UPDATE��

UPDATE promotion
SET promotitle = 'New Year Event', promocontent = '20% off', promodisc = 20, 
    promovalid=0, promostart='2020-08-15', promoend='2020-09-01'
WHERE promono = 1;


-- ��DELETE��

DELETE 
FROM promotion
WHERE promono=1;  
















































