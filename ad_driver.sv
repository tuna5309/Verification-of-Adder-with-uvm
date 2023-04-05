class ad_driver extends uvm_driver#(ad_sequence_item);
    `uvm_component_utils(ad_driver)

virtual intf vif;
ad_sequence_item pkt;


function new(string name = "ad_driver",uvm_component parent);
    super.new(name,parent);
endfunction 



function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual intf)::get(this,"","vif_a",vif))) begin
        `uvm_fatal("driver","unable to get interface")      
    
    end 
endfunction 


task run_phase(uvm_phase phase);
     
    pkt=ad_sequence_item::type_id::create("pkt",this);  
    forever begin 
    seq_item_port.get_next_item(pkt);
   @(posedge vif.clk );
    `uvm_info(get_type_name, $sformatf("in_a = %0d, in_b = %0d ,reset= %0d", pkt.in_a, pkt.in_b,pkt.reset), UVM_LOW);
    vif.in_a  = pkt.in_a;
    vif.in_b  = pkt.in_b;  
    vif.out   = pkt.out;
  //  vif.reset = pkt.reset;
    end 

    @(posedge vif.clk);
    seq_item_port.item_done();
endtask 

endclass 
