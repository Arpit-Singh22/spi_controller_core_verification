##################  Plan  #########################
# Unique reg List:  ['UART_Buffer_Register', 'UART_Holding_Register', 'UART_Interrupt_Enable_Register', 'UART_Interrupt_Identification_Register', 'UART_FIFO_Control_Register']
# 
# 
# Dictonary:  {'UART_Buffer_Register': [], 'UART_Holding_Register': [], 'UART_Interrupt_Enable_Register': [], 'UART_Interrupt_Identification_Register': [], 'UART_FIFO_Control_Register': []}
# 
# Dictonary:  {'UART_Buffer_Register': ["DATA"],
#         'UART_Holding_Register': ["DATA"],
#         'UART_Interrupt_Enable_Register': ["FA","FB","FC","FD"], 
#         'UART_Interrupt_Identification_Register': ["FA","FB","FC"], 
#         'UART_FIFO_Control_Register': ["FA","FB","FC","FD","FE"]}
# 
# Dictonary:  {'UART_Buffer_Register': ["DATA":{
#             'reg_field':"FIELD_A"             
#             'parent':"this"                
#             'size':"16"                  
#             'lsb_pos':'0'               
#             'access':"RW"                
#             'volatile':'0'              
#             'reset':'32h0'                 
#             'has_reset':'0'             
#             'is_rand':'1'               
#             'individually_accessible':'1'
#     }
#     ],
#         'UART_Holding_Register': ["DATA"],
#         'UART_Interrupt_Enable_Register': ["FA","FB","FC","FD"],
#         'UART_Interrupt_Identification_Register': ["FA","FB","FC"],
#         'UART_FIFO_Control_Register': ["FA","FB","FC","FD","FE"]}
# ###############################################################



import re

csv_fh = open("ral_input.csv","r")

ral_out_h = open("Uart_reg_model.sv","w")


unique_register = [] # holding unique registers

register_fields = {} # it holds all register fields as values and reg's as keys


for row, fc in enumerate(csv_fh):
    if row != 0:
        value = re.match("(.*),(.*),(.*),(.*),(.*),(.*),(.*),(.*),(.*),(.*),(.*)",fc)
        if value:
            register                = value.group(1)
            reg_field               = value.group(2)  
            parent                  = value.group(3)
            size                    = value.group(4)
            lsb_pos                 = value.group(5) 
            access                  = value.group(6)
            volatile                = value.group(7)
            reset                   = value.group(8)
            has_reset               = value.group(9)
            is_rand                 = value.group(10)
            individually_accessible = value.group(11) 

            # if register is not in unique_register, add it and initialize with empty list fields
            if register not in unique_register:
                unique_register.append(register)
                register_fields[register] = []
                print("Unique reg List: ",unique_register)

 
            # Append current field details to respective field list
            register_fields[register].append({
                'reg_field':reg_field,               
                'parent':parent,                  
                'size':size,                    
                'lsb_pos':lsb_pos,                 
                'access':access,                  
                'volatile':volatile,                
                'reset':reset,                   
                'has_reset':has_reset,               
                'is_rand':is_rand,                 
                'individually_accessible':individually_accessible 
            })

print("Dictonary: ",register_fields)


# iterate through uniqur reg's and register fields -> write to RAL model .📄.sv 📄
for register in unique_register:
    ral_out_h.write(f"\n// {register}\n")
    ral_out_h.write(f"class {register} extends uvm_reg;\n")
    ral_out_h.write(f"  `uvm_object_utils({register})\n\n")
    n_bits = 0
    for field in register_fields[register]:
        reg_field  =  field['reg_field']
        parent     =  field['parent']
        size       =  field['size']
        lsb_pos    =  field['lsb_pos']
        access     =  field['access']
        volatile   =  field['volatile']
        reset      =  field['reset']
        has_reset  =  field['has_reset']
        is_rand    =  field['is_rand']
        individually_accessible = field['individually_accessible']
        ral_out_h.write(f"  rand uvm_reg_field {reg_field};\n")
        n_bits = n_bits + int(size)

    ral_out_h.write(f"  function new(string name = \"{register}\");\n")
    ral_out_h.write(f"      super.new(name,{n_bits},UVM_CVR_ALL);\n")
    ral_out_h.write(f"  endfunction \n\n")

    ral_out_h.write(f"\n// build function\n")
    ral_out_h.write(f"  virtual function void build();\n")
    for field in register_fields[register]:
        reg_field  =  field['reg_field']
        parent     =  field['parent']
        size       =  field['size']
        lsb_pos    =  field['lsb_pos']
        access     =  field['access']
        volatile   =  field['volatile']
        reset      =  field['reset']
        has_reset  =  field['has_reset']
        is_rand    =  field['is_rand']
        individually_accessible = field['individually_accessible']

        ral_out_h.write(f"      {reg_field} = uvm_reg_field::type_id::create(\"{reg_field}\");\n")
        ral_out_h.write(f"      {reg_field}.configure(\n")
        ral_out_h.write(f"          .parent({parent}),\n")
        ral_out_h.write(f"          .size({size}),\n")
        ral_out_h.write(f"          .lsb_pos({lsb_pos}),\n")
        ral_out_h.write(f"          .access(\"{access}\"),\n")
        ral_out_h.write(f"          .volatile({volatile}),\n")
        ral_out_h.write(f"          .reset({reset}),\n")
        ral_out_h.write(f"          .has_reset({has_reset}),\n")
        ral_out_h.write(f"          .is_rand({is_rand}),\n")
        ral_out_h.write(f"          .individually_accessible({individually_accessible}),\n")
        ral_out_h.write(f"      );\n")
    ral_out_h.write(f"  endfunction\n")
    ral_out_h.write(f"endclass:{register}\n")

ral_out_h.close()
print("✅ RAL Models successfully created!")





        















