/**********************************/
/* Table Name: ��ȭ ���� */
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

COMMENT ON TABLE photo is '��ȭ ����';
COMMENT ON COLUMN photo.photono is '��ȭ ���� ��ȣ';
COMMENT ON COLUMN photo.photoname is '��ȭ ����';
COMMENT ON COLUMN photo.photoalt is '��ȭ ���� ����';
COMMENT ON COLUMN photo.photothumb is '��ȭ ���� �����';
COMMENT ON COLUMN photo.photosize is '��ȭ ���� ������';
COMMENT ON COLUMN photo.filmno is '��ȭ ��ȣ';


DROP SEQUENCE photo_seq;

CREATE SEQUENCE photo_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
 
 --------------------------------------------------------------------------------------------
 
-- ��CREATE��

INSERT INTO photo(photono, photoname, photoalt, photothumb, photosize, filmno)
VALUES (photo_seq.nextval, 'RobertAndPaul', 'They are discussing', 'RobertAndPaul_t', 500, 1);

COMMIT;

-- ��LIST��

SELECT photono, photoname, photoalt, photothumb, photosize, filmno
FROM photo
ORDER BY photono ASC, filmno DESC;



-- ��READ��

SELECT photono, photoname, photoalt, photothumb, photosize, filmno
FROM photo
WHERE photono = 1;


-- ��UPDATE��

UPDATE photo
SET photoname = 'JakeAndRobert'
WHERE photono = 1;


-- ��DELETE��

DELETE 
FROM photo
WHERE photono=1;  

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 