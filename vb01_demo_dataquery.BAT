COM**************
COM Poter broyles
COM www.caattsolutions.com
COM 7/15/13
COM**************

COM***********
COM identify the table in the project
COM***********

EXECUTE '"%v_path_batfile%WB01_ACL_startup.bat"'

COM****************
COM Returning from EXECUTE WB01_ACL_startup
COM****************

IMPORT DELIMITED TO variable_names "variable_names.fil" FROM "%v_path_data%variable_names.txt" 0 SEPARATOR "|" QUALIFIER NONE CONSECUTIVE STARTLINE 1 KEEPTITLE FIELD "f_name" C AT 1 DEC 0 WID 14 PIC "" AS "" FIELD "f_value" C AT 15 DEC 0 WID 44 PIC "" AS "" 
OPEN Variable_names
COUNT
v_cnt_defvar = 1
v_cntr_defvar = COUNT1

DO BV01_define_variables WHILE v_cnt_defvar <= v_cntr_defvar

COM***********
COM identifying the fields on the table
COM***********

OPEN %v_table_name%

EXPORT FIELDS ALL DELIMIT TO "%v_path_data%variable_names.txt" KEEPTITLE SEPARATOR ";" QUALIFIER NONE FIRST 0

EXECUTE '"%v_path_batfile%WB02_ACL_startup.bat"'

COM****************
COM Returning from EXECUTE WB01_ACL_startup
COM****************

IMPORT DELIMITED TO variable_names "variable_names.fil" FROM "%v_path_data%variable_names.txt" 0 SEPARATOR "|" QUALIFIER NONE CONSECUTIVE STARTLINE 1 KEEPTITLE FIELD "f_name" C AT 1 DEC 0 WID 14 PIC "" AS "" FIELD "f_value" C AT 15 DEC 0 WID 44 PIC "" AS "" 
OPEN Variable_names
COUNT
v_cnt_defvar = 1
v_cntr_defvar = COUNT1

DO BV01_define_variables WHILE v_cnt_defvar <= v_cntr_defvar

OPEN %v_table_name%

EXTRACT FIELDS %v_name_field% "%v_name_field%" as "Field_name" "%v_table_name%" as "table_name" "%v_path_slave2%" as "slave2" "%ACL_Ver_Major%.%ACL_Ver_Minor%" as "ACL version" TO "Proof of concept" OPEN
COM************
COM End of VB01
COM************
