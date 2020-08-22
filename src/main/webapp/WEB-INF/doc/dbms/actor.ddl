/**********************************/
/* Table Name: 배우 */
/**********************************/
DROP TABLE actor CASCADE CONSTRAINTS;

CREATE TABLE actor(
        actorno                             NUMBER(10)       NOT NULL        PRIMARY KEY,
        actornameen                         VARCHAR2(100)        NOT NULL       UNIQUE,
        actornamekr                         VARCHAR2(100)        NOT NULL       UNIQUE,
        birth                               DATE         NOT NULL,
        nation                              VARCHAR2(100)        NOT NULL,
        actorpic                            VARCHAR2(100)        NULL ,
        actorthumb                          VARCHAR2(100)        NULL ,
        actorpicsize                        NUMBER(10)       DEFAULT 0       NOT NULL,
        actorhit                            NUMBER(10)       DEFAULT 0       NOT NULL
);

COMMENT ON TABLE actor is '배우';
COMMENT ON COLUMN actor.actorno is '배우 번호';
COMMENT ON COLUMN actor.actornameen is '영문 이름';
COMMENT ON COLUMN actor.actornamekr is '한글 이름';
COMMENT ON COLUMN actor.birth is '생년월일';
COMMENT ON COLUMN actor.nation is '국적';
COMMENT ON COLUMN actor.actorpic is '프로필';
COMMENT ON COLUMN actor.actorthumb is '프로필 썸네일';
COMMENT ON COLUMN actor.actorpicsize is '프로필 크기';
COMMENT ON COLUMN actor.actorhit is '좋아요수';


DESC actor;

ALTER TABLE actor ADD  UNIQUE (actornamekr);
ALTER TABLE actor ADD  UNIQUE (actornameen);


DROP SEQUENCE actor_seq;

CREATE SEQUENCE actor_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO actor(actorno, actornameen, actornamekr,  birth, nation, actorpic, actorthumb, actorpicsize)
VALUES (actor_seq.nextval, 'Zooey Deschanel', '주이 디샤넬', '1980-01-17', 'USA', null, null, 0);

INSERT INTO actor(actorno, actornameen, actornamekr,  birth, nation, actorpic, actorthumb, actorpicsize)
VALUES (actor_seq.nextval, 'Chris Hemsworth', '크리스 햄스워스', '1983-08-11', 'Australia', null, null, 0);

INSERT INTO actor(actorno, actornameen, actornamekr,  birth, nation, actorpic, actorthumb, actorpicsize)
VALUES (actor_seq.nextval, 'Sarah Shahi', '사라 샤히', '1980-01-10', 'USA', null, null, 0);

INSERT INTO actor(actorno, actornameen, actornamekr,  birth, nation, actorpic, actorthumb, actorpicsize)
VALUES (actor_seq.nextval, 'Emily Blunt', '에밀리 블런트', '1983-02-23', 'England', null, null, 0);

INSERT INTO actor(actorno, actornameen, actornamekr,  birth, nation, actorpic, actorthumb, actorpicsize)
VALUES (actor_seq.nextval, 'Anne Hathaway', '앤 해서웨이', '1982-11-12', 'USA', null, null, 0);

INSERT INTO actor(actorno, actornameen, actornamekr,  birth, nation, actorpic, actorthumb, actorpicsize)
VALUES (actor_seq.nextval, 'Meryl Streep', '메릴 스트립', '1949-06-22', 'USA', null, null, 0);

COMMIT;

-- ♣LIST♣

SELECT actorno, actornameen, actornamekr,  birth, nation, actorpic, actorthumb, actorpicsize
FROM actor
ORDER BY actorno;


-- ♣READ♣

SELECT actorno, actornameen, actornamekr, birth, nation, actorpic, actorthumb, actorpicsize
FROM actor
WHERE actorno = 4;


-- ♣UPDATE♣

UPDATE actor
SET actornameen = 'Maya Hawke', actornamekr='마야 호크', birth='1998-07-08', nation='USA', 
        actorpic=null, actorthumb=null, actorpicsize=0
WHERE actorno = 1;

UPDATE actor 
SET actorpic = null, actorthumb = null, actorpicsize = 0
WHERE actorno= 1;



-- ♣DELETE♣

DELETE 
FROM actor;  


DELETE 
FROM actor
WHERE actorno=1;  


-- 검색 기능 (이름)

SELECT DISTINCT actornameen, actornamekr, actorno
FROM actor
WHERE upper(dirnameen) like upper('%y%') OR  dirnamekr like '%y%';
        AND ROWID IN (SELECT MAX(ROWID) FROM actor GROUP BY actorno)


-- '배우 이름' 배열에 따른 '배우 번호' 배열 반환
SELECT actorno
FROM actor
WHERE actornameen = 'Chris Hemsworth';



-- ♣ Paging + Searching ♣

-- actorno 목록
SELECT filmno
FROM ( 
          SELECT filmno,  rownum as r
          FROM (
                      SELECT DISTINCT f.filmno                         
                      FROM film f, quality q, language l, genre g, filmgenre x            
                      WHERE f.filmno = q.filmno AND f.filmno = l.filmno AND f.filmno = x.filmno AND g.genreno = x.genreno 
                      ORDER BY filmno DESC
                    )          
         )
WHERE r >= 1 AND r <= 10;
         


-- 검색 조건: ActorVO actornameen, actornamekr, Cast role, Film title
-- 목록

-- Actor 
SELECT actorno, actornameen, actornamekr,  birth, nation, actorpic, actorthumb, actorpicsize
FROM actor
ORDER BY actorno;

-- Film
SELECT filmno, titleen, titlekr, lan, year, len, restrict, dirno, postersize, poster, posterthumb
FROM film
ORDER BY photono ASC, filmno DESC;


SELECT castno, actorno, role, filmno
FROM cast
ORDER BY castno;





WHERE f.filmno = c.filmno AND a.actorno = c.actorno
FROM actor a, film f, cast c
ORDER BY actorno;




SELECT filmno
FROM ( 
          SELECT filmno,  rownum as r
          FROM (
                      SELECT DISTINCT f.filmno                         
                      FROM film f, quality q, language l, genre g, filmgenre x            
                      WHERE f.filmno = q.filmno AND f.filmno = l.filmno AND f.filmno = x.filmno AND g.genreno = x.genreno 
                      ORDER BY filmno DESC
                    )          
         )
WHERE r >= 1 AND r <= 10;
         























