class ad_env extends uvm_env;
    `uvm_component_utils(ad_env)

    
    ad_agent agent;
    ad_scoreboard sb;

function new(string name="ad_env ", uvm_component parent);
    super.new(name,parent);
endfunction 


function void build_phase(uvm_phase phase);
    super.build_phase(phase);
agent=ad_agent::type_id::create("agent",this);
sb=ad_scoreboard::type_id::create("sb",this);
endfunction 

function void connect_phae (uvm_phase phase);
    super.build_phase(phase);
    agent.mon.mon_ap.connect(sb.sb_ap);

endfunction 
endclass 
