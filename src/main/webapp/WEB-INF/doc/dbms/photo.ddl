/**********************************/
/* Table Name: ���� */
/**********************************/
DROP TABLE photo CASCADE CONSTRAINTS;

CREATE TABLE photo(
        photono                             NUMBER(10)       NOT NULL        PRIMARY KEY,
        photoname                           VARCHAR2(300)        NOT NULL,
        photohumb                           VARCHAR2(300)        NOT NULL,
        photosize                           NUMBER(10)       NOT NULL,
        filmno                              NUMBER(10)       NOT NULL,
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE photo is '����';
COMMENT ON COLUMN photo.photono is '���� ��ȣ';
COMMENT ON COLUMN photo.photoname is '���� ���ϸ�';
COMMENT ON COLUMN photo.photohumb is '���� �����';
COMMENT ON COLUMN photo.photosize is '���� ������';
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

INSERT INTO photo(photono, photoname, photohumb, photosize, filmno)
VALUES (photo_seq.nextval, 'RobertAndPaul', 'RobertAndPaul_t', 500, 1);


-- ��LIST��

SELECT photono, photoname, photohumb, photosize, filmno
FROM photo
ORDER BY photono ASC, filmno DESC;



-- ��READ��

SELECT photono, photoname, photohumb, photosize, filmno
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

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 