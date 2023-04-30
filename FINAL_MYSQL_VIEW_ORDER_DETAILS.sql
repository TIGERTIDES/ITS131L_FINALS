CREATE DATABASE ITS131L_FINALS;
USE ITS131L_FINALS;

CREATE VIEW ORDER_DETAILS AS SELECT 
	   ORDERS.ORDER_ID,
       ORDERS.ORDER_STATUS,
       ORDERS.CANCEL_REASON,
       ORDERS.TRACKING_NUMBER,
       ORDERS.SHIPPING_OPTION,
       ORDERS.SHIPMENT_METHOD,
       ORDERS.EST_SHIPOUT_DATE,
       ORDERS.SHIP_TIME,
	   ORDERS.ORDER_CREATION_DATE,
       ORDERS.ORDER_PAID_TIME,
       ORDERS.BUYER_PAID_SHIPFEE,
       ORDERS.EST_SHIPPING_FEE,
       ORDERS.ORDER_COMPLETE_TIME,
       ORDERS.USERNAME_CUSTOMER,
       ORDER_ADDRESS.RECEIVER_NAME,
       ORDER_ADDRESS.PHONE_NUMBER,
       ORDER_ADDRESS.DELIVERY_ADDRESS,
       ORDER_ADDRESS.TOWN,
       ORDER_ADDRESS.DISTRICT,
       ORDER_ADDRESS.PROVINCE,
       ORDER_ADDRESS.REGION,
       ORDER_ADDRESS.COUNTRY,
       ORDER_ADDRESS.ZIP_CODE,
       ORDER_PRODUCT.PRODUCT_ID,
       ORDER_PRODUCT.QUANTITY,
       ORDER_PRODUCT.PRODUCT_SUBTOTAL,
       ORDER_PRODUCT.PROD_PRICE_PAID_BUYER,
       ORDER_PRODUCT.PRODUCT_NAME
       FROM ORDERS INNER JOIN ORDER_ADDRESS ON ORDERS.ORDER_ID = ORDER_ADDRESS.ORDER_ID INNER JOIN ORDER_PRODUCT ON ORDER_ADDRESS.ORDER_ID = ORDER_PRODUCT.ORDER_ID;
       
       
       SELECT * FROM ORDER_DETAILS;
       DROP VIEW ORDER_DETAILS;