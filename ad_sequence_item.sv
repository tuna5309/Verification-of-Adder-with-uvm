class ad_sequence_item extends uvm_sequence_item;

    rand bit [7:0] in_a;
    rand bit [7:0] in_b;
    bit [8:0] out;
    bit reset;



    `uvm_object_utils_begin(ad_sequence_item)
        `uvm_field_int(in_a,UVM_ALL_ON)
        `uvm_field_int(in_b,UVM_ALL_ON)
        `uvm_field_int(out,UVM_ALL_ON)
        `uvm_field_int(reset,UVM_ALL_ON)
    `uvm_object_utils_end

    function new (string name = "ad_sequence_item");
        super.new(name);
    endfunction 

endclass 
