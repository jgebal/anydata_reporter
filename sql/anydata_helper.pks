create or replace package anydata_helper as

   value_var constant varchar2(30) := 'v_data';
   max_return_data_length constant integer := 100;
   new_line constant varchar2(2) := CHR( 10 );
   indent_amount constant pls_integer := 3;
   indent_string constant varchar2(30) := lpad( ' ', indent_amount );

   function indent_lines( p_string varchar2 ) return varchar2;

end;
/
