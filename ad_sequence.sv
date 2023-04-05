class ad_sequence extends uvm_sequence#(ad_sequence_item);
    `uvm_object_utils(ad_sequence)

    ad_sequence_item pkt;


function new(string name="ad_sequence");
    super.new(name);
endfunction 


task body();
    pkt=ad_sequence_item::type_id::create("pkt");
repeat(10)
 begin 

    start_item(pkt);
    if(!(pkt.randomize()));
         begin
          `uvm_error(get_type_name(),"RANDOMiZE ERROR FOUND \n  ")
         end 
    pkt.reset=0;
    pkt.print();
    finish_item(pkt);
        end 
    endtask 
endclass 



 class ad_sequence_reset extends uvm_sequence#(ad_sequence_item);
    `uvm_object_utils(ad_sequence_reset)

    ad_sequence_item pkt;


function new(string name="ad_sequence");
    super.new(name);
endfunction 


task body();
    pkt=ad_sequence_item::type_id::create("pkt");
repeat(10)
 begin 

    start_item(pkt);
    if(!(pkt.randomize()));
         begin
          `uvm_error(get_type_name(),"RANDOMiZE ERROR FOUND \n  ")
         end 
    pkt.reset=1;
    pkt.print();
    finish_item(pkt);
    `uvm_info(get_type_name(), "sequence finish ", UVM_LOW);
    
    end 
    endtask 
endclass 
