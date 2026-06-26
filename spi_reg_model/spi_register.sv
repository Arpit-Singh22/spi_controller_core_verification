// DATA_0
class DATA_0 extends uvm_reg;
  `uvm_object_utils(DATA_0)

  rand uvm_reg_field DATA;
  function new(string name = "DATA_0");
      super.new(name,32,UVM_CVR_ALL);
  endfunction 


// build function
  virtual function void build();
      DATA = uvm_reg_field::type_id::create("DATA");
      DATA.configure(
          .parent(this),
          .size(32),
          .lsb_pos(0),
          .access("RW"),
          .volatile(1),
          .reset(32'h00000000),
          .has_reset(1),
          .is_rand(1),
          .individually_accessible(1),
      );
  endfunction
endclass:DATA_0

// DATA_1
class DATA_1 extends uvm_reg;
  `uvm_object_utils(DATA_1)

  rand uvm_reg_field DATA;
  function new(string name = "DATA_1");
      super.new(name,32,UVM_CVR_ALL);
  endfunction 


// build function
  virtual function void build();
      DATA = uvm_reg_field::type_id::create("DATA");
      DATA.configure(
          .parent(this),
          .size(32),
          .lsb_pos(0),
          .access("RW"),
          .volatile(1),
          .reset(32'h00000000),
          .has_reset(1),
          .is_rand(1),
          .individually_accessible(1),
      );
  endfunction
endclass:DATA_1

// DATA_2
class DATA_2 extends uvm_reg;
  `uvm_object_utils(DATA_2)

  rand uvm_reg_field DATA;
  function new(string name = "DATA_2");
      super.new(name,32,UVM_CVR_ALL);
  endfunction 


// build function
  virtual function void build();
      DATA = uvm_reg_field::type_id::create("DATA");
      DATA.configure(
          .parent(this),
          .size(32),
          .lsb_pos(0),
          .access("RW"),
          .volatile(1),
          .reset(32'h00000000),
          .has_reset(1),
          .is_rand(1),
          .individually_accessible(1),
      );
  endfunction
endclass:DATA_2

// DATA_3
class DATA_3 extends uvm_reg;
  `uvm_object_utils(DATA_3)

  rand uvm_reg_field DATA;
  function new(string name = "DATA_3");
      super.new(name,32,UVM_CVR_ALL);
  endfunction 


// build function
  virtual function void build();
      DATA = uvm_reg_field::type_id::create("DATA");
      DATA.configure(
          .parent(this),
          .size(32),
          .lsb_pos(0),
          .access("RW"),
          .volatile(1),
          .reset(32'h00000000),
          .has_reset(1),
          .is_rand(1),
          .individually_accessible(1),
      );
  endfunction
endclass:DATA_3

// CTRL
class CTRL extends uvm_reg;
  `uvm_object_utils(CTRL)

  rand uvm_reg_field CHAR_LEN;
  rand uvm_reg_field RESERVED_0;
  rand uvm_reg_field GO_BSY;
  rand uvm_reg_field Rx_NEG;
  rand uvm_reg_field Tx_NEG;
  rand uvm_reg_field LSB;
  rand uvm_reg_field IE;
  rand uvm_reg_field ASS;
  rand uvm_reg_field RESERVED;
  function new(string name = "CTRL");
      super.new(name,32,UVM_CVR_ALL);
  endfunction 


// build function
  virtual function void build();
      CHAR_LEN = uvm_reg_field::type_id::create("CHAR_LEN");
      CHAR_LEN.configure(
          .parent(this),
          .size(7),
          .lsb_pos(0),
          .access("RW"),
          .volatile(0),
          .reset(32'h00000000),
          .has_reset(1),
          .is_rand(1),
          .individually_accessible(1),
      );
      RESERVED_0 = uvm_reg_field::type_id::create("RESERVED_0");
      RESERVED_0.configure(
          .parent(this),
          .size(1),
          .lsb_pos(7),
          .access("RO"),
          .volatile(0),
          .reset(32'h00000000),
          .has_reset(1),
          .is_rand(0),
          .individually_accessible(0),
      );
      GO_BSY = uvm_reg_field::type_id::create("GO_BSY");
      GO_BSY.configure(
          .parent(this),
          .size(1),
          .lsb_pos(8),
          .access("RW"),
          .volatile(1),
          .reset(32'h00000000),
          .has_reset(1),
          .is_rand(0),
          .individually_accessible(1),
      );
      Rx_NEG = uvm_reg_field::type_id::create("Rx_NEG");
      Rx_NEG.configure(
          .parent(this),
          .size(1),
          .lsb_pos(9),
          .access("RW"),
          .volatile(0),
          .reset(32'h00000000),
          .has_reset(1),
          .is_rand(1),
          .individually_accessible(1),
      );
      Tx_NEG = uvm_reg_field::type_id::create("Tx_NEG");
      Tx_NEG.configure(
          .parent(this),
          .size(1),
          .lsb_pos(10),
          .access("RW"),
          .volatile(0),
          .reset(32'h00000000),
          .has_reset(1),
          .is_rand(1),
          .individually_accessible(1),
      );
      LSB = uvm_reg_field::type_id::create("LSB");
      LSB.configure(
          .parent(this),
          .size(1),
          .lsb_pos(11),
          .access("RW"),
          .volatile(0),
          .reset(32'h00000000),
          .has_reset(1),
          .is_rand(1),
          .individually_accessible(1),
      );
      IE = uvm_reg_field::type_id::create("IE");
      IE.configure(
          .parent(this),
          .size(1),
          .lsb_pos(12),
          .access("RW"),
          .volatile(0),
          .reset(32'h00000000),
          .has_reset(1),
          .is_rand(1),
          .individually_accessible(1),
      );
      ASS = uvm_reg_field::type_id::create("ASS");
      ASS.configure(
          .parent(this),
          .size(1),
          .lsb_pos(13),
          .access("RW"),
          .volatile(0),
          .reset(32'h00000000),
          .has_reset(1),
          .is_rand(1),
          .individually_accessible(1),
      );
      RESERVED = uvm_reg_field::type_id::create("RESERVED");
      RESERVED.configure(
          .parent(this),
          .size(18),
          .lsb_pos(14),
          .access("RO"),
          .volatile(0),
          .reset(32'h00000000),
          .has_reset(1),
          .is_rand(0),
          .individually_accessible(0),
      );
  endfunction
endclass:CTRL

// DIVIDER
class DIVIDER extends uvm_reg;
  `uvm_object_utils(DIVIDER)

  rand uvm_reg_field DIVIDER;
  rand uvm_reg_field RESERVED;
  function new(string name = "DIVIDER");
      super.new(name,32,UVM_CVR_ALL);
  endfunction 


// build function
  virtual function void build();
      DIVIDER = uvm_reg_field::type_id::create("DIVIDER");
      DIVIDER.configure(
          .parent(this),
          .size(16),
          .lsb_pos(0),
          .access("RW"),
          .volatile(0),
          .reset(16'hffff),
          .has_reset(1),
          .is_rand(1),
          .individually_accessible(1),
      );
      RESERVED = uvm_reg_field::type_id::create("RESERVED");
      RESERVED.configure(
          .parent(this),
          .size(16),
          .lsb_pos(16),
          .access("RO"),
          .volatile(0),
          .reset(32'h00000000),
          .has_reset(1),
          .is_rand(0),
          .individually_accessible(0),
      );
  endfunction
endclass:DIVIDER

// SS
class SS extends uvm_reg;
  `uvm_object_utils(SS)

  rand uvm_reg_field SS;
  rand uvm_reg_field RESERVED;
  function new(string name = "SS");
      super.new(name,32,UVM_CVR_ALL);
  endfunction 


// build function
  virtual function void build();
      SS = uvm_reg_field::type_id::create("SS");
      SS.configure(
          .parent(this),
          .size(8),
          .lsb_pos(0),
          .access("RW"),
          .volatile(0),
          .reset(32'h00000000),
          .has_reset(1),
          .is_rand(1),
          .individually_accessible(1),
      );
      RESERVED = uvm_reg_field::type_id::create("RESERVED");
      RESERVED.configure(
          .parent(this),
          .size(24),
          .lsb_pos(8),
          .access("RO"),
          .volatile(0),
          .reset(32'h00000000),
          .has_reset(1),
          .is_rand(0),
          .individually_accessible(0),
      );
  endfunction
endclass:SS
