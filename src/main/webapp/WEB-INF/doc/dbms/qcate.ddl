/**********************************/
/* Table Name: 문의 카테고리 */
/**********************************/

DROP TABLE qcate CASCADE CONSTRAINTS;

CREATE TABLE qcate(
        qcateno                             NUMBER(10)       NOT NULL        PRIMARY KEY,
        qcatetitle                          VARCHAR2(100)        NOT NULL,
        qcateicon                           VARCHAR2(100)        NOT NULL,
        qcateseq                            NUMBER(10)       DEFAULT 1       NOT NULL
);

COMMENT ON TABLE qcate is '문의 카테고리';
COMMENT ON COLUMN qcate.qcateno is '문의 카테 번호';
COMMENT ON COLUMN qcate.qcatetitle is '문의 카테 제목';
COMMENT ON COLUMN qcate.qcateicon is '문의 카테 아이콘';
COMMENT ON COLUMN qcate.qcateseq is '문의 카테 순서';

--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO qcate(qcateno, qcatetitle, qcateicon)
VALUES ((SELECT NVL(MAX(qcateno), 0) + 1 as qcateno FROM qcate), '콘텐츠', 'tv');

INSERT INTO qcate(qcateno, qcatetitle, qcateicon)
VALUES ((SELECT NVL(MAX(qcateno), 0) + 1 as qcateno FROM qcate), '결제', 'film');

INSERT INTO qcate(qcateno, qcatetitle, qcateicon)
VALUES ((SELECT NVL(MAX(qcateno), 0) + 1 as qcateno FROM qcate), '기기', 'download');

INSERT INTO qcate(qcateno, qcatetitle, qcateicon)
VALUES ((SELECT NVL(MAX(qcateno), 0) + 1 as qcateno FROM qcate), '계정', 'search');

INSERT INTO qcate(qcateno, qcatetitle, qcateicon)
VALUES ((SELECT NVL(MAX(qcateno), 0) + 1 as qcateno FROM qcate), '기타', 'chatbubbles');

COMMIT;



-- ♣LIST♣

SELECT qcateno, qcatetitle, qcateicon, qcateseq
FROM qcate
ORDER BY qcateseq DESC;



-- ♣UPDATE♣

UPDATE qcate
SET qcatetitle = '공포', qcateicon=2, qcateseq=6
WHERE qcateno = 2;



-- ♣DELETE♣

DELETE 
FROM qcate ;
WHERE qcateno=3;  


