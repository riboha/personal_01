/**********************************/
/* Table Name: ���� ī�װ� */
/**********************************/

DROP TABLE qcate CASCADE CONSTRAINTS;


CREATE TABLE qcate(
        qcateno                             NUMBER(3)        NOT NULL        PRIMARY KEY,
        qcatetitle                          VARCHAR2(10)         NOT NULL,
        qcateseq                            NUMBER(10)       NOT NULL
);

COMMENT ON TABLE qcate is '���� ī�װ�';
COMMENT ON COLUMN qcate.qcateno is '���� ī�� ��ȣ';
COMMENT ON COLUMN qcate.qcatetitle is '���� ī�� ����';
COMMENT ON COLUMN qcate.qcateseq is '���� ī�� ����';


DROP SEQUENCE genre_seq;

CREATE SEQUENCE genre_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  

--------------------------------------------------------------------------------------------



-- ��CREATE��

INSERT INTO genre(genreno, genrename, genreseq)
VALUES (genre_seq.nextval, 'Drama', 1);

INSERT INTO genre(genreno, genrename, genreseq)
VALUES (genre_seq.nextval, 'Mystery', 2);

INSERT INTO genre(genreno, genrename, genreseq)
VALUES (genre_seq.nextval, 'Crime', 3);

COMMIT;


-- ��LIST��

SELECT genreno, genrename, genreseq
FROM genre
ORDER BY genreno DESC;