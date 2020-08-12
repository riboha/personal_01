/**********************************/
/* Table Name: 좋아하는 영화 */
/**********************************/

DROP TABLE filmfav CASCADE CONSTRAINTS;

CREATE TABLE filmfav(
        filmfavno                           NUMBER(30)       NOT NULL        PRIMARY KEY,
        memberno                            NUMBER(10)       NOT NULL,
        filmno                              NUMBER(10)       NOT NULL,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE filmfav is '좋아하는 영화';
COMMENT ON COLUMN filmfav.filmfavno is '좋아하는 영화 번호';
COMMENT ON COLUMN filmfav.memberno is '회원 번호';
COMMENT ON COLUMN filmfav.filmno is '영화 번호';

DROP SEQUENCE filmfav_seq;

CREATE SEQUENCE filmfav_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO filmfav(filmfavno, filmno, memberno)
VALUES (filmfav_seq.nextval, 1, 1);

INSERT INTO filmfav(filmfavno, filmno, memberno)
VALUES (filmfav_seq.nextval, 2, 1);

INSERT INTO filmfav(filmfavno, filmno, memberno)
VALUES (filmfav_seq.nextval, 3, 1);

COMMIT;


-- ♣LIST♣

SELECT filmfavno, filmno, memberno
FROM filmfav
ORDER BY filmfavno DESC;                                                         


-- ♣READ♣

SELECT filmfavno, filmno, memberno
FROM filmfav
WHERE filmfavno = 1;     


-- ♣UPDATE♣

UPDATE filmfav
SET filmno = 3, memberno = 1
WHERE filmfavno = 3;      


-- ♣DELETE♣

DELETE 
FROM filmfav
WHERE filmfavno=6;                                             


