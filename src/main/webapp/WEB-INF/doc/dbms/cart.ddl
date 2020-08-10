/**********************************/
/* Table Name: 장바구니 */
/**********************************/

DROP TABLE cart CASCADE CONSTRAINTS;

CREATE TABLE cart(
        cartno                              NUMBER(10)       NOT NULL        PRIMARY KEY,
        memberno                            NUMBER(10)      NOT NULL ,
        filmno                              NUMBER(10)       NOT NULL ,
  FOREIGN KEY (memberno) REFERENCES member (memberno),
  FOREIGN KEY (filmno) REFERENCES film (filmno)
);

COMMENT ON TABLE cart is '장바구니';
COMMENT ON COLUMN cart.cartno is '장바구니 번호';
COMMENT ON COLUMN cart.memberno is '회원 번호';
COMMENT ON COLUMN cart.filmno is '영화 번호';


DESC cart;


DROP SEQUENCE cart_seq;

CREATE SEQUENCE cart_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999999 --> NUMBER(10) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
  NOCYCLE;                     -- 다시 1부터 생성되는 것을 방지
  

--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO cart(cartno, memberno, filmno)
VALUES (cart_seq.nextval, 1, 6);

INSERT INTO cart(cartno, memberno, filmno)
VALUES (cart_seq.nextval, 1, 2);

INSERT INTO cart(cartno, memberno, filmno)
VALUES (cart_seq.nextval, 1, 3);

COMMIT;

-- ♣LIST♣


SELECT cartno, memberno, filmno
FROM cart
WHERE memberno = 1
ORDER BY cartno DESC;



-- ♣UPDATE♣

UPDATE cart
SET memberno = 2, filmno=3
WHERE cartno = 1;


-- ♣DELETE♣

DELETE 
FROM cart
WHERE cartno=1;  































