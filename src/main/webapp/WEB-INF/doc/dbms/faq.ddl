/**********************************/
/* Table Name: 자주묻는질문 */
/**********************************/

DROP TABLE faq CASCADE CONSTRAINTS;

CREATE TABLE faq(
        faqno                               NUMBER(10)       NOT NULL        PRIMARY KEY,
        faqtitle                            VARCHAR2(100)        NOT NULL,
        faqq                                CLOB         NOT NULL,
        faqa                                CLOB         NOT NULL,
        faqhit                              NUMBER(10)       DEFAULT 0       NOT NULL,
        qcateno                             NUMBER(10)       NOT NULL,
  FOREIGN KEY (qcateno) REFERENCES qcate (qcateno)
);

COMMENT ON TABLE faq is '자주묻는질문';
COMMENT ON COLUMN faq.faqno is '자묻질 번호';
COMMENT ON COLUMN faq.faqtitle is '자묻질 제목';
COMMENT ON COLUMN faq.faqq is '자묻질 내용';
COMMENT ON COLUMN faq.faqa is '자묻질 답변';
COMMENT ON COLUMN faq.faqhit is '자묻질 조회수';
COMMENT ON COLUMN faq.faqno is '문의 카테 번호';



DROP SEQUENCE faq_seq;

CREATE SEQUENCE faq_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지

--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO faq(faqno, faqtitle, faqq, faqa, qcateno)
VALUES (genre_seq.nextval, '콘텐츠 재생이 안돼요',  'faqq', 'faqa', 1);
INSERT INTO faq(faqno, faqtitle, faqq, faqa, qcateno)
VALUES (genre_seq.nextval, '콘텐츠 자막이 안떠요',  'faqq', 'faqa', 1);
INSERT INTO faq(faqno, faqtitle, faqq, faqa, qcateno)
VALUES (genre_seq.nextval, '콘텐츠 화질이 너무 낮아요',  'faqq', 'faqa', 1);

COMMIT;



-- ♣LIST♣

SELECT faqno, faqtitle, faqq, faqa, qcateno
FROM faq
ORDER BY faqhit DESC;


-- ♣READ♣

SELECT faqno, faqtitle, faqq, faqa, qcateno
FROM faq
WHERE faqno = 6;


-- ♣UPDATE♣

UPDATE faq
SET faqtitle = '공포', faqq='이상해요', faqa='이렇게 해보세요', qcateno=2
WHERE faqno = 6;



-- ♣DELETE♣

DELETE 
FROM faq ;
WHERE faqno=3;  


