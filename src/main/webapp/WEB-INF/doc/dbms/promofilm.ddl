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
VALUES (promofilm_seq.nextval, 1, 1);

INSERT INTO promofilm(promofilmno, promono, filmno)
VALUES (promofilm_seq.nextval, 1, 6);

INSERT INTO promofilm(promofilmno, promono, filmno)
VALUES (promofilm_seq.nextval, 1, 7);

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































