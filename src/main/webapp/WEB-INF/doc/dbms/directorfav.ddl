/**********************************/
/* Table Name: 좋아하는 감독 */
/**********************************/

DROP TABLE directorfav CASCADE CONSTRAINTS;

CREATE TABLE directorfav(
        dirfavno                            NUMBER(30)       NOT NULL        PRIMARY KEY,
        memberno                            NUMBER(10)       NOT NULL,
        dirno                               NUMBER(10)       NOT NULL       UNIQUE,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (dirno) REFERENCES director (dirno)
);

COMMENT ON TABLE directorfav is '좋아하는 감독';
COMMENT ON COLUMN directorfav.dirfavno is '좋아하는 감독 번호';
COMMENT ON COLUMN directorfav.memberno is '회원 번호';
COMMENT ON COLUMN directorfav.dirno is '감독 번호';

DROP SEQUENCE directorfav_seq;

CREATE SEQUENCE directorfav_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO directorfav(dirfavno, dirno, memberno)
VALUES (directorfav_seq.nextval, 1, 1);

INSERT INTO directorfav(dirfavno, dirno, memberno)
VALUES (directorfav_seq.nextval, 2, 1);

INSERT INTO directorfav(dirfavno, dirno, memberno)
VALUES (directorfav_seq.nextval, 3, 1);

COMMIT;


-- ♣LIST♣

SELECT dirfavno, dirno, memberno
FROM directorfav
ORDER BY dirfavno DESC;                                                         


-- ♣READ♣

SELECT dirfavno, dirno, memberno
FROM directorfav
WHERE dirfavno = 1;     


-- ♣UPDATE♣

UPDATE directorfav
SET dirno = 3, memberno = 1
WHERE dirfavno = 3;      


-- ♣DELETE♣

DELETE 
FROM directorfav
WHERE dirfavno=6;                                             





-- Director, Member, Directorfav Join
-- 회원별 좋아하는 영화 리스트
             
SELECT d.dirno, d.dirnamekr, d.dirnameen, d.dirphoto,
            m.memberno,
            x.dirfavno
FROM director d, member m, directorfav x
WHERE d.dirno=x.dirno AND m.memberno = x.memberno AND x.memberno = 1
ORDER BY dirfavno DESC;



