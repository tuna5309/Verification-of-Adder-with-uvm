class ad_test extends uvm_test;
    `uvm_component_utils(ad_test)
    
    ad_env env;
    ad_sequence  ad_seq;
    ad_sequence_reset ad_seq_reset;

    function new(string name ="ad_test",uvm_component parent);
        super.new(name,parent);
    endfunction 


    function void build_phase (uvm_phase phase);
        super.build_phase(phase);
    env=ad_env::type_id::create("env",this);
    endfunction 


    task run_phase (uvm_phase phase);
        phase.raise_objection(this);
        ad_seq=ad_sequence::type_id::create("ad_seq",this);
        ad_seq_reset=ad_sequence_reset::type_id::create("ad_sequence_reset",this);

    repeat (10)
        begin 
    #10; 
    ad_seq.start(env.agent.ad_sequ);
    end 
 
    #5 

    repeat (10)
        begin 
    ad_seq_reset.start(env.agent.ad_sequ);
        end 

    phase.drop_objection(this);

    `uvm_info(get_type_name, "TEST FİNİSH ", UVM_LOW);

    endtask
endclass 
