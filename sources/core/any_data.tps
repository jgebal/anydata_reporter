create or replace type any_data authid current_user as object(
   type_code      number(38, 0),
   type_name      varchar2(100),
   self_type_name varchar2(100),
   type_hash      raw(16),
   value_hash     raw(16),
   name_hash      raw(16),
   static function get_version return varchar2,
   final member function to_string return varchar2,
   not instantiable member function to_string_array( p_separator varchar2 := null ) return string_array,
   not instantiable member function get_self_family_name return varchar2,
   member function get_self_type_name return varchar2,
   member function get_elements_count return integer,
   member function compare_internal( p_other any_data ) return integer,
   final member function compare( p_other any_data ) return integer,
   map member function get_hash return raw,
   member function equals( p_other any_data ) return boolean,
   final member function not_equals( p_other any_data ) return boolean,
   member function greater_than( p_other any_data ) return boolean,
   member function less_than( p_other any_data ) return boolean,
   member function greater_equal_to( p_other any_data ) return boolean,
   member function less_equal_to( p_other any_data ) return boolean,
   final member function eq( p_other any_data ) return boolean,
   final member function "= "( p_other any_data ) return boolean,
   final member function neq( p_other any_data ) return boolean,
   final member function "!="( p_other any_data ) return boolean,
   final member function "<>"( p_other any_data ) return boolean,
   final member function gt( p_other any_data ) return boolean,
   final member function "> "( p_other any_data ) return boolean,
   final member function lt( p_other any_data ) return boolean,
   final member function "< "( p_other any_data ) return boolean,
   final member function ge( p_other any_data ) return boolean,
   final member function ">="( p_other any_data ) return boolean,
   final member function le( p_other any_data ) return boolean,
   final member function "<="( p_other any_data ) return boolean,
   final member function is_null return boolean
) not final not instantiable;
/
