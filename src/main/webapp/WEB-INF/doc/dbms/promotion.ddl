/**********************************/
/* Table Name: 프로모션 */
/**********************************/

DROP TABLE promotion CASCADE CONSTRAINTS;

CREATE TABLE promotion(
        promono                             NUMBER(10)       NOT NULL        PRIMARY KEY,
        promotitle                          VARCHAR2(300)        NOT NULL,
        promocontent                        CLOB(300)        NOT NULL,
        promodisc                           NUMBER(3)        DEFAULT 0       NOT NULL
);

COMMENT ON TABLE promotion is '프로모션';
COMMENT ON COLUMN promotion.promono is '프로모션 번호';
COMMENT ON COLUMN promotion.promotitle is '프로모션 제목';
COMMENT ON COLUMN promotion.promocontent is '프로모션 내용';
COMMENT ON COLUMN promotion.promodisc is '프로모션 할인율';


DROP SEQUENCE promo_seq;

CREATE SEQUENCE promo_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

--------------------------------------------------------------------------------------------

-- ♣CREATE♣

INSERT INTO promotion(promono, promotitle, promocontent, promodisc)
VALUES (promo_seq.nextval, 'Summer Event', '10% off', 10);

INSERT INTO promotion(promono, promotitle, promocontent, promodisc)
VALUES (promo_seq.nextval, 'Rain Event', '15% off', 15);

INSERT INTO promotion(promono, promotitle, promocontent, promodisc)
VALUES (promo_seq.nextval, 'Surprise Event', '25% off', 25);


-- ♣LIST♣

SELECT promono, promotitle, promocontent, promodisc
FROM promotion
ORDER BY promono;


-- ♣READ♣

SELECT promono, promotitle, promocontent, promodisc
FROM promotion
WHERE promono = 1;


-- ♣UPDATE♣

UPDATE promotion
SET promotitle = 'New Year Event', promocontent = '20% off', promodisc = 20,
WHERE promono = 1;


-- ♣DELETE♣

DELETE 
FROM promotion
WHERE promono=1;  
















































