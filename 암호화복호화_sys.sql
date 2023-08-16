-- 암호화복호화01_sys.sql

SELECT USER
FROM DUAL;
--==>> SYS


--■■■ 암호화 복호화 ■■■

-- '가나다' → '!@#' → '가나다'

-- 1. 오라클 암호화 기능을 사용하기 위해 『DBMS_OBFUSCATION_TOOLKIT』 패키지를 이용

-- 2. 이를 위해 『dbmsobtk.sql』 과 『prvtobtk.plb』 파일을 찾아 실행해야 한다.

-- ※ 해당 파일이 존재하는 경로
--C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin

@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\dbmsobtk.sql
--==>>
/*
Library DBMS_OBFUSCATION_LIB이(가) 컴파일되었습니다.
Library CRYPTO_TOOLKIT_LIBRARY이(가) 컴파일되었습니다.
Package DBMS_CRYPTO이(가) 컴파일되었습니다.
SYNONYM DBMS_CRYPTO이(가) 생성되었습니다.
Package DBMS_OBFUSCATION_TOOLKIT이(가) 컴파일되었습니다.
SYNONYM DBMS_OBFUSCATION_TOOLKIT이(가) 생성되었습니다.
Grant을(를) 성공했습니다.
Package DBMS_SQLHASH이(가) 컴파일되었습니다.
SYNONYM DBMS_SQLHASH이(가) 생성되었습니다.
*/

@C:\oraclexe\app\oracle\product\11.2.0\server\rdbms\admin\prvtobtk.plb
--==>>
/*
Package DBMS_CRYPTO_FFI이(가) 컴파일되었습니다.
Package Body DBMS_CRYPTO_FFI이(가) 컴파일되었습니다.
Package Body DBMS_CRYPTO이(가) 컴파일되었습니다.
Package DBMS_OBFUSCATION_TOOLKIT_FFI이(가) 컴파일되었습니다.
Package Body DBMS_OBFUSCATION_TOOLKIT_FFI이(가) 컴파일되었습니다.
Package Body DBMS_OBFUSCATION_TOOLKIT이(가) 컴파일되었습니다.
Package Body DBMS_SQLHASH이(가) 컴파일되었습니다.
*/


--○ 헤딩 패키지를 사용할 수 있도록 권한 부여
GRANT EXECUTE ON DBMS_OBFUSCATION_TOOLKIT TO YAMEOKJA;
--==>> Grant을(를) 성공했습니다.
-- GRANT 계정으로 DBMS_OBFUSCATION_TOOLKIT 패키지의
-- 프로시저를 사용할 수 있도록 권한 부여

GRANT EXECUTE ON DBMS_OBFUSCATION_TOOLKIT TO PUBLIC;
--==>> Grant을(를) 성공했습니다.
--> PUBLIC 으로 DBMS_OBFUSCATION_TOOLKIT 패키지의
--  프로시저를 사용할 수 있도록 권한 부여