CREATE DATABASE ITS131L_FINALS;


CREATE TABLE CUSTOMER(
       USERNAME_CUSTOMER VARCHAR(150) NOT NULL, 
       EMAIL_ADDRESS VARCHAR(150) NOT NULL,
       RECEIVER_NAME VARCHAR(150) NOT NULL,
       PHONE_NUMBER VARCHAR(50) NOT NULL,
       DELIVERY_ADDRESS VARCHAR(300) NOT NULL, 
       TOWN VARCHAR(60) NOT NULL, 
       DISTRICT VARCHAR(60) NOT NULL, 
       PROVINCE VARCHAR(60) NOT NULL,
       REGION VARCHAR(60) NOT NULL,
       COUNTRY VARCHAR(60) NOT NULL,
       ZIP_CODE VARCHAR(60) NOT NULL
       );
ALTER TABLE CUSTOMER ADD CONSTRAINT PK_CUSTOMER_USERNAME_CUSTOMER PRIMARY KEY CLUSTERED(USERNAME_CUSTOMER);
SELECT * FROM CUSTOMER;
DROP TABLE CUSTOMER;


CREATE TABLE PRODUCT(
       PRODUCT_ID VARCHAR(50) NOT NULL,
       PRODUCT_NAME VARCHAR(150) NOT NULL,
       ORIGINAL_PRICE INT NOT NULL,
       DEAL_PRICE INT NOT NULL,
       TOTAL_WEIGHT DECIMAL NOT NULL,
       CATEGORY VARCHAR(150) NOT NULL
       );
ALTER TABLE PRODUCT ADD CONSTRAINT PK_PRODUCT_PRODUCT_ID PRIMARY KEY CLUSTERED(PRODUCT_ID);
SELECT * FROM PRODUCT;
DROP TABLE PRODUCT;



CREATE TABLE ORDERS(
       ORDER_ID VARCHAR(150) NOT NULL,
       ORDER_STATUS VARCHAR(50) NOT NULL,
       CANCEL_REASON VARCHAR(250),
       TRACKING_NUMBER VARCHAR(150) NOT NULL,
       SHIPPING_OPTION VARCHAR(70) NOT NULL,
       SHIPMENT_METHOD VARCHAR(70) NOT NULL,
       EST_SHIPOUT_DATE DATETIME NOT NULL,
       SHIP_TIME DATETIME NOT NULL,
       ORDER_CREATION_DATE DATETIME NOT NULL,
       ORDER_PAID_TIME DATETIME NOT NULL,
       BUYER_PAID_SHIPFEE INT NOT NULL,
       EST_SHIPPING_FEE INT NOT NULL,
       ORDER_COMPLETE_TIME DATETIME NOT NULL,
       USERNAME_CUSTOMER VARCHAR(150) NOT NULL
       );

ALTER TABLE ORDERS ADD CONSTRAINT PK_ORDERS_ORDER_ID PRIMARY KEY CLUSTERED(ORDER_ID);
ALTER TABLE ORDERS ADD CONSTRAINT FK_ORDERS_CUSTOMER_USERNAME_CUSTOMER FOREIGN KEY (USERNAME_CUSTOMER) REFERENCES CUSTOMER(USERNAME_CUSTOMER);
SELECT * FROM ORDERS;
DROP TABLE ORDERS;

CREATE TABLE ORDER_PRODUCT(
        ORDER_ID VARCHAR(150) NOT NULL,
        PRODUCT_ID VARCHAR(50) NOT NULL,
        QUANTITY INT NOT NULL,
        PRODUCT_SUBTOTAL INT NOT NULL,
        PROD_PRICE_PAID_BUYER INT NOT NULL,
        PRODUCT_NAME VARCHAR(150) NOT NULL
        );

ALTER TABLE ORDER_PRODUCT ADD CONSTRAINT PK_ORDER_PRODUCT_ORDER_ID_PRODUCT_ID PRIMARY KEY CLUSTERED(ORDER_ID, PRODUCT_ID);
ALTER TABLE ORDER_PRODUCT ADD CONSTRAINT FK_ORDER_PRODUCT_ORDER_ID FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID);
ALTER TABLE ORDER_PRODUCT ADD CONSTRAINT FK_ORDER_PRODUCT_PRODUCT_ID FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID);
SELECT * FROM ORDER_PRODUCT;
DROP TABLE ORDER_PRODUCT;




CREATE TABLE ORDER_ADDRESS(
       ORDER_ID VARCHAR(150) NOT NULL,
       USERNAME_CUSTOMER VARCHAR(150) NOT NULL,
       RECEIVER_NAME VARCHAR(150) NOT NULL,
       PHONE_NUMBER VARCHAR(50) NOT NULL,
       DELIVERY_ADDRESS VARCHAR(300) NOT NULL, 
       TOWN VARCHAR(60) NOT NULL, 
       DISTRICT VARCHAR(60) NOT NULL, 
       PROVINCE VARCHAR(60) NOT NULL,
       REGION VARCHAR(60) NOT NULL,
       COUNTRY VARCHAR(60) NOT NULL,
       ZIP_CODE VARCHAR(60) NOT NULL
       );
ALTER TABLE ORDER_ADDRESS ADD CONSTRAINT PK_ORDER_ADDRESS_ORDER_ID PRIMARY KEY CLUSTERED(ORDER_ID);
ALTER TABLE ORDER_ADDRESS ADD CONSTRAINT FK_ORDER_ADDRESS_ORDER_ID FOREIGN KEY(ORDER_ID) REFERENCES ORDERS(ORDER_ID);
ALTER TABLE ORDER_ADDRESS ADD CONSTRAINT FK_ORDER_ADDRESS_USERNAME_CUSTOMER FOREIGN KEY(USERNAME_CUSTOMER) REFERENCES CUSTOMER(USERNAME_CUSTOMER);
SELECT * FROM ORDER_ADDRESS;
DROP TABLE ORDER_ADDRESS;