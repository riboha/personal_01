/**********************************/
/* Table Name: ȸ�� */
/**********************************/

DROP TABLE member CASCADE CONSTRAINTS;

CREATE TABLE member(
        memberno                            NUMBER(10)       NOT NULL        PRIMARY KEY,
        id                                  VARCHAR2(60)         NOT NULL,
        pw                                  VARCHAR2(60)         NOT NULL,
        nick                                VARCHAR2(60)         NOT NULL,
        tel                                 NUMBER(11)       NOT NULL,
        pnt                                 NUMBER(10)       DEFAULT 0       NOT NULL,
        birth                               DATE         NOT NULL,
        email                               VARCHAR2(100)        NULL ,
        memthumb                            VARCHAR2(60)         NULL ,
        mempic                              VARCHAR2(60)         NULL ,
        mempicsize                          NUMBER(10)       DEFAULT 0       NOT NULL
);

COMMENT ON TABLE member is 'ȸ��';
COMMENT ON COLUMN member.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN member.id is '���̵�';
COMMENT ON COLUMN member.pw is '��й�ȣ';
COMMENT ON COLUMN member.nick is '�г���';
COMMENT ON COLUMN member.tel is '�޴���';
COMMENT ON COLUMN member.pnt is '����Ʈ';
COMMENT ON COLUMN member.birth is '�������';
COMMENT ON COLUMN member.email is '�̸���';
COMMENT ON COLUMN member.memthumb is '�����';
COMMENT ON COLUMN member.mempic is '������';
COMMENT ON COLUMN member.mempicsize is '������ ũ��';


DESC member;

ALTER TABLE member MODIFY  tel VARCHAR2(40);
ALTER TABLE member DROP COLUMN tel;
ALTER TABLE member ADD (tel VARCHAR2(40));
ALTER TABLE member ADD  UNIQUE (tel);

ALTER TABLE member ADD  UNIQUE (email);

DROP SEQUENCE member_seq;

CREATE SEQUENCE member_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  

--------------------------------------------------------------------------------------------

 

-- ��CREATE��

INSERT INTO member(memberno, id, pw, nick, tel, birth, email, 
                            memthumb, mempic, mempicsize )
VALUES (member_seq.nextval, 'member1', '1234', 'zooey', '01000000001', '1980-01-17', 'member1@goodmail.com',
             null, null, 0);


INSERT INTO member(memberno, id, pw, nick, tel, birth, email, 
                            memthumb, mempic, mempicsize )
VALUES (member_seq.nextval, 'member2', '1234', 'Quentin', '01000000002', '1995-02-03', 'member2@goodmail.com',
             null, null, 0);


INSERT INTO member(memberno, id, pw, nick, tel, birth, email, 
                            memthumb, mempic, mempicsize )
VALUES (member_seq.nextval, 'member3', '1234', 'Jake', '01000000003', '1994-04-24', 'member3@goodmail.com',
             null, null, 0);

COMMIT;

-- ��LIST��

SELECT memberno, id, pw, nick, tel, birth, email, memthumb, mempic, mempicsize
FROM member
ORDER BY memberno;


-- ��READ��

SELECT memberno, id, pw, nick, tel, birth, email, memthumb, mempic, mempicsize
FROM member
WHERE memberno = 1;


-- ��UPDATE��

UPDATE member
SET id = 'Maya Hawke', pw='1234', nick='Maya', tel='01000000004', email='member1@wholemail.com', 
        mempic=null, memthumb=null, mempicsize=0
WHERE memberno = 1;

UPDATE member
SET pnt = 500
WHERE memberno = 1;


-- ��DELETE��

DELETE 
FROM member
WHERE memberno=1;  


-- id �ߺ� Ȯ��

SELECT COUNT(id) as cnt
FROM member
WHERE id='user1';

-- �α���

SELECT COUNT(memberno) as cnt
FROM member
WHERE id='user1' AND pw='1234';



-- id�� �̿��� ȸ�� ���� ��ȸ

SELECT memberno, id, pw, nick, tel, birth, email, memthumb, mempic, mempicsize
FROM member
WHERE id = 'member2';
 

-- nick �ߺ� Ȯ��
SELECT COUNT(nick) as cnt
FROM member
WHERE UPPER(nick)=UPPER('Quentin');


-- tel �ߺ� Ȯ��
SELECT COUNT(tel) as cnt
FROM member
WHERE tel='01045114757';


-- email �ߺ� Ȯ��
SELECT COUNT(email) as cnt
FROM member
WHERE email='member1@goodmail.com';


















