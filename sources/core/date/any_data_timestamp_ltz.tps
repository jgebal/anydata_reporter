create or replace type any_data_timestamp_ltz authid current_user under any_data_family_date(
   data_value timestamp(9) with local time zone,
   overriding member function to_string_array( p_separator varchar2 := null ) return string_array,
   constructor function any_data_timestamp_ltz( self in out nocopy any_data_timestamp_ltz, p_data timestamp_ltz_unconstrained ) return self as result
);
/
