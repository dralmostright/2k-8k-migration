SQL> set lines 555
SQL> BEGIN
  2    -- Select all tablespaces with blocksize 2k expect system and sysaux
  3    FOR schemauser IN (select username from dba_users where username in ('HR'))
  4      LOOP
  5        for usertable in (select table_name from dba_tables where owner=''||schemauser.username||'' and table_name not like''||'%8K'||'')
  6          LOOP
  7            dbms_output.put_line('');
  8            dbms_output.put_line('execute sys.DBMS_REDEFINITION.START_REDEF_TABLE('''||schemauser.username||''', '''||usertable.table_name||''', '''||usertable.table_name||'8k'||''');');
  9            dbms_output.put_line('declare');
 10            dbms_output.put_line('num_errors pls_integer;');
 11  	  dbms_output.put_line('begin');
 12  	  dbMS_output.put_liNe('execute sys.DBMS_REDEFINITION.copy_table_dependents('''||schemauser.username||''', '''||usertable.table_name||''', '''||usertable.table_name||'8k'',dbms_redefinition.cons_orig_params,num_errors=>num_errors);');
 13            dbms_output.put_line('dbms_output.put_line(num_errors);');
 14  	  dbms_output.put_line('end;');
 15  	  dbms_output.put_line('/');
 16  	  dbms_output.put_line('execute sys.DBMS_REDEFINITION.sync_interim_table('''||schemauser.username||''', '''||usertable.table_name||''', '''||usertable.table_name||'8k'||''');');
 17            dbms_output.put_line('execute sys.DBMS_REDEFINITION.finish_redef_table('''||schemauser.username||''', '''||usertable.table_name||''', '''||usertable.table_name||'8k'||''');');
 18            dbms_output.put_line('drop table'||schemauser.username||'.'||usertable.table_name||'8k;');
 19          END LOOP;
 20       END LOOP;
 21  END;
 22  /
execute sys.DBMS_REDEFINITION.START_REDEF_TABLE('HR', 'TEST', 'TEST8k');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
declare                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
num_errors pls_integer;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
begin                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
execute sys.DBMS_REDEFINITION.copy_table_dependents('HR', 'TEST', 'TEST8k',dbms_redefinition.cons_orig_params,num_errors=>num_errors);                                                                                                                                                                                                                                                                                                                                                                                                                                     
dbms_output.put_line(num_errors);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
end;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
/                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
execute sys.DBMS_REDEFINITION.sync_interim_table('HR', 'TEST', 'TEST8k');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
execute sys.DBMS_REDEFINITION.finish_redef_table('HR', 'TEST', 'TEST8k');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
drop tableHR.TEST8k;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
execute sys.DBMS_REDEFINITION.START_REDEF_TABLE('HR', 'USERS', 'USERS8k');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
declare                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
num_errors pls_integer;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
begin                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
execute sys.DBMS_REDEFINITION.copy_table_dependents('HR', 'USERS', 'USERS8k',dbms_redefinition.cons_orig_params,num_errors=>num_errors);                                                                                                                                                                                                                                                                                                                                                                                                                                   
dbms_output.put_line(num_errors);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
end;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
/                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
execute sys.DBMS_REDEFINITION.sync_interim_table('HR', 'USERS', 'USERS8k');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
execute sys.DBMS_REDEFINITION.finish_redef_table('HR', 'USERS', 'USERS8k');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
drop tableHR.USERS8k;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
execute sys.DBMS_REDEFINITION.START_REDEF_TABLE('HR', 'SEGMENTS', 'SEGMENTS8k');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
declare                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
num_errors pls_integer;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
begin                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
execute sys.DBMS_REDEFINITION.copy_table_dependents('HR', 'SEGMENTS', 'SEGMENTS8k',dbms_redefinition.cons_orig_params,num_errors=>num_errors);                                                                                                                                                                                                                                                                                                                                                                                                                             
dbms_output.put_line(num_errors);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
end;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
/                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
execute sys.DBMS_REDEFINITION.sync_interim_table('HR', 'SEGMENTS', 'SEGMENTS8k');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
execute sys.DBMS_REDEFINITION.finish_redef_table('HR', 'SEGMENTS', 'SEGMENTS8k');                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
drop tableHR.SEGMENTS8k;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

PL/SQL procedure successfully completed.

SQL> spool off;
