/**********************************/
/* Table Name: 프로모션 영화 */
/**********************************/

DROP TABLE promofilm CASCADE CONSTRAINTS;

CREATE TABLE promofilm (
        promofilmno                         NUMBER(10)       NOT NULL,
        promono                             NUMBER(10)       NOT NULL,
        filmno                              NUMBER(10)       NOT NULL
);

COMMENT ON TABLE promofilm  is '프로모션 영화';
COMMENT ON COLUMN promofilm .promofilmno is '프로모션 영화 번호';
COMMENT ON COLUMN promofilm .promono is '프로모션 번호';
COMMENT ON COLUMN promofilm .filmno is '영화 번호';



DESC promofilm;


DROP SEQUENCE promofilm_seq;

CREATE SEQUENCE promofilm_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO promofilm(promofilmno, promono, filmno)
VALUES (promofilm_seq.nextval, 1, 25);

INSERT INTO promofilm(promofilmno, promono, filmno)
VALUES (promofilm_seq.nextval, 1, 26);

INSERT INTO promofilm(promofilmno, promono, filmno)
VALUES (promofilm_seq.nextval, 2, 26);


INSERT INTO promofilm(promofilmno, promono, filmno)
VALUES (promofilm_seq.nextval, 1, 27);

INSERT INTO promofilm(promofilmno, promono, filmno)
VALUES (promofilm_seq.nextval, 4, 27);
COMMIT;

-- ♣LIST♣

SELECT promofilmno, promono, filmno
FROM promofilm
ORDER BY promofilmno;


-- ♣READ♣

SELECT promofilmno, promono, filmno
FROM promofilm
WHERE promofilmno = 4;


-- ♣UPDATE♣

UPDATE promofilm
SET promono = 2, filmno=14
WHERE promofilmno = 1;


-- ♣DELETE♣

DELETE 
FROM promofilm
WHERE promofilmno=1;  




-- ▶ Promotion / Film / Promofilm Join

-- ▷ Promotion
SELECT promono, promotitle, promodetail, 
            promopercent, promoamount, 
            promovalid, promostart, promoend
FROM promotion
ORDER BY promono;

-- ▷ Film
SELECT filmno, titleen, titlekr, lan, year, len, restrict, dirno, postersize, poster, posterthumb
FROM film
ORDER BY filmno;

-- ▷ Promofilm
SELECT promofilmno, promono, filmno
FROM promofilm
ORDER BY promofilmno;


-- ▷ Join by filmno
SELECT p.promono, p.promotitle, p.promopercent, p.promoamount, p.promovalid,
           f.filmno,
           x.promofilmno
FROM promotion p, film f, promofilm x
WHERE p.promono = x.promono AND f.filmno = x.filmno AND x.filmno = 27
ORDER BY promofilmno;






