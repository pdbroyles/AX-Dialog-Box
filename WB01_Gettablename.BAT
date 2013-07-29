COM***************************
COM Poter broyles
COM www.caattsolutions.com
COM 7/15/13
COM****************

SET sAFETY OFF
CLOSE
CLOSE SEC


DIALOG (DIALOG TITLE "(WB01) Get tablename" WIDTH 453 HEIGHT 231 ) (BUTTONSET TITLE "&OK;&Cancel" AT 360 168 DEFAULT 1 ) (TEXT TITLE "Select Table" AT 12 40 ) (EDIT TO "v_table_name" AT 108 36 WIDTH 313 )

OPEN EXTRACT_table


COM***************
COM While I could have gone straight to the EXPORT command
COM I chose to go to a table first.
COM***************

EXTRACT FIELdS SUB("v_table_name",1,30) as "f_name" SUB("%v_table_name%",1,200) as "f_value" TO TEMP900

OPEN TEMP900

EXPORT FIELDS f_name f_value DELIMIT TO "{Replace with path to data folder}\variable_names.txt" KEEPTITLE SEPARATOR "|" QUALIFIER NONE


DELETE SCRIPT WB01_Gettablename OK
DEL TEMP900.fil OK
DEL FORMAT TEMP900 OK

COM***************************
COM END OF WB01
COM****************

QUIT
