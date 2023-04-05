class ad_agent extends uvm_agent;
    `uvm_component_utils(ad_agent)
    
    ad_sequencer ad_sequ;
    ad_monitor mon;
    ad_driver drv;


    function new(string name = "ad_agent ",uvm_component parent);
        super.new(name,parent);
    endfunction 

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        ad_sequ=ad_sequencer::type_id::create("ad_seq",this);
         mon=ad_monitor::type_id::create("mon",this);
         drv=ad_driver::type_id::create("drv",this);
    endfunction 

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        drv.seq_item_port.connect(ad_sequ.seq_item_export);
    endfunction 

endclass
