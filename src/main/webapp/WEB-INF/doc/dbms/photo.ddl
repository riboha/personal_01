/**********************************/
/* Table Name: 영화 사진 */
/**********************************/

DROP TABLE photo CASCADE CONSTRAINTS;

CREATE TABLE photo(
        photono                             NUMBER(10)       NOT NULL,
        photoname                           VARCHAR2(300)        NOT NULL,
        photoalt                            VARCHAR2(1000)       NULL ,
        photothumb                           VARCHAR2(300)        NOT NULL,
        photosize                           NUMBER(10)       DEFAULT 0       NOT NULL,
        filmno                              NUMBER(10)       NOT NULL
);

COMMENT ON TABLE photo is '영화 사진';
COMMENT ON COLUMN photo.photono is '영화 사진 번호';
COMMENT ON COLUMN photo.photoname is '영화 사진';
COMMENT ON COLUMN photo.photoalt is '영화 사진 설명';
COMMENT ON COLUMN photo.photothumb is '영화 사진 썸네일';
COMMENT ON COLUMN photo.photosize is '영화 사진 사이즈';
COMMENT ON COLUMN photo.filmno is '영화 번호';


DROP SEQUENCE photo_seq;

CREATE SEQUENCE photo_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  
 
 --------------------------------------------------------------------------------------------
 
-- ♣CREATE♣

INSERT INTO photo(photono, photoname, photoalt, photothumb, photosize, filmno)
VALUES (photo_seq.nextval, 'RobertAndPaul', 'They are discussing', 'RobertAndPaul_t', 500, 1);

COMMIT;

-- ♣LIST♣

SELECT photono, photoname, photoalt, photothumb, photosize, filmno
FROM photo
ORDER BY photono ASC, filmno DESC;



-- ♣READ♣

SELECT photono, photoname, photoalt, photothumb, photosize, filmno
FROM photo
WHERE photono = 1;


-- ♣UPDATE♣

UPDATE photo
SET photoname = 'JakeAndRobert'
WHERE photono = 1;


-- ♣DELETE♣

DELETE 
FROM photo
WHERE photono=1;  

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 