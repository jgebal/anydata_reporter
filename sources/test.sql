drop type a_num_tab_tab force;
drop type a_num_tab force;
drop type a_tab force;
drop type a_var force;
drop type test_object_2 force;
drop type test_number_object force;
drop type test_object force;
create type test_number_object as object(
   a_number number(38),
   b_number number(38)
);
create type test_object as object (
   val test_number_object
);
create type test_object_2 as object(
   a_value test_object
);
create type a_num_tab as table of number;
create type a_num_tab_tab as table of a_num_tab;

declare
   x any_data;
begin
   x := any_data_builder.BUILD(anydata.convertNumber(1));
   x := any_data_builder.build(anydata.convertObject( test_object_2( test_object( test_number_object(1,2) ) ) ) );
   x := any_data_builder.build( anydata.convertObject( test_number_object(1,2)  ) );
   x := any_data_builder.build( anydata.convertCollection( a_num_tab_tab(a_num_tab(1,2),a_num_tab(1,2),a_num_tab(1,2),a_num_tab(1,2))  ) );
   x := any_data_builder.build(
      anydata.convertCollection(
         a_tab(
            test_object_2( test_object( test_number_object( 1, 2 ) ) ),
            test_object_2( test_object( test_number_object( 1, 2 ) ) ),
            test_object_2( test_object( test_number_object( 1, 2 ) ) )
         )
      )
   );
   dbms_output.put_line(x.to_string());
end;
/

declare
   x test_number_object;
   y test_object;
   z test_object_2;
   a anydata;
   d any_data;
   v_loops integer := 1000;
   v_string varchar2(32767);
begin
   dbms_profiler.START_PROFILER('any_data_bulder.build(nested_object_with_two_number_fields)'||v_loops||' times');
   x := test_number_object(1,2);
   y := test_object(x);
   z := test_object_2(y);
   a := anydata.convertObject(z);
   for i in 1 .. v_loops loop
      d := any_data_builder.build(a);
   end loop;
   dbms_profiler.stop_PROFILER();
   dbms_profiler.START_PROFILER('any_data.to_string(nested_object_with_two_number_fields)'||v_loops||' times');
   v_string := d.to_string();
   dbms_profiler.stop_PROFILER();
   dbms_output.put_line( v_string );
end;
/

declare
   x sys_refcursor;
   y sys_refcursor;
   a any_data;
   b any_data;
   v_result boolean;
   v_string varchar2(32767);
begin
   open x for select * from dba_tables where rownum <=300;
   dbms_profiler.START_PROFILER('any_data_bulder.build( select 98 rows / 14 cols = 1372 fields )');
   a := any_data_builder.build(x);
   dbms_profiler.stop_PROFILER();

   open y for select * from dba_tables where rownum <= 300;
   dbms_profiler.START_PROFILER('any_data_bulder.build( select 98 rows / 14 cols = 1372 fields )');
   b := any_data_builder.build(y);
   dbms_profiler.stop_PROFILER();

   dbms_profiler.START_PROFILER('any_data.eq( select 98 rows / 14 cols = 1372 fields )');
   v_result := b.eq(a);
   dbms_profiler.stop_PROFILER();

--   dbms_profiler.START_PROFILER('any_data.to_string(select 98 rows / 14 cols = 1372 fields)'||' times');
--   v_string := b.to_string();
--   dbms_profiler.stop_PROFILER();
--   dbms_output.put_line( v_string );
end;
/

select plsql_profiler_runs.runid,
               plsql_profiler_runs.run_comment,
               plsql_profiler_runs.run_total_time/1000000 as total_time_mili_sec,
               sum(plsql_profiler_data.total_occur) over (partition by plsql_profiler_units.runid) as total_line_executions,
               plsql_profiler_data.total_occur as line_executions,
               sum(plsql_profiler_data.total_time/1000000) over (partition by plsql_profiler_units.runid) as total_line_msec,
               plsql_profiler_data.total_time/1000000 as line_time_mili_sec,
               round((plsql_profiler_data.total_time/plsql_profiler_runs.run_total_time)*100,2) as pct_of_total_run_time,
               plsql_profiler_units.unit_name,
               plsql_profiler_data.line#,
               dba_source.text
from tdd.plsql_profiler_runs
   join tdd.plsql_profiler_units
      on plsql_profiler_runs.runid = plsql_profiler_units.runid
   join tdd.plsql_profiler_data
      on plsql_profiler_units.runid = plsql_profiler_data.runid
         and plsql_profiler_units.unit_number = plsql_profiler_data.unit_number
   left join dba_source
      on dba_source.type like '%BODY' and
         dba_source.owner = plsql_profiler_units.unit_owner and
         dba_source.line = plsql_profiler_data.line# and
         dba_source.name = plsql_profiler_units.unit_name
            where round((plsql_profiler_data.total_time/plsql_profiler_runs.run_total_time)*100,2) > 0.01
--and plsql_profiler_units.unit_name = 'COLLECTION_OUTER_JOIN'
order by runid desc, plsql_profiler_data.total_time desc
;


declare
   x sys_refcursor;
   a any_data_result_set;
   b any_data_result_row;
begin
   open x for select * from dba_tables where rownum <= 10;
   a := treat( any_data_builder.build(x) as any_data_result_set);
   dbms_output.put_line('a.get_type_hash='||a.get_type_hash);
   dbms_output.put_line('a.get_value_hash='||a.get_value_hash);
   dbms_output.put_line('a.get_name_hash='||a.get_name_hash);

   dbms_output.put_line('a.data_values(1).get_type_hash='||a.data_values(1).get_type_hash);
   dbms_output.put_line('a.data_values(1).get_value_hash='||a.data_values(1).get_value_hash);
   dbms_output.put_line('a.data_values(1).get_name_hash='||a.data_values(1).get_name_hash);

   b := treat( a.data_values(1) as any_data_result_row);

   dbms_output.put_line('a.data_values(1).data_values(1).get_type_hash='||b.data_values(1).get_type_hash);
   dbms_output.put_line('a.data_values(1).data_values(1).get_value_hash='||b.data_values(1).get_value_hash);
   dbms_output.put_line('a.data_values(1).data_values(1).get_name_hash='||b.data_values(1).get_name_hash);
end;
/


select dbms_crypto.hash( cast( 'aaa' as raw ) , /*dbms_crypto.HASH_MD5*/2 ) from dual;
