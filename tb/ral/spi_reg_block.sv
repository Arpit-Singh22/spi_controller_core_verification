class spi_reg_block extends uvm_reg_block;
    `uvm_object_utils(spi_reg_block)

    //Declare instance of your registers
    rand DATA_0  reg_data_0;
    rand DATA_1  reg_data_1;
    rand DATA_2  reg_data_2;
    rand DATA_3  reg_data_3;
    rand CTRL    reg_ctrl;
    rand DIVIDER reg_divider;
    rand SS      reg_ss;

    //Declare the UVM register map
    uvm_reg_map default_map;

    function new (string name="spi_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    virtual function void build();
        // 1. Create and configure individual register instances
        reg_data_0 = DATA_0::type_id::create("reg_data_0");
        reg_data_0.configure(this, null, "");
        reg_data_0.build();

        reg_data_1 = DATA_1::type_id::create("reg_data_1");
        reg_data_1.configure(this, null, "");
        reg_data_1.build();
        
        reg_data_2 = DATA_2::type_id::create("reg_data_2");
        reg_data_2.configure(this, null, "");
        reg_data_2.build();
        
        reg_data_3 = DATA_3::type_id::create("reg_data_3");
        reg_data_3.configure(this, null, "");
        reg_data_3.build();

        reg_ctrl = CTRL::type_id::create("reg_ctrl");
        reg_ctrl.configure(this, null, "");
        reg_ctrl.build();

        reg_ctrl = DIVIDER::type_id::create("divider");
        reg_ctrl.configure(this, null, "");
        reg_ctrl.build();
        
        reg_ctrl = SS::type_id::create("ss");
        reg_ctrl.configure(this, null, "");
        reg_ctrl.build();

        //2. Create the Register Map
        // Arguments: (name, base_address, n_bytes, endianess, byte_addressing)

        default_map = create_map("default_map", 'h0, 4, UVM_LITTLE_ENDIAN, 1);

        //3. Map individual registers into the bus layout grid with official byte offset
        default_map.add_reg(reg_data_0,  32'h00, "RW");  //Shared Rx0/Tx0 address
        default_map.add_reg(reg_data_1,  32'h04, "RW");  //Shared Rx1/Tx1 address
        default_map.add_reg(reg_data_2,  32'h08, "RW");  //Shared Rx2/Tx2 address
        default_map.add_reg(reg_data_3,  32'h0c, "RW");  //Shared Rx3/Tx3 address
        default_map.add_reg(reg_ctrl,    32'h10, "RW");  //CTRL address
        default_map.add_reg(reg_divider, 32'h14, "RW");  //divider address
        default_map.add_reg(reg_ss,      32'h18, "RW");  //SS address

        lock_model();
    endfunction
endclass: spi_reg_block
