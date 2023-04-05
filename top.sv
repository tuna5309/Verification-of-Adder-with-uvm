

import uvm_pkg::*;
`include "uvm_macros.svh"
`include "interface.sv"
`include "dut.sv"
`include "ad_sequence_item.sv"
`include "ad_sequence.sv"
`include "ad_sequencer.sv"
`include "ad_driver.sv"
`include "ad_monitor.sv"
`include "ad_agent.sv"
`include "ad_scoreboard.sv"
`include "ad_env.sv"
`include "ad_test.sv"

module tb_top;
    bit clk;
    bit reset;
    always #2 clk = ~clk;
    
    initial begin

    end
    intf vif(clk,reset);
    
    adder DUT(.clk(vif.clk),.reset(vif.reset),.in_a(vif.in_a),.in_b(vif.in_b),.out(vif.out));
    
    initial begin
     
      uvm_config_db#(virtual intf)::set(uvm_root::get(), "*", "vif", vif);
    end
    initial begin
      run_test("ad_test");
    end
  endmodule
