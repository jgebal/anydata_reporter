create or replace package any_data_const as

   max_return_data_length constant integer := 2000;
   new_line               constant varchar2(2) := CHR( 10 );
   nulls_are_equal        constant boolean := true;

end;
/
