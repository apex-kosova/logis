--Grand priv ston xristi
grant execute on sys.dbms_crypto to YOUR_SCHEMA;

CREATE OR REPLACE FUNCTION SHA1(STRING_TO_ENCRIPT VARCHAR2) RETURN VARCHAR2 AS 
BEGIN 
RETURN LOWER(TO_CHAR(RAWTOHEX(SYS.DBMS_CRYPTO.HASH(UTL_RAW.CAST_TO_RAW(STRING_TO_ENCRIPT), SYS.DBMS_CRYPTO.HASH_SH1))));
END SHA1;