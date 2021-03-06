/**********************************/
/* Table Name: 장르 */
/**********************************/
DROP TABLE genre CASCADE CONSTRAINTS;

CREATE TABLE genre(
        genreno                             NUMBER(10)       NOT NULL        PRIMARY KEY,
        genrename                           VARCHAR2(60)         NOT NULL       UNIQUE,
        genreseq                            NUMBER(10)       NOT NULL
);

COMMENT ON TABLE genre is '장르';
COMMENT ON COLUMN genre.genreno is '장르 번호';
COMMENT ON COLUMN genre.genrename is '장르명';
COMMENT ON COLUMN genre.genreseq is '출력순서';


DROP SEQUENCE genre_seq;

CREATE SEQUENCE genre_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO genre(genreno, genrename, genreseq)
VALUES (genre_seq.nextval, 'Drama', 1);

INSERT INTO genre(genreno, genrename, genreseq)
VALUES (genre_seq.nextval, 'Mystery', 2);

INSERT INTO genre(genreno, genrename, genreseq)
VALUES (genre_seq.nextval, 'Crime', 3);


INSERT INTO genre(genreno, genrename, genreseq)
VALUES (genre_seq.nextval, '어드벤처', 2);

INSERT INTO genre(genreno, genrename, genreseq)
VALUES (genre_seq.nextval, 'Si-Fi', 3);

COMMIT;


-- ♣LIST♣

SELECT genreno, genrename, genreseq
FROM genre
ORDER BY genreno DESC;                                                         


-- ♣READ♣

SELECT (genreno, genrename, genreseq)
FROM genre
WHERE genreno = 1;     


-- ♣UPDATE♣

UPDATE genre
SET genreseq = 3
WHERE genreno = 3;      


-- ♣DELETE♣

DELETE 
FROM genre
WHERE genreno=6;                                             


