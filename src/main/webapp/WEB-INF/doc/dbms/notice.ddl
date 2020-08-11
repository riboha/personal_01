/**********************************/
/* Table Name: ���� */
/**********************************/

DROP TABLE notice CASCADE CONSTRAINTS;

CREATE TABLE notice(
        noticeno                            NUMBER(10)       NOT NULL        PRIMARY KEY,
        noticetitle                         VARCHAR2(200)       NOT NULL,
        noticecontent                       CLOB         NOT NULL,
		noticedate                    		DATE		 NOT NULL,
        noticeshow                          NUMBER(1)        DEFAULT 1       NOT NULL,
        noticeseq                           NUMBER(10)       DEFAULT 1       NOT NULL,
        adminno                             NUMBER(10)       NOT NULL,
  FOREIGN KEY (adminno) REFERENCES admin (adminno)
);

COMMENT ON TABLE notice is '����';
COMMENT ON COLUMN notice.noticeno is '���� ��ȣ';
COMMENT ON COLUMN notice.noticetitle is '���� ����';
COMMENT ON COLUMN notice.noticecontent is '���� ����';
COMMENT ON COLUMN notice.noticedate is '���� ��¥';
COMMENT ON COLUMN notice.noticeshow is '���� ��� ����';
COMMENT ON COLUMN notice.noticeseq is '��� ����';
COMMENT ON COLUMN notice.adminno is '������ ��ȣ';


DROP SEQUENCE notice_seq;

CREATE SEQUENCE notice_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  
  --------------------------------------------------------------------------------------------



-- ��CREATE��

INSERT INTO notice(noticeno, noticetitle, noticecontent, noticedate, noticeshow, noticeseq, adminno)
VALUES (notice_seq.nextval, '�ڸ� ���� ����', '�ڸ� �߰� �ȳ�', sysdate, 1, 1, 1);

COMMIT;


-- ��LIST��

SELECT noticeno, noticetitle, noticecontent, noticedate, noticeshow, noticeseq, adminno
FROM notice
ORDER BY noticeno;



-- ��UPDATE��

UPDATE notice
SET noticetitle = '���� ��� �߰� �ȳ�', noticecontent = '���� �߰�', noticeshow = 1, noticeseq = 5
WHERE noticeno = 1;



-- ��DELETE��

DELETE 
FROM notice;
WHERE noticeno=3;  



  

