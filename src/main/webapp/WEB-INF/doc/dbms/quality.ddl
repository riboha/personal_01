/**********************************/
/* Table Name: 지원 화질 */
/**********************************/
DROP TABLE quality CASCADE CONSTRAINTS;

CREATE TABLE quality(
        qualno                              NUMBER(10)       NOT NULL        PRIMARY KEY,
        q576                                NUMBER(1)        DEFAULT 0       NOT NULL,
        q720                                NUMBER(1)        DEFAULT 0       NOT NULL,
        q1024                               NUMBER(1)        DEFAULT 0       NOT NULL,
        q1440                               NUMBER(1)        DEFAULT 0       NOT NULL,
        filmno                              NUMBER(10)       NOT NULL,
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);


COMMENT ON TABLE quality is '지원 화질';
COMMENT ON COLUMN quality.qualno is '지원 화질 번호';
COMMENT ON COLUMN quality.q576 is '576p';
COMMENT ON COLUMN quality.q720 is '720P';
COMMENT ON COLUMN quality.q1024 is '1024p';
COMMENT ON COLUMN quality.q1440 is '1440p';
COMMENT ON COLUMN quality.filmno is '영화 번호';



 --------------------------------------------------------------------------------------------
  
  
-- ♣CREATE♣
-- qualno = filmno

INSERT INTO quality (qualno, q576, q720, q1024, q1440, filmno)
VALUES (1, 1, 1, 1, 0, 1);

INSERT INTO quality (qualno, q576, q720, q1024, q1440, filmno)
VALUES (8, 1, 1, 1, 0, 8);

INSERT INTO quality (qualno, q576, q720, q1024, q1440, filmno)
VALUES (2, 1, 1, 1, 0, 2);

INSERT INTO quality (qualno, q576, q720, q1024, q1440, filmno)
VALUES (3, 1, 1, 1, 1,  3);


COMMIT;



-- ♣LIST♣

SELECT qualno, q576, q720, q1024, q1440, filmno
FROM quality
ORDER BY qualno;



-- ♣READ♣

SELECT qualno, q576, q720, q1024, q1440, filmno
FROM quality
WHERE filmno = 8;



-- ♣UPDATE♣

UPDATE quality
SET q1440 = 0
WHERE qualno = 3;



-- ♣DELETE♣

DELETE 
FROM quality
WHERE qualno=23;  














































