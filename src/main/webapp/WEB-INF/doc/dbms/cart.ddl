/**********************************/
/* Table Name: ��ٱ��� */
/**********************************/

DROP TABLE cart CASCADE CONSTRAINTS;

CREATE TABLE cart(
        cartno                              NUMBER(10)       NOT NULL        PRIMARY KEY,
        memberno                            NUMBER(10)      NOT NULL ,
        filmno                              NUMBER(10)       NOT NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE cart is '��ٱ���';
COMMENT ON COLUMN cart.cartno is '��ٱ��� ��ȣ';
COMMENT ON COLUMN cart.memberno is 'ȸ�� ��ȣ';
COMMENT ON COLUMN cart.filmno is '��ȭ ��ȣ';


DESC cart;


DROP SEQUENCE cart_seq;

CREATE SEQUENCE cart_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999999 --> NUMBER(10) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;                     -- �ٽ� 1���� �����Ǵ� ���� ����
  

--------------------------------------------------------------------------------------------



-- ��CREATE��

INSERT INTO cart(cartno, memberno, filmno)
VALUES (cart_seq.nextval, 1, 6);

INSERT INTO cart(cartno, memberno, filmno)
VALUES (cart_seq.nextval, 1, 2);

INSERT INTO cart(cartno, memberno, filmno)
VALUES (cart_seq.nextval, 1, 3);

COMMIT;

-- ��LIST��


SELECT cartno, memberno, filmno
FROM cart
WHERE memberno = 1
ORDER BY cartno DESC;



-- ��UPDATE��

UPDATE cart
SET memberno = 2, filmno=3
WHERE cartno = 1;


-- ��DELETE��

DELETE 
FROM cart
WHERE cartno=1;  































