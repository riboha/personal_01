/**********************************/
/* Table Name: 문의 카테고리 */
/**********************************/

DROP TABLE qcate CASCADE CONSTRAINTS;


CREATE TABLE qcate(
        qcateno                             NUMBER(3)        NOT NULL        PRIMARY KEY,
        qcatetitle                          VARCHAR2(10)         NOT NULL,
        qcateseq                            NUMBER(10)       NOT NULL
);

COMMENT ON TABLE qcate is '문의 카테고리';
COMMENT ON COLUMN qcate.qcateno is '문의 카테 번호';
COMMENT ON COLUMN qcate.qcatetitle is '문의 카테 제목';
COMMENT ON COLUMN qcate.qcateseq is '문의 카테 순서';


DROP SEQUENCE genre_seq;

CREATE SEQUENCE genre_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO genre(genreno, genrename, genreseq)
VALUES (genre_seq.nextval, 'Drama', 1);

INSERT INTO genre(genreno, genrename, genreseq)
VALUES (genre_seq.nextval, 'Mystery', 2);

INSERT INTO genre(genreno, genrename, genreseq)
VALUES (genre_seq.nextval, 'Crime', 3);

COMMIT;


-- ♣LIST♣

SELECT genreno, genrename, genreseq
FROM genre
ORDER BY genreno DESC;