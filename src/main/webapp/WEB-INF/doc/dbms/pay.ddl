/**********************************/
/* Table Name: 결제 */
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

COMMENT ON TABLE pay is '결제';
COMMENT ON COLUMN pay.payno is '결제 번호';
COMMENT ON COLUMN pay.pntdisc is '포인트 할인액';
COMMENT ON COLUMN pay.promodiscper is '프로모션 할인율';
COMMENT ON COLUMN pay.promodiscsub is '프로모션 할인액';
COMMENT ON COLUMN pay.priceoriginal is '결제 원 금액';
COMMENT ON COLUMN pay.price is '결제 최종 금액';
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

-- ♣LIST♣

SELECT payno, pntdisc, promodiscper,  promodiscsub, priceoriginal, price, 
            memberno, paytotalno, promono, filmno
FROM pay
ORDER BY payno;


-- ♣READ♣

SELECT payno, pntdisc, promodiscper,  promodiscsub, priceoriginal, price, 
            memberno, paytotalno, promono, filmno
FROM pay
WHERE payno = 1;


-- ♣UPDATE♣

UPDATE pay
SET paynameen = 'Maya Hawke', paynamekr='마야 호크', birth='1998-07-08', nation='USA', 
        paypic=null, paythumb=null, paypicsize=0
WHERE payno = 1;


-- ♣DELETE♣

DELETE 
FROM pay
WHERE payno=1;  


