COM***************
COM Written By Porter Broyles
COM Date 7/15/13
COM www.cattsolutions.com 
COM
COM script takes values from table and converts them to variables. 
COM***************


OPEN Variable_names
LOCATE RECORD v_cnt_defvar
v_cnt_defvar = v_cnt_defvar +1
v_var_name = f_name
v_var_value = f_value

%v_var_name% = ALL("%v_var_value%")

COM***************
COM End WA02
COM***************