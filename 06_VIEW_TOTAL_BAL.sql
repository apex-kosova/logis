  CREATE OR REPLACE FORCE VIEW VIEW_TOTAL_BAL ("CUST_ID", "NAME", "CUST_EMAIL", "CUST_PHONENUM", "CUST_MOBILENUM", "CUST_AFM", "BAL") AS 
  SELECT CU.CUST_ID,CU.CUST_SURNAME || ' ' || CU.CUST_NAME AS NAME,CU.CUST_EMAIL,CU.CUST_PHONENUM,CU.CUST_MOBILENUM,CU.CUST_AFM,round(sum(BA.BA_AMOUNT_UP - BA.BA_AMOUNT_DOWN), 2) AS BAL
  FROM CUSTOMERS CU,BALANCE BA
  WHERE CU.CUST_ID = BA.BA_CUSTID
  GROUP BY CU.CUST_ID,CU.CUST_NAME,CU.CUST_SURNAME,CU.CUST_EMAIL,CU.CUST_PHONENUM,CU.CUST_MOBILENUM,CU.CUST_AFM
  ORDER BY BAL DESC;