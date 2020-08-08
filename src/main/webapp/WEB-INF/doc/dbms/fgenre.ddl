/**********************************/
/* Table Name: 영화 장르 */
/**********************************/
DROP TABLE fgenre CASCADE CONSTRAINTS;

CREATE TABLE fgenre(
        fgenreno                            NUMBER(38)       NOT NULL        PRIMARY KEY,
        genreno                             NUMBER(10)       NOT NULL,
        filmno                              NUMBER(10)       NOT NULL,
  FOREIGN KEY (genreno) REFERENCES genre (genreno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);


COMMENT ON TABLE fgenre is '영화 장르';
COMMENT ON COLUMN fgenre.fgenreno is '영화 장르 번호';
COMMENT ON COLUMN fgenre.genreno is '장르 번호';
COMMENT ON COLUMN fgenre.filmno is '영화 번호';


DROP SEQUENCE fgenre_seq;

CREATE SEQUENCE fgenre_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지


--------------------------------------------------------------------------------------------


-- ♣CREATE♣

INSERT INTO fgenre(fgenreno, genreno, filmno)
VALUES (fgenre_seq.nextval, 1, 1);

INSERT INTO fgenre(fgenreno, genreno, filmno)
VALUES (fgenre_seq.nextval, 2, 1);

INSERT INTO fgenre(fgenreno, genreno, filmno)
VALUES (fgenre_seq.nextval, 3, 1);


-- ♣LIST♣

SELECT fgenreno, genreno, filmno
FROM fgenre
  ORDER BY filmno DESC, fgenreno ASC;


-- ♣READ♣

SELECT fgenreno, genreno, filmno
FROM fgenre
WHERE fgenreno = 1;


-- ♣UPDATE♣

UPDATE fgenre
SET genreno = 4
WHERE fgenreno = 3;



-- ♣DELETE♣

DELETE 
FROM fgenre
WHERE fgenreno=3;  




