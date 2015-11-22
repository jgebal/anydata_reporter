DROP TYPE better_anydata FORCE;
/

CREATE TYPE better_anydata AS OBJECT (
  base_data ANYDATA,
MEMBER FUNCTION getBDouble return BINARY_DOUBLE,
MEMBER FUNCTION getBfile return BFILE,
MEMBER FUNCTION getBFloat return BINARY_FLOAT,
MEMBER FUNCTION getBlob return BLOB,
MEMBER FUNCTION getChar return VARCHAR2,
MEMBER FUNCTION getClob return CLOB,
MEMBER FUNCTION getDate return DATE,
MEMBER FUNCTION getIntervalYM return INTERVAL YEAR TO MONTH,
MEMBER FUNCTION getIntervalDS return INTERVAL DAY TO SECOND,
MEMBER FUNCTION getNchar return NCHAR,
MEMBER FUNCTION getNClob return NCLOB,
MEMBER FUNCTION getNumber return NUMBER,
MEMBER FUNCTION getNVarchar2 return NVARCHAR2,
MEMBER FUNCTION getRaw return RAW,
MEMBER FUNCTION getTimestamp return TIMESTAMP,
MEMBER FUNCTION getTimestampLTZ return TIMESTAMP WITH LOCAL TIME ZONE,
MEMBER FUNCTION getTimestampTZ return TIMESTAMP WITH TIME ZONE,
MEMBER FUNCTION getVarchar return VARCHAR,
MEMBER FUNCTION getVarchar2 return VARCHAR2
--MEMBER FUNCTION GetCollection RETURN ANYDATA,
--MEMBER FUNCTION GetObject RETURN ANYDATA
);
/

CREATE TYPE BODY better_anydata AS
  MEMBER FUNCTION getBDouble return BINARY_DOUBLE IS
    v_result BINARY_DOUBLE;
    BEGIN
      IF base_data.getBDouble( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetBfile RETURN BFILE IS
    v_result BFILE;
    BEGIN
      IF base_data.GetBfile( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetBFloat RETURN BINARY_FLOAT IS
    v_result BINARY_FLOAT;
    BEGIN
      IF base_data.GetBFloat( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetBlob RETURN BLOB IS
    v_result BLOB;
    BEGIN
      IF base_data.GetBlob( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetChar RETURN VARCHAR2 IS
    v_result VARCHAR2(32767);
    BEGIN
      IF base_data.GetChar( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetClob RETURN CLOB IS
    v_result CLOB;
    BEGIN
      IF base_data.GetClob( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetDate RETURN DATE IS
    v_result DATE;
    BEGIN
      IF base_data.GetDate( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetIntervalDS RETURN INTERVAL DAY TO SECOND IS
    v_result INTERVAL DAY TO SECOND;
    BEGIN
      IF base_data.GetIntervalDS( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetIntervalYM RETURN INTERVAL YEAR TO MONTH IS
    v_result INTERVAL YEAR TO MONTH;
    BEGIN
      IF base_data.GetIntervalYM( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetNchar RETURN NCHAR IS
    v_result NCHAR(32767);
    BEGIN
      IF base_data.GetNchar( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetNClob RETURN NCLOB IS
    v_result NCLOB;
    BEGIN
      IF base_data.GetNClob( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetNumber RETURN NUMBER IS
    v_result NUMBER;
    BEGIN
      IF base_data.GetNumber( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetNVarchar2 RETURN NVARCHAR2 IS
    v_result NVARCHAR2(32767);
    BEGIN
      IF base_data.GetNVarchar2( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetRaw RETURN RAW IS
    v_result RAW(32767);
    BEGIN
      IF base_data.GetRaw( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetTimestamp RETURN TIMESTAMP IS
    v_result TIMESTAMP;
    BEGIN
      IF base_data.GetTimestamp( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetTimestampTZ RETURN TIMESTAMP WITH TIME ZONE IS
    v_result TIMESTAMP WITH TIME ZONE;
    BEGIN
      IF base_data.GetTimestampTZ( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetTimestampLTZ RETURN TIMESTAMP WITH LOCAL TIME ZONE IS
    v_result TIMESTAMP WITH LOCAL TIME ZONE;
    BEGIN
      IF base_data.GetTimestampLTZ( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetVarchar RETURN VARCHAR IS
    v_result VARCHAR(32767);
    BEGIN
      IF base_data.GetVarchar( v_result ) = DBMS_TYPES.NO_DATA THEN 
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

  MEMBER FUNCTION GetVarchar2 RETURN VARCHAR2 IS
    v_result VARCHAR2(32767);
    BEGIN
      IF base_data.GetVarchar2( v_result ) = DBMS_TYPES.NO_DATA THEN
        RAISE NO_DATA_FOUND;
      END IF;
      RETURN v_result;
    END;

--   MEMBER FUNCTION GetCollection RETURN ANYDATA IS

--   MEMBER FUNCTION GetObject RETURN ANYDATA IS

END;
/

