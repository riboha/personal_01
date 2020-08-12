/**********************************/
/* Table Name: 영화 장르 */
/**********************************/

DROP TABLE filmgenre CASCADE CONSTRAINTS;

CREATE TABLE filmgenre(
        filmgenreno                         NUMBER(30)       NOT NULL        PRIMARY KEY,
        genreno                             NUMBER(10)       NOT NULL,
        filmno                              NUMBER(10)       NOT NULL,
  FOREIGN KEY (genreno) REFERENCES genre (genreno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE filmgenre is '영화 장르';
COMMENT ON COLUMN filmgenre.filmgenreno is '영화 장르 번호';
COMMENT ON COLUMN filmgenre.genreno is '장르 번호';
COMMENT ON COLUMN filmgenre.filmno is '영화 번호';

DROP SEQUENCE filmgenre_seq;

CREATE SEQUENCE filmgenre_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO filmgenre(filmgenreno, genreno, filmno)
VALUES (filmgenre_seq.nextval, 1, 1);

INSERT INTO filmgenre(filmgenreno, genreno, filmno)
VALUES (filmgenre_seq.nextval, 2, 1);

INSERT INTO filmgenre(filmgenreno, genreno, filmno)
VALUES (filmgenre_seq.nextval, 3, 1);


INSERT INTO filmgenre(filmgenreno, genreno, filmno)
VALUES (filmgenre_seq.nextval, 1, 8);

INSERT INTO filmgenre(filmgenreno, genreno, filmno)
VALUES (filmgenre_seq.nextval, 9, 8);

INSERT INTO filmgenre(filmgenreno, genreno, filmno)
VALUES (filmgenre_seq.nextval, 12, 8);


COMMIT;


-- ♣LIST♣

SELECT filmgenreno, genreno, filmno
FROM filmgenre
ORDER BY filmgenreno DESC;

-- ♣LIST by filmno♣

SELECT filmgenreno, genreno, filmno
FROM filmgenre
WHERE filmno = 8
ORDER BY filmgenreno DESC;


-- ♣UPDATE♣

UPDATE filmwish
SET filmno = 3, genreno = 1
WHERE filmwishno = 3;



-- ♣DELETE♣

DELETE 
FROM filmwish
WHERE filmwishno=6;  


-- ♣Genre + Film Inner Join♣



-- 장르별 영화 목록

SELECT g.genreno, g.genrename,
           f.filmno, f.titleen, f.titlekr, f.lan, f.year, f.len, f.restrict, f.dirno, f.postersize, f.poster, f.posterthumb,
           x.filmgenreno, x.genreno, x.filmno
FROM genre g, film f, filmgenre x
WHERE g.genreno = x.genreno AND f.filmno = x.filmno AND g.genreno = 1
ORDER BY x.filmno DESC;



-- 영화별 장르 목록

SELECT g.genreno, g.genrename,
           f.filmno, f.titleen, f.titlekr,
          x.filmgenreno, x.genreno as x_genreno, x.filmno as x_filmno
FROM genre g, film f, filmgenre x
WHERE g.genreno = x.genreno AND f.filmno = x.filmno AND f.filmno = 8

ORDER BY g.genreno DESC;

