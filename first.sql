#USE schema_name
USE harris_trevon;


CREATE TABLE tbl_store(
	store_cd varchar(10) NOT NULL,
    store_name varchar(100) NULL,
	CONSTRAINT PRIMARY KEY(store_cd)
);

CREATE TABLE tbl_product(
	prod_cd varchar(10) NOT NULL, 
    prod_name varchar(100) NULL, 
    prod_color varchar(25) NULL, 
    CONSTRAINT PRIMARY KEY(prod_cd)
);


CREATE TABLE tbl_inventory(
    prod_cd varchar(10) NOT NULL, 
    store_cd varchar(10) NOT NULL, 
    qty int NULL, 
    price double(10, 2),
    CONSTRAINT PRIMARY KEY(prod_cd, store_cd),
    CONSTRAINT FOREIGN KEY(prod_cd) REFERENCES tbl_product(prod_cd),
	CONSTRAINT FOREIGN KEY(store_cd) REFERENCES tbl_store(store_cd)
    
);
