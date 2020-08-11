/**********************************/
/* Table Name: 관리자 */
/**********************************/

DROP TABLE admin CASCADE CONSTRAINTS;

CREATE TABLE admin(
        adminno                             NUMBER(10)       NOT NULL        PRIMARY KEY,
        adminid                             VARCHAR2(60)         NOT NULL,
        adminpw                             VARCHAR2(60)         NOT NULL,
        admingrade                          NUMBER(1)        DEFAULT 1       NOT NULL
);


COMMENT ON TABLE admin is '관리자';
COMMENT ON COLUMN admin.adminno is '관리자 번호';
COMMENT ON COLUMN admin.adminid is '아이디';
COMMENT ON COLUMN admin.adminpw is '비밀번호';
COMMENT ON COLUMN admin.admingrade is '등급';

DESC admin;


--------------------------------------------------------------------------------------------



-- ♣CREATE♣

INSERT INTO admin(adminno, adminid, adminpw)
VALUES ((SELECT NVL(MAX(adminno), 0) + 1 as adminno FROM admin), 'admin1', '1234');

INSERT INTO admin(adminno, adminid, adminpw)
VALUES ((SELECT NVL(MAX(adminno), 0) + 1 as adminno FROM admin), 'admin2', '1234');

INSERT INTO admin(adminno, adminid, adminpw)
VALUES ((SELECT NVL(MAX(adminno), 0) + 1 as adminno FROM admin), 'admin3', '1234');

COMMIT;

-- ♣LIST♣

SELECT adminno, adminid, adminpw
FROM admin
ORDER BY adminno;


-- ♣READ♣

SELECT adminno, adminid, adminpw
FROM admin
WHERE adminno = 4;


-- ♣UPDATE♣

UPDATE admin
SET adminid = 'admin2', adminpw='4321'
WHERE adminno = 1;


-- ♣DELETE♣

DELETE 
FROM admin
WHERE adminno=4;  































