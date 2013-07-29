COM***************************
COM Poter broyles
COM www.caattsolutions.com
COM 7/15/13
COM****************

SEt SAFETY OFF
CLOSE
CLOSE SEC


IMPORT DELIMITED TO variable_names "variable_names.FIL" FROM "{replace with value of path to data}\variable_names.txt" 0 SEPARATOR "|" QUALIFIER NONE CONSECUTIVE STARTLINE 1  FIELD "field_1" C AT 1 DEC 0 WID 255 PIC "" AS "" 

OPEN variable_names


v_list = field_1

DIALOG (DIALOG TITLE "(WB02) select Fields" WIDTH 561 HEIGHT 371 ) (BUTTONSET TITLE "&OK;&Cancel" AT 468 300 DEFAULT 1 ) (DROPDOWN TITLE "%v_list%" TO "v_field_select" AT 204 60 WIDTH 254 HEIGHT 296 ) (TEXT TITLE "Select Field" AT 60 64 )

OPEN EXTRACT_table


COM***************
COM While I could have gone straight to the EXPORT command
COM I chose to go to a table first.
COM***************

EXTRACT FIELdS SUB("v_name_field",1,30) as "f_name" SUB("%v_field_select%",1,200) as "f_value" TO TEMP900

OPEN TEMP900

EXPORT FIELDS f_name f_value DELIMIT TO "{replace with value of path to data}\variable_names.txt" KEEPTITLE SEPARATOR "|" QUALIFIER NONE


DELETE SCRIPT WB01_Gettablename OK
DEL TEMP900.fil OK
DEL FORMAT TEMP900 OK
DEL variable_names.fil OK
DEL FORMAT variable_names OK

COM***************************
COM WB02
COM****************

QUIT
