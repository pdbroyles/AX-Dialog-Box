COM**************
COM Poter broyles
COM www.caattsolutions.com
COM 7/15/13
COM 
COM 1) Create a file called "EXECUTE_table".
COM This table should have only 1 record, what is in that record does not matter.
COM**********************

SET SAFETY OFF


v_data_1 = "Feel Free to change this value"
v_data_2 = "This value too can be changed"
v_path_batfile = "{replace with path to bat files make sure to end with a '\'}"
v_path_data = "{replace with path to data files make sure to end with a '\'}"


OPEN EXTRACT_table
EXTRACT FIELdS SUB("v_data_2",1,30) as "f_name" SUB("%v_data_2%",1,200) as "f_value" TO TEMP900
EXTRACT FIELdS SUB("v_data_1",1,30) as "f_name" SUB("%v_data_1%",1,200) as "f_value" TO TEMP900 APPEND
EXTRACT FIELdS SUB("v_path_data",1,30) as "f_name" SUB("%v_path_data%",1,200) as "f_value" TO TEMP900 APPEND
EXTRACT FIELdS SUB("v_path_batfile",1,30) as "f_name" SUB("%v_path_batfile%",1,200) as "f_value" TO TEMP900 APPEND

OPEN TEMP900
EXPORT FIELDS f_name f_value DELIMIT TO "%v_path_data%variable_names.txt" KEEPTITLE SEPARATOR "|" QUALIFIER NONE 

EXECUTE '"%v_path_batfile%WA01_ACL_startup.bat"'

COM************
COM Returning from EXECUTE WA01_ACL_startup
COM************


IMPORT DELIMITED TO variable_names "variable_names.fil" FROM "%v_path_data%variable_names.txt" 0 SEPARATOR "|" QUALIFIER NONE CONSECUTIVE STARTLINE 1 KEEPTITLE FIELD "f_name" C AT 1 DEC 0 WID 50 PIC "" AS "" FIELD "f_value" C AT 51 DEC 0 WID 200 PIC "" AS "" 
OPEN Variable_names
COUNT
v_cnt_defvar = 1
v_cntr_defvar = COUNT1

DO BV01_Define_variables WHILE v_cnt_defvar <= v_cntr_defvar

COM************
COM END VA01
COM************

