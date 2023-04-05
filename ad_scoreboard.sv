class ad_scoreboard extends uvm_scoreboard;
      `uvm_component_utils(ad_scoreboard)

    uvm_analysis_export#(ad_sequence_item) sb_ap;
    ad_sequence_item pkt_b[$];
	

function new(string name = "ad_scoreboard",uvm_component parent );
    super.new(name,parent);
endfunction 

function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sb_ap=new("ad_ap",this);
endfunction

function void write(ad_sequence_item pkt);
  //  `uvm_info(get_type_name, $sformatf("SCOREBOARD DATA RECEİVED  = %s", pkt), UVM_LOW);
    pkt_b.push_back(pkt);

endfunction 

task run_phase(uvm_phase phase);

    ad_sequence_item sb_pkt;
    wait(pkt_b.size > 0);
      if(pkt_b.size > 0) begin
        sb_pkt = pkt_b.pop_front();

    if(sb_pkt.in_a + sb_pkt.in_a == sb_pkt.out) begin
        `uvm_info(get_type_name, $sformatf("TEST PASS: in_a = %0d, in_b = %0d, out = %0d", sb_pkt.in_a, sb_pkt.in_b, sb_pkt.out),UVM_LOW);
      end
      else begin
        `uvm_error(get_name, $sformatf("TEST FAİL: in_a = %0d, in_b = %0d, out = %0d", sb_pkt.in_a, sb_pkt.in_b, sb_pkt.out));
      end
    end 
endtask 

endclass 
