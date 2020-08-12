/**********************************/
/* Table Name: 총결제 */
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

COMMENT ON TABLE paytotal is '총결제';
COMMENT ON COLUMN paytotal.paytotalno is '총결제 번호';
COMMENT ON COLUMN paytotal.pricetotal is '총 결제액';
COMMENT ON COLUMN paytotal.pntsave is '적립 포인트';
COMMENT ON COLUMN paytotal.method is '결제 방식';
COMMENT ON COLUMN paytotal.paydate is '결제 일자';
COMMENT ON COLUMN paytotal.memberno is '회원 번호';


DESC paytotal;


DROP SEQUENCE paytotal_seq;

CREATE SEQUENCE paytotal_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO paytotal(paytotalno, pricetotal, method, paydate, memberno)
VALUES (paytotal_seq.nextval, 50000, 1, sysdate, 1);

INSERT INTO paytotal(paytotalno, pricetotal, method, paydate, memberno)
VALUES (paytotal_seq.nextval, 50000, 2, sysdate, 1);

INSERT INTO paytotal(paytotalno, pricetotal, method, paydate, memberno)
VALUES (paytotal_seq.nextval, 50000, 3, sysdate, 1);

COMMIT;

-- ♣LIST♣

SELECT paytotalno, pricetotal, method, paydate, memberno, pntsave
FROM paytotal
ORDER BY paytotalno;

SELECT paytotalno, pricetotal, method, paydate, memberno, pntsave
FROM paytotal
WHERE memberno = 1
ORDER BY paytotalno;


-- ♣READ♣

SELECT paytotalno, pricetotal, method, paydate, memberno, pntsave
FROM paytotal
WHERE paytotalno = 1;


-- ♣UPDATE♣

UPDATE paytotal
SET pricetotal = 40000, method=3
WHERE paytotalno = 1;


-- ♣DELETE♣

DELETE 
FROM paytotal
WHERE paytotalno=1;  































