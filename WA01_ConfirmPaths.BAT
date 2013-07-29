COM***************************
COM Porter broyles
COM www.caattsolutions.com
COM 7/15/13
COM****************

SET SAFETY OFF

DEL variable_names.fil OK
DEL FORMAT variable_names OK

IMPORT DELIMITED TO variable_names "variable_names.fil" FROM "{replace with path to data folder}\variable_names.txt" 0 SEPARATOR "|" QUALIFIER NONE CONSECUTIVE STARTLINE 1 KEEPTITLE FIELD "f_name" C AT 1 DEC 0 WID 14 PIC "" AS "" FIELD "f_value" C AT 15 DEC 0 WID 44 PIC "" AS "" 
OPEN variable_names
COUNT
v_cnt_defvar = 1
v_cntr_defvar = COUNT1

DO "{Replace with value for the script folder}\WA02_define_variables.bat" WHILE v_cnt_defvar <= v_cntr_defvar

DEL ScRIPT WA02_define_variables OK
DIALOG (DIALOG TITLE "(WW01) ConfirmPaths" WIDTH 620 HEIGHT 270 ) (BUTTONSET TITLE "&OK;&Cancel" AT 528 204 DEFAULT 1 ) (TEXT TITLE "Please confirm the path to Slave1" AT 24 40 WIDTH 197 ) (EDIT TO "v_path_slave1" AT 288 36 WIDTH 308 DEFAULT "%v_path_slave1%" ) (TEXT TITLE "Please confirm path to Slave 2" AT 24 76 WIDTH 186 ) (EDIT TO "v_path_slave2" AT 288 72 WIDTH 313 DEFAULT "%v_path_slave2%" ) (TEXT TITLE "Please confirm the path to the BAT FILES" AT 24 112 ) (EDIT TO "v_path_batfile" AT 288 108 WIDTH 311 DEFAULT "%v_path_batfile%" ) (TEXT TITLE "Please confirm path to Data Files " AT 24 148 ) (EDIT TO "v_path_data" AT 288 144 WIDTH 310 DEFAULT "%v_path_data%" )

DIsplAY version

OPEN EXTRACT_table

EXTRACT FIELdS SUB("v_path_slave1",1,30) as "f_name" SUB("%v_path_slave1%",1,200) as "f_value" TO TEMP900

EXTRACT FIELdS SUB("v_path_slave2",1,30) as "f_name" SUB("%v_path_slave2%",1,200) as "f_value" TO TEMP900 APPEND

EXTRACT FIELdS SUB("v_path_data",1,30) as "f_name" SUB("%v_path_data%",1,200) as "f_value" TO TEMP900 APPEND

EXTRACT FIELdS SUB("v_path_batfile",1,30) as "f_name" SUB("%v_path_batfile%",1,200) as "f_value" TO TEMP900 APPEND


EXTRACT FIELdS SUB("ACL_Ver_Major",1,30) as "f_name" SUB("%ACL_Ver_Major%",1,200) as "f_value" TO TEMP900 APPEND


EXTRACT FIELdS SUB("ACL_Ver_Minor",1,30) as "f_name" SUB("%ACL_Ver_Minor%",1,200) as "f_value" TO TEMP900 APPEND





OPEN TEMP900

EXPORT FIELDS f_name f_value DELIMIT TO "{Replace with value for the data folder}\variable_names.txt" KEEPTITLE SEPARATOR "|" QUALIFIER NONE


DELETE SCRIPT WA01_comfirmpaths OK
DEL ScRIPT WA02_define_variables OK


COM***************************
COM REturning from WA01
COM****************

QUIT
