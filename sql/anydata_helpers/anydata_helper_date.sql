drop type anydata_helper_date force;
/

create or replace type anydata_helper_date under anydata_helper_base (
  constructor function anydata_helper_date return self as result
);
/

create or replace type body anydata_helper_date as
   constructor function anydata_helper_date return self as result is
      begin
         self.initialize( DBMS_TYPES.TYPECODE_DATE, 'DATE', 'Date',
                          'TO_CHAR( '||anytype_helper_const.anydata_getter_place||', ''YYYY-MM-DD HH24:MI:SS'' )');
         return;
      end;
   end;
/
