/**********************************/
/* Table Name: �Ѱ��� */
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

COMMENT ON TABLE paytotal is '�Ѱ���';
COMMENT ON COLUMN paytotal.paytotalno is '�Ѱ��� ��ȣ';
COMMENT ON COLUMN paytotal.pricetotaloriginal is '�Ѱ��� �� �ݾ�';
COMMENT ON COLUMN paytotal.pricetotaldiscpromo is '�Ѱ��� ���θ�� ���� �ݾ�';
COMMENT ON COLUMN paytotal.pricetotaldiscpnt is '�Ѱ��� ����Ʈ ���� �ݾ�';
COMMENT ON COLUMN paytotal.pricetotalfinal is '�Ѱ��� ���� �ݾ�';
COMMENT ON COLUMN paytotal.pntsave is '�Ѱ��� ����Ʈ ����';
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
                pricetotaloriginal, pricetotaldiscpromo, pricetotaldiscpnt, pricetotalfinal, 
                pntsave, method, paytotaldate, memberno )

INSERT INTO paytotal ( paytotalno, memberno )
VALUES (paytotal_seq.nextval, 1);

INSERT INTO paytotal ( paytotalno, memberno )
VALUES (paytotal_seq.nextval, 1);

INSERT INTO paytotal ( paytotalno, memberno )
VALUES (paytotal_seq.nextval, 1);

COMMIT;


-- ��LIST��

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


-- ��READ��

SELECT paytotalno, 
            pricetotaloriginal, pricetotaldiscpromo, pricetotaldiscpnt, pricetotalfinal, 
            pntsave, method, paytotaldate, memberno
FROM paytotal
WHERE paytotalno = 1;



-- ��UPDATE��



-- ��DELETE��

DELETE 
FROM paytotal;
WHERE paytotalno=1;  





-- ��LIST��

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


-- Pay, Paytotal, Film Join (memberno�� ���� ����)

-- ���ڵ� �� ���� (paytotalno ����)
SELECT COUNT (paytotalno) as cnt
FROM (
            SELECT DISTINCT t. paytotalno
            FROM paytotal t, pay p, film f
            WHERE p.paytotalno = t.paytotalno AND p.filmno = f.filmno AND p.memberno = 1
            ORDER BY t.paytotalno
          )



-- Paytotal ����¡
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



-- Pay, Film ����¡
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
