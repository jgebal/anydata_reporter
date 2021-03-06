create or replace package any_data_typecode_mapper  as

   function get_dbms_types_mapping( p_type_code binary_integer ) return dbms_type_code_mappings%rowtype result_cache deterministic;
   function get_dbms_sql_mapping( p_dbms_sql_typecode binary_integer ) return dbms_type_code_mappings%rowtype result_cache deterministic;

end;
/
