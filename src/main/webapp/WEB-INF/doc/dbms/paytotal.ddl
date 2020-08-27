/**********************************/
/* Table Name: 총결제 */
/**********************************/

DROP TABLE paytotal CASCADE CONSTRAINTS;

CREATE TABLE paytotal(
        paytotalno                          NUMBER(10)       NOT NULL        PRIMARY KEY,
        pricetotaloriginal                  NUMBER(10)       DEFAULT 0       NOT NULL,
        pricetotaldiscpromo                 NUMBER(10)       DEFAULT 0       NOT NULL,
        pricetotaldiscpnt                   NUMBER(10)       NULL ,
        pricetotalfinal                     NUMBER(10)       DEFAULT 0       NOT NULL,
        pntsave                             NUMBER(10)       DEFAULT 0       NOT NULL,
        method                              NUMBER(1)        DEFAULT 0       NOT NULL,
        paytotaldate                        DATE         DEFAULT '2020-08-15'        NOT NULL,
        memberno                            NUMBER(10)       NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE paytotal is '총결제';
COMMENT ON COLUMN paytotal.paytotalno is '총결제 번호';
COMMENT ON COLUMN paytotal.pricetotaloriginal is '총결제 원 금액';
COMMENT ON COLUMN paytotal.pricetotaldiscpromo is '총결제 프로모션 할인 금액';
COMMENT ON COLUMN paytotal.pricetotaldiscpnt is '총결제 포인트 할인 금액';
COMMENT ON COLUMN paytotal.pricetotalfinal is '총결제 최종 금액';
COMMENT ON COLUMN paytotal.pntsave is '총결제 포인트 적립';
COMMENT ON COLUMN paytotal.method is '결제 방식';
COMMENT ON COLUMN paytotal.paytotaldate is '결제 일자';
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

INSERT INTO paytotal ( paytotalno, 
                pricetotaloriginal, pricetotaldiscpromo, pricetotaldiscpnt, pricetotalfinal, 
                pntsave, method, paytotaldate, memberno )

INSERT INTO paytotal ( paytotalno, memberno )
VALUES (paytotal_seq.nextval, 1);

INSERT INTO paytotal ( paytotalno, memberno )
VALUES (paytotal_seq.nextval, 1);

INSERT INTO paytotal ( paytotalno, memberno )
VALUES (paytotal_seq.nextval, 1);

COMMIT;


-- ♣LIST♣

SELECT paytotalno, 
            pricetotaloriginal, pricetotaldiscpromo, pricetotaldiscpnt, pricetotalfinal, 
            pntsave, method, paytotaldate, memberno
FROM paytotal
ORDER BY paytotalno;


SELECT paytotalno, 
            pricetotaloriginal, pricetotaldiscpromo, pricetotaldiscpnt, pricetotalfinal, 
            pntsave, method, paytotaldate, memberno
FROM paytotal
WHERE memberno = 1
ORDER BY paytotalno;


-- ♣READ♣

SELECT paytotalno, 
            pricetotaloriginal, pricetotaldiscpromo, pricetotaldiscpnt, pricetotalfinal, 
            pntsave, method, paytotaldate, memberno
FROM paytotal
WHERE paytotalno = 1;



-- ♣UPDATE♣



-- ♣DELETE♣

DELETE 
FROM paytotal;
WHERE paytotalno=1;  





-- ♣LIST♣

SELECT paytotalno, 
            pricetotaloriginal, pricetotaldiscpromo, pricetotaldiscpnt, pricetotalfinal, 
            pntsave, method, paytotaldate, memberno
FROM paytotal
ORDER BY paytotalno;


SELECT payno, 
            optionlan, optionqual, optionrent,
            priceoriginal, pricediscount, pricefinal, payvalid,
            memberno, paytotalno, promono, filmno
FROM pay
ORDER BY payno;


-- Pay, Paytotal, Film Join (memberno별 결제 내역)

-- 레코드 총 갯수 (paytotalno 기준)
SELECT COUNT (paytotalno) as cnt
FROM (
            SELECT DISTINCT t. paytotalno
            FROM paytotal t, pay p, film f
            WHERE p.paytotalno = t.paytotalno AND p.filmno = f.filmno AND p.memberno = 1
            ORDER BY t.paytotalno
          )



-- Paytotal 페이징
SELECT paytotalno, pricetotaldiscpromo, pricetotaldiscpnt, pricetotalfinal, pntsave, method, paytotaldate , r
FROM (
            SELECT paytotalno, pricetotaldiscpromo, pricetotaldiscpnt, pricetotalfinal, pntsave, method, paytotaldate ,rownum as r
            FROM (
                        SELECT DISTINCT t. paytotalno, t.pricetotaldiscpromo, t.pricetotaldiscpnt, t.pricetotalfinal, t.pntsave, t.method, t.paytotaldate
                        FROM paytotal t, pay p, film f
                        WHERE p.paytotalno = t.paytotalno AND p.filmno = f.filmno AND p.memberno = 1
                        ORDER BY paytotalno  
                      )
          )
WHERE r >= 5 AND r <= 8;



-- Pay, Film 페이징
SELECT t.paytotalno,
            p.payno, p.optionlan, p.optionqual, p.optionrent, p.priceoriginal, p.pricediscount, p.pricefinal, p.filmno,
            f.titleen, f.titlekr, f.poster          
FROM pay p, paytotal t, film f
WHERE t.paytotalno IN ( 

                                    SELECT paytotalno 
                                    FROM (
                                                SELECT paytotalno, r
                                                FROM (        
                                                            SELECT paytotalno, rownum as r
                                                            FROM (
                                                                        SELECT DISTINCT t. paytotalno
                                                                        FROM paytotal t, pay p, film f
                                                                        WHERE p.paytotalno = t.paytotalno AND p.filmno = f.filmno AND p.memberno = 1
                                                                        ORDER BY paytotalno  
                                                                      )
                                                            )                             
                                                WHERE r >= 5 AND r <= 8            
                                              )
                                ) AND p.paytotalno = t.paytotalno AND p.filmno = f.filmno AND p.memberno = 1
ORDER BY paytotalno;


SELECT paytotalno 
FROM (
            SELECT paytotalno, r
            FROM (        
                        SELECT paytotalno, rownum as r
                        FROM (
                                    SELECT DISTINCT t. paytotalno
                                    FROM paytotal t, pay p, film f
                                    WHERE p.paytotalno = t.paytotalno AND p.filmno = f.filmno AND p.memberno = 1
                                    ORDER BY paytotalno  
                                  )
                        )                             
            WHERE r >= 5 AND r <= 8            
          )


  SELECT t.paytotalno,
              p.payno, p.optionlan, p.optionqual, p.optionrent, p.priceoriginal, p.pricefinal, p.filmno,
              f.titleen, f.titlekr         
  FROM pay p, paytotal t, film f
  WHERE t.paytotalno IN ( 
                                  SELECT paytotalno 
                                  FROM (
                                              SELECT paytotalno, r
                                              FROM (        
                                                          SELECT paytotalno, rownum as r
                                                          FROM (
                                                                      SELECT DISTINCT t. paytotalno
                                                                      FROM paytotal t, pay p, film f
                                                                      WHERE p.paytotalno = t.paytotalno AND p.filmno = f.filmno AND p.memberno = 1
                                                                      ORDER BY paytotalno  
                                                                    )
                                                          )                             
                                               WHERE r >= 5 AND r <= 8      
                                            )
                                  ) AND p.paytotalno = t.paytotalno AND p.filmno = f.filmno AND p.memberno = 1
  ORDER BY paytotalno
