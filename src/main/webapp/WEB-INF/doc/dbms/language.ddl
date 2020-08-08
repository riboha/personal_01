/**********************************/
/* Table Name: 지원 언어 */
/**********************************/

DROP TABLE language CASCADE CONSTRAINTS;

CREATE TABLE language(
        languageno                          NUMBER(10)       NOT NULL        PRIMARY KEY,
        en                                  NUMBER(1)        DEFAULT 1       NOT NULL,
        ch                                  NUMBER(1)        DEFAULT 0       NOT NULL,
        es                                  NUMBER(1)        DEFAULT 0       NOT NULL,
        fr                                  NUMBER(1)        DEFAULT 0       NOT NULL,
        ar                                  NUMBER(1)        DEFAULT 0       NOT NULL,
        rs                                  NUMBER(1)        DEFAULT 0       NOT NULL,
        pt                                  NUMBER(1)        DEFAULT 0       NOT NULL,
        de                                  NUMBER(1)        DEFAULT 0       NOT NULL,
        jp                                  NUMBER(1)        DEFAULT 0       NOT NULL,
        hi                                  NUMBER(1)        DEFAULT 0       NOT NULL,
        kr                                  NUMBER(1)        DEFAULT 0       NOT NULL,
        filmno                              NUMBER(10)       NULL ,
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE language is '지원 언어';
COMMENT ON COLUMN language.languageno is '지원 언어 번호';
COMMENT ON COLUMN language.filmno is '영화 번호';
COMMENT ON COLUMN language.en is '영어';
COMMENT ON COLUMN language.ch is '중국어(보통화)';
COMMENT ON COLUMN language.es is '스페인어';
COMMENT ON COLUMN language.fr is '프랑스어';
COMMENT ON COLUMN language.ar is '아랍어(표준)';
COMMENT ON COLUMN language.rs is '러시아어';
COMMENT ON COLUMN language.pt is '포르투갈어';
COMMENT ON COLUMN language.de is '독일어';
COMMENT ON COLUMN language.jp is '일본어';
COMMENT ON COLUMN language.hi is '힌디어';
COMMENT ON COLUMN language.kr is '한국어';


 --------------------------------------------------------------------------------------------
  
  
-- ♣CREATE♣
-- languageno = filmno

INSERT INTO language( languageno, filmno, en, kr )
VALUES (1, 1,  1, 1);

INSERT INTO language( languageno, filmno, en, kr )
VALUES (2, 2, 1, 1);

INSERT INTO language( languageno, filmno, en, kr )
VALUES (8, 8, 1, 1);


COMMIT;


-- ♣LIST♣

SELECT languageno, filmno, en, ch, es, fr, ar, rs, pt, de, jp, hi, kr
FROM language
ORDER BY filmno;


-- ♣READ♣

SELECT languageno, filmno, en, ch, es, fr, ar, rs, pt, de, jp, hi, kr
FROM language
WHERE filmno = 1;


-- ♣UPDATE♣

UPDATE language
SET ch = 0
WHERE languageno = 1;


-- ♣DELETE♣

DELETE 
FROM language
WHERE languageno=1;  



  











