
/**********************************/
/* Table Name: 감독 */
/**********************************/
DROP TABLE director CASCADE CONSTRAINTS;

CREATE TABLE director(
        dirno                               NUMBER(10)       NOT NULL        PRIMARY KEY,
        dirnamekr                           VARCHAR2(200)        NOT NULL   UNIQUE,
        dirnameen                           VARCHAR2(200)        NOT NULL   UNIQUE,
        dirnation                           VARCHAR2(100)        NOT NULL,
        dirphoto                            VARCHAR2(300)        NULL ,
        dirthumb                            VARCHAR2(300)        NULL ,
        dirphotosize                        NUMBER(10)       NULL 
);

COMMENT ON TABLE director is '감독';
COMMENT ON COLUMN director.dirno is '감독 번호';
COMMENT ON COLUMN director.dirnamekr is '감독 한글 이름';
COMMENT ON COLUMN director.dirnameen is '감독 영어 이름';
COMMENT ON COLUMN director.dirnation is '감독 국적';
COMMENT ON COLUMN director.dirphoto is '감독 사진';
COMMENT ON COLUMN director.dirthumb is '감독 사진 썸네일';
COMMENT ON COLUMN director.dirphotosize is '감독 사진 크기';



-- ALTER TABLE film ADD (postersize NUMBER(10));
-- ALTER TABLE film RENAME COLUMN thumb TO posterthumb;

-- ALTER TABLE director RENAME COLUMN directorno TO dirno;
-- ALTER TABLE director RENAME COLUMN directorname TO dirnamekr;
-- ALTER TABLE director RENAME COLUMN directornation TO dirnation;

-- ALTER TABLE director ADD (dirnameen VARCHAR(200));

-- ALTER TABLE director ADD (dirphoto VARCHAR(300));
-- ALTER TABLE director ADD (dirthumb VARCHAR(300));
-- ALTER TABLE director ADD (dirphotosize VARCHAR(300));

-- ALTER TABLE director ADD  UNIQUE (dirnamekr);
-- ALTER TABLE director ADD  UNIQUE (dirnameen);

-- ALTER TABLE  director DROP  UNIQUE (dirnamekr, dirnameen);
-- ALTER TABLE  director DROP  UNIQUE (dirnameen);
-- ALTER TABLE  director DROP  UNIQUE (dirnamekr);

DESC director;

DROP SEQUENCE director_seq;

CREATE SEQUENCE director_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
  --------------------------------------------------------------------------------------------
  
  
-- ♣CREATE♣



INSERT INTO director(dirno, dirnamekr, dirnameen, dirnation)
VALUES (director_seq.nextval, '데이비드 핀처', 'David Fincher', 'USA');

INSERT INTO director(dirno, dirnamekr, dirnameen, dirnation, dirphoto, dirphotosize, dirthumb)
VALUES (director_seq.nextval, '쿠엔틴 타란티노', 'Quentin Tarantino', 'USA', null, null, null);


INSERT INTO director(dirno, dirnamekr, dirnameen, dirnation, dirphoto, dirphotosize, dirthumb)
VALUES (director_seq.nextval, '크리스토퍼 놀란', 'Christopher Edward Nolan', 'England', null, null, null);




INSERT INTO director(dirno, dirnamekr, dirnameen, dirnation, dirphoto, dirphotosize, dirthumb)
VALUES (director_seq.nextval, '조지 밀러', 'George Miller', 'Australia', null, null, null);

INSERT INTO director(dirno, dirnamekr, dirnameen, dirnation, dirphoto, dirphotosize, dirthumb)
  VALUES (director_seq.nextval, '임순례', 'Yim Soon-rye', 'South Korea', null, 0, null);
  
  INSERT INTO director(dirno, dirnamekr, dirnameen, dirnation, dirphoto, dirphotosize, dirthumb)
  VALUES (director_seq.nextval, '존 패브로', 'John Favreau', 'USA', null, 0, null);

INSERT INTO director(dirno, dirnamekr, dirnameen, dirnation, dirphoto, dirphotosize, dirthumb)
  VALUES (director_seq.nextval, 'a', 'a', 'a', null, 0, null);

INSERT INTO director(dirno, dirnamekr, dirnameen, dirnation)
VALUES (director_seq.nextval, 'Kathryn Bigelow', 'USA');

COMMIT;


-- ♣LIST♣

SELECT dirno, dirnamekr, dirnameen, dirnation, dirphoto, dirphotosize, dirthumb
FROM director
ORDER BY dirno;


SELECT * FROM director;


-- ♣UPDATE♣

UPDATE director
SET dirnamekr='데이비드 핀처', dirnameen='David Fincher', dirnation='USA'
WHERE dirno = 1;

UPDATE director
SET dirnamekr='크리스토퍼 놀란', dirnameen='Christopher Nolan', dirnation='England'
WHERE dirno = 2;

UPDATE director
SET dirnamekr='캐서린 비글로우', dirnameen='Kathryn Bigelow', dirnation='USA'
WHERE dirno = 3;



-- ♣DELETE♣

DELETE 
FROM director
WHERE dirno=3;  


ROLLBACK;


COMMIT;



-- ♣SELECT: AUTOCOMPLETE 자동완성 검색 기능♣

-- Preset: Case insensitive → NOT WORKING! DONT KNOW WHY
-- ALTER SESSION SET NLS_COMP=LINGUISTIC;

-- ① LIKE 키워드 + UPPER 

SELECT dirnamekr, dirnameen, dirno
FROM director
WHERE upper(dirnameen) like upper('%W%') OR  dirnamekr like '%W%';


