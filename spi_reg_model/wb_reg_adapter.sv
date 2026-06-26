class wb_reg_adapter extends uvm_reg_adapter;
    `uvm_object_utils(wb_reg_adapter)

    function new(string name= "wb_reg_adapter");
        super.new(name);
        support_byte_enable = 0;    //this core requires rigid 32-bit width tx
        provide_responses = 0;      //driver returns read data on the original item
    endfunction

    //Converts a RAL operation (read/write) into a Wishbone bus cycle
    virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
        wb_seq_item wb_item = wb_seq_item::type_id::create("wb_item");

        wb_item.we  = (rw.kind == UVM_WRITE) ? 1'b1 : 1'b0;
        wb_item.adr = rw.addr[4:0];     //Slice address down to 5 bit input bus

        if (rw.kind == UVM_WRITE) begin
            wb.item.dat_i = rw.data;
        end
        return wb_item;
    endfunction

    //Converts a completed Wishbone bus sequence item back into RAL data
    virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
        if (!$cast(wb_item, bus_item)) begin
            `uvm_fatal("BUS2REG_CAST_FAIL", "Cast failed! Provided item is not a wb+seq_item")
        end

        rw.kind     = (wb_item == 1'b1) ? UVM_WRITE : UVM_READ;
        rw.addr     = wb_item.adr;
        rw.data     = (wb_item.we == 1'b1) ? wb_item.dat_i : wb_item.dat_o;
        rw.status   = UVM_IS_OK;
    endfunction
endclass: wb_reg_adapter
