/**********************************/
/* Table Name: ���θ�� ��ȭ */
/**********************************/

DROP TABLE promofilm CASCADE CONSTRAINTS;

CREATE TABLE promofilm (
        promofilmno                         NUMBER(10)       NOT NULL,
        promono                             NUMBER(10)       NOT NULL,
        filmno                              NUMBER(10)       NOT NULL
);

COMMENT ON TABLE promofilm  is '���θ�� ��ȭ';
COMMENT ON COLUMN promofilm .promofilmno is '���θ�� ��ȭ ��ȣ';
COMMENT ON COLUMN promofilm .promono is '���θ�� ��ȣ';
COMMENT ON COLUMN promofilm .filmno is '��ȭ ��ȣ';



DESC promofilm;


DROP SEQUENCE promofilm_seq;

CREATE SEQUENCE promofilm_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  

--------------------------------------------------------------------------------------------



-- ��CREATE��

INSERT INTO promofilm(promofilmno, promono, filmno)
VALUES (promofilm_seq.nextval, 1, 1);

INSERT INTO promofilm(promofilmno, promono, filmno)
VALUES (promofilm_seq.nextval, 1, 6);

INSERT INTO promofilm(promofilmno, promono, filmno)
VALUES (promofilm_seq.nextval, 1, 7);

COMMIT;

-- ��LIST��

SELECT promofilmno, promono, filmno
FROM promofilm
ORDER BY promofilmno;


-- ��READ��

SELECT promofilmno, promono, filmno
FROM promofilm
WHERE promofilmno = 4;


-- ��UPDATE��

UPDATE promofilm
SET promono = 2, filmno=14
WHERE promofilmno = 1;


-- ��DELETE��

DELETE 
FROM promofilm
WHERE promofilmno=1;  































