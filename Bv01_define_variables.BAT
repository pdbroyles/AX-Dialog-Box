COM***************************
COM Poter broyles
COM www.caattsolutions.com
COM 7/15/13
COM****************

OPEN Variable_names
LOCATE RECORD v_cnt_defvar
v_cnt_defvar = v_cnt_defvar +1

v_var_name = f_name
v_var_value = f_value

%v_var_name% = ALL("%v_var_value%")

COM***************************
COM END BV01
COM****************
