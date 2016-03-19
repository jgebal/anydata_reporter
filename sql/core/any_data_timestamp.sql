create or replace type any_data_timestamp authid current_user under any_data_family_date(
   data_value timestamp(9),
   overriding member function to_string_array( p_separator varchar2 := null ) return string_array,
   constructor function any_data_timestamp( self in out nocopy any_data_timestamp, p_data timestamp_unconstrained ) return self as result
);
/

create or replace type body any_data_timestamp as

   overriding member function to_string_array( p_separator varchar2 := null ) return string_array is
      begin
         return
         string_array(
            q'[to_timestamp( ']'
            || to_char( data_value, 'yyyy-mm-dd hh24:mi:ssxff9' )
            || q'[', 'yyyy-mm-dd hh24:mi:ssxff9' )]'
            || p_separator
         );
      end;

   constructor function any_data_timestamp( self in out nocopy any_data_timestamp, p_data timestamp_unconstrained ) return self as result is
      begin
         self.type_code := dbms_types.typecode_timestamp;
         self.type_name := 'TIMESTAMP';
         self.self_type_name := 'any_data_timestamp';
         self.data_value := p_data;
         return;
      end;

end;
/