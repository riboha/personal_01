/**********************************/
/* Table Name: 보고싶은 영화 */
/**********************************/

DROP TABLE filmwish CASCADE CONSTRAINTS;

CREATE TABLE filmwish(
        filmwishno                          NUMBER(30)       NOT NULL        PRIMARY KEY,
        memberno                            NUMBER(10)       NOT NULL,
        filmno                              NUMBER(10)       NOT NULL   UNIQUE,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE filmwish is '보고싶은 영화';
COMMENT ON COLUMN filmwish.filmwishno is '보고싶은 영화 번호';
COMMENT ON COLUMN filmwish.memberno is '회원 번호';
COMMENT ON COLUMN filmwish.filmno is '영화 번호';

DROP SEQUENCE filmwish_seq;

CREATE SEQUENCE filmwish_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO filmwish(filmwishno, filmno, memberno)
VALUES (filmwish_seq.nextval, 1, 1);

INSERT INTO filmwish(filmwishno, filmno, memberno)
VALUES (filmwish_seq.nextval, 2, 1);

INSERT INTO filmwish(filmwishno, filmno, memberno)
VALUES (filmwish_seq.nextval, 3, 1);

COMMIT;


-- ♣LIST♣

SELECT filmwishno, filmno, memberno
FROM filmwish
ORDER BY filmwishno DESC;                                                         


-- ♣READ♣

SELECT filmwishno, filmno, memberno
FROM filmwish
WHERE filmwishno = 1;     


-- 중복 확인


SELECT COUNT(filmwishno) as cnt
FROM filmwish
WHERE memberno=1 AND filmno = 1;
 


-- ♣UPDATE♣

UPDATE filmwish
SET filmno = 3, memberno = 1
WHERE filmwishno = 3;      


-- ♣DELETE♣

DELETE 
FROM filmwish
WHERE filmwishno=6;             




-- Film, Member, Filmwish Join
-- 회원별 보고싶은 영화 리스트
             

SELECT f.filmno, f.titleen, f.titlekr, f.poster,
            m.memberno,
            x.filmwishno
FROM film f, member m, filmwish x
WHERE f.filmno=x.filmno AND m.memberno = x.memberno AND x.memberno = 1
ORDER BY filmwishno DESC;

                                


