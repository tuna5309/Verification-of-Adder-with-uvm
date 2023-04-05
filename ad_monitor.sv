class ad_monitor extends uvm_monitor;
    `uvm_component_utils(ad_monitor)

virtual intf vif;
ad_sequence_item mon_pkt;
uvm_analysis_port#(ad_sequence_item) mon_ap;

function new(string name = "ad_monitor",uvm_component parent);
    super.new(name,parent);
endfunction


function void buil_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual intf)::get(this,"","vif_a",vif))) begin
        `uvm_fatal("driver","unable to get interface")         
    mon_ap=new("ad_ap",this);
    end     
endfunction 


task run_phase(uvm_phase phase);
    mon_pkt=ad_sequence_item::type_id::create("pkt",this);

forever begin 

    @(posedge vif.clk )
vif.in_a=mon_pkt.in_a;
vif.in_b=mon_pkt.in_b;
vif.out=mon_pkt.out;
//vif.reset=mon_pkt.reset;

end 

@(posedge vif.clk )
mon_ap.write(mon_pkt);

endtask 
endclass 
