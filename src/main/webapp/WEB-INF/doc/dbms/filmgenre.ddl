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
WHERE filmno = 6
ORDER BY filmgenreno DESC;


-- ♣UPDATE♣

UPDATE filmgenre
SET filmno = 3, genreno = 1
WHERE filmgenreno = 3;



-- ♣DELETE♣

DELETE 
FROM filmgenre
WHERE filmno=23;  
COMMIT;

WHERE filmwishno=6;  


-- 영화번호별 레코드 갯수

SELECT COUNT(filmgenreno) as cnt
FROM filmgenre
WHERE filmno=8;


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

SELECT g.genrename, f.filmno          
FROM genre g, film f, filmgenre x
WHERE g.genreno = x.genreno AND f.filmno = x.filmno 
ORDER BY f.filmno DESC;



SELECT filmno, titlekr, poster
FROM film
WHERE ROWNUM <= 6
ORDER BY filmno DESC;

    FILMNO TITLEKR                         POSTER                                                                                              
---------- ----------------------------------------------------------
        24 ff                                       prada2_0.jpg                                                                                        
        23 악마는 사라지지 않는다         devilallthetime.jpg                                                                                 
        21 ff                                                                                                                                                                                                       
        20 ff                                                                                                                                                                                                       
        19 ff                                                                                                                                                                                                       
        18 ff                                                                                                                                                                                                       


SELECT filmno
FROM (           
            SELECT filmno
            FROM film
            WHERE ROWNUM <= 6
            ORDER BY filmno DESC
         );


    FILMNO          R
---------- ----------
        24          1
        23          2
        21          3
        20          4
        19          5
        18          6
        
        
        
        
SELECT MIN(filmno) AS filmno_min, MAX(filmno) AS filmno_max
FROM (           
            SELECT filmno
            FROM film
            WHERE ROWNUM <= 6
            ORDER BY filmno DESC
         );

FILMNO_MIN FILMNO_MAX
---------- ----------
        18         24
         


-- ♣ 메인 페이지용 최신순 6개 레코드에 해당하는 장르 레코드 

SELECT g.genrename, f.filmno          
FROM genre g, film f, filmgenre x, (SELECT MIN(filmno) AS filmno_min, MAX(filmno) AS filmno_max
                                                FROM (           
                                                            SELECT filmno
                                                            FROM film
                                                            WHERE ROWNUM <= 6
                                                            ORDER BY filmno DESC
                                                         ))
WHERE g.genreno = x.genreno AND f.filmno = x.filmno AND f.filmno <= filmno_max AND f.filmno >= filmno_min
ORDER BY f.filmno DESC;


-- ♣ 메인 페이지용 최신순 6개 레코드 출력
SELECT filmno, titlekr, poster
FROM film
WHERE ROWNUM <= 6
ORDER BY filmno DESC;


