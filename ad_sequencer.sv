class ad_sequencer extends uvm_sequencer#(ad_sequence_item);
    `uvm_component_utils(ad_sequencer)


function new (string name = "ad_sequencer",uvm_component parent);
    super.new(name,parent);
endfunction 

endclass 
