CREATE DATABASE ITS131L_FINALS;
USE ITS131L_FINALS;


DELIMITER ;;
CREATE PROCEDURE TOTAL_CUSTOMERS_PER_TOWN()
       BEGIN
			SELECT CUSTOMER.TOWN, COUNT(CUSTOMER.TOWN) FROM CUSTOMER;
	   END;;
       
CALL TOTAL_CUSTOMERS_PER_TOWN();
DROP PROCEDURE TOTAL_CUSTOMERS_PER_TOWN;