/**********************************/
/* Table Name: 좋아하는 배우 */
/**********************************/

DROP TABLE actorfav CASCADE CONSTRAINTS;

CREATE TABLE actorfav(
        actorfavno                          NUMBER(30)       NOT NULL        PRIMARY KEY,
        actorno                             NUMBER(10)       NOT NULL       ,
        memberno                            NUMBER(10)       NOT NULL,
  FOREIGN KEY (actorno) REFERENCES actor (actorno),
  FOREIGN KEY (memberno) REFERENCES member (memberno)
);

COMMENT ON TABLE actorfav is '좋아하는 배우';
COMMENT ON COLUMN actorfav.actorfavno is '좋아하는 배우 번호';
COMMENT ON COLUMN actorfav.actorno is '배우 번호';
COMMENT ON COLUMN actorfav.memberno is '회원 번호';

DROP SEQUENCE actorfav_seq;

CREATE SEQUENCE actorfav_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO actorfav(actorfavno, actorno, memberno)
VALUES (actorfav_seq.nextval, 1, 1);

INSERT INTO actorfav(actorfavno, actorno, memberno)
VALUES (actorfav_seq.nextval, 2, 1);

INSERT INTO actorfav(actorfavno, actorno, memberno)
VALUES (actorfav_seq.nextval, 3, 1);

COMMIT;


-- ♣LIST♣

SELECT actorfavno, actorno, memberno
FROM actorfav
ORDER BY actorfavno DESC;                                                         


-- ♣READ♣

SELECT actorfavno, actorno, memberno
FROM actorfav
WHERE actorfavno = 1;     


-- ♣UPDATE♣

UPDATE actorfav
SET actorno = 3, memberno = 1
WHERE actorfavno = 3;      


-- ♣DELETE♣

DELETE 
FROM actorfav
WHERE actorfavno=6;                                             




-- Actor, Member, Actorfav Join
-- 회원별 좋아하는 영화 리스트

SELECT a.actorno, a.actornameen, a.actornamekr, a.actorpic,
            m.memberno,
            x.actorfavno
FROM actor a, member m, actorfav x
WHERE a.actorno=x.actorno AND m.memberno = x.memberno AND x.memberno = 1
ORDER BY actorfavno DESC;


-- 배우별 좋아요 수

SELECT COUNT (actorfavno) as cnt
FROM actorfav
WHERE actorno = 1
ORDER BY actorfavno DESC;          



