/**********************************/
/* Table Name: ���ֹ������� */
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

COMMENT ON TABLE faq is '���ֹ�������';
COMMENT ON COLUMN faq.faqno is '�ڹ��� ��ȣ';
COMMENT ON COLUMN faq.faqtitle is '�ڹ��� ����';
COMMENT ON COLUMN faq.faqq is '�ڹ��� ����';
COMMENT ON COLUMN faq.faqa is '�ڹ��� �亯';
COMMENT ON COLUMN faq.faqhit is '�ڹ��� ��ȸ��';
COMMENT ON COLUMN faq.faqno is '���� ī�� ��ȣ';



DROP SEQUENCE faq_seq;

CREATE SEQUENCE faq_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����

--------------------------------------------------------------------------------------------



-- ��CREATE��

INSERT INTO faq(faqno, faqtitle, faqq, faqa, qcateno)
VALUES (genre_seq.nextval, '������ ����� �ȵſ�',  'faqq', 'faqa', 1);
INSERT INTO faq(faqno, faqtitle, faqq, faqa, qcateno)
VALUES (genre_seq.nextval, '������ �ڸ��� �ȶ���',  'faqq', 'faqa', 1);
INSERT INTO faq(faqno, faqtitle, faqq, faqa, qcateno)
VALUES (genre_seq.nextval, '������ ȭ���� �ʹ� ���ƿ�',  'faqq', 'faqa', 1);

COMMIT;



-- ��LIST��

SELECT faqno, faqtitle, faqq, faqa, qcateno
FROM faq
ORDER BY faqhit DESC;


-- ��READ��

SELECT faqno, faqtitle, faqq, faqa, qcateno
FROM faq
WHERE faqno = 6;


-- ��UPDATE��

UPDATE faq
SET faqtitle = '����', faqq='�̻��ؿ�', faqa='�̷��� �غ�����', qcateno=2
WHERE faqno = 6;



-- ��DELETE��

DELETE 
FROM faq ;
WHERE faqno=3;  


