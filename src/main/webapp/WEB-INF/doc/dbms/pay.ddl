/**********************************/
/* Table Name: 결제 */
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

COMMENT ON TABLE pay is '결제';
COMMENT ON COLUMN pay.payno is '결제 번호';
COMMENT ON COLUMN pay.optionlan is '옵션 언어';
COMMENT ON COLUMN pay.optionqual is '옵션 화질';
COMMENT ON COLUMN pay.optionrent is '옵션 대여';
COMMENT ON COLUMN pay.priceoriginal is '결제 원 금액';
COMMENT ON COLUMN pay.pricediscount is '결제 할인 금액';
COMMENT ON COLUMN pay.pricefinal is '결제 최종 금액';
COMMENT ON COLUMN pay.payvalid is '결제 상품 유효 여부';
COMMENT ON COLUMN pay.memberno is '회원 번호';
COMMENT ON COLUMN pay.paytotalno is '총결제 번호';
COMMENT ON COLUMN pay.promono is '프로모션 번호';
COMMENT ON COLUMN pay.filmno is '영화 번호';

DESC pay;

DROP SEQUENCE pay_seq;

CREATE SEQUENCE pay_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO pay (payno, 
                        optionlan, optionqual, optionrent,
                        priceoriginal, pricediscount, pricefinal, payvalid,
                        memberno, paytotalno, promono, filmno)
VALUES (pay_seq.nextval, 
            'EN', '720p', '7일',
            5000, 0, 5000, 1,
            1, 1, 1, 1); 
               
            
COMMIT;

-- ♣LIST♣

SELECT payno, 
            optionlan, optionqual, optionrent,
            priceoriginal, pricediscount, pricefinal, payvalid,
            memberno, paytotalno, promono, filmno
FROM pay
ORDER BY payno;


-- ♣READ♣

SELECT payno, 
            optionlan, optionqual, optionrent,
            priceoriginal, pricediscount, pricefinal, payvalid,
            memberno, paytotalno, promono, filmno
FROM pay
WHERE payno = 1;


-- ♣UPDATE♣


-- ♣DELETE♣

DELETE 
FROM pay
WHERE payno=1;  


