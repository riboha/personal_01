/**********************************/
/* Table Name: ���� ī�װ� */
/**********************************/

DROP TABLE qcate CASCADE CONSTRAINTS;

CREATE TABLE qcate(
        qcateno                             NUMBER(10)       NOT NULL        PRIMARY KEY,
        qcatetitle                          VARCHAR2(100)        NOT NULL,
        qcateicon                           VARCHAR2(100)        NOT NULL,
        qcateseq                            NUMBER(10)       DEFAULT 1       NOT NULL
);

COMMENT ON TABLE qcate is '���� ī�װ�';
COMMENT ON COLUMN qcate.qcateno is '���� ī�� ��ȣ';
COMMENT ON COLUMN qcate.qcatetitle is '���� ī�� ����';
COMMENT ON COLUMN qcate.qcateicon is '���� ī�� ������';
COMMENT ON COLUMN qcate.qcateseq is '���� ī�� ����';

--------------------------------------------------------------------------------------------



-- ��CREATE��

INSERT INTO qcate(qcateno, qcatetitle, qcateicon)
VALUES ((SELECT NVL(MAX(qcateno), 0) + 1 as qcateno FROM qcate), '������', 'tv');

INSERT INTO qcate(qcateno, qcatetitle, qcateicon)
VALUES ((SELECT NVL(MAX(qcateno), 0) + 1 as qcateno FROM qcate), '����', 'film');

INSERT INTO qcate(qcateno, qcatetitle, qcateicon)
VALUES ((SELECT NVL(MAX(qcateno), 0) + 1 as qcateno FROM qcate), '���', 'download');

INSERT INTO qcate(qcateno, qcatetitle, qcateicon)
VALUES ((SELECT NVL(MAX(qcateno), 0) + 1 as qcateno FROM qcate), '����', 'search');

INSERT INTO qcate(qcateno, qcatetitle, qcateicon)
VALUES ((SELECT NVL(MAX(qcateno), 0) + 1 as qcateno FROM qcate), '��Ÿ', 'chatbubbles');

COMMIT;



-- ��LIST��

SELECT qcateno, qcatetitle, qcateicon, qcateseq
FROM qcate
ORDER BY qcateseq DESC;



-- ��UPDATE��

UPDATE qcate
SET qcatetitle = '����', qcateicon=2, qcateseq=6
WHERE qcateno = 2;



-- ��DELETE��

DELETE 
FROM qcate ;
WHERE qcateno=3;  


