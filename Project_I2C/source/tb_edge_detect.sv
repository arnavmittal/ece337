// Description: This is the test bench for the Slave Edge Detector.
`timescale 1ns / 10ps

module tb_edge_detect();

	// Define parameters
	parameter CLK_PERIOD	= 10;
	parameter SCL_PERIOD    = 300;

  	reg tb_clk;
	reg tb_n_rst;
	reg tb_SCL_sync;
	reg tb_rising_edge;
	reg tb_falling_edge;
	
	edge_detect DUT
	(
		.clk(tb_clk),
		.n_rst(tb_n_rst),
		.SCL_sync(tb_SCL_sync),
		.rising_edge(tb_rising_edge),
		.falling_edge(tb_falling_edge)
	);
	
	
	always
	begin : CLK_GEN
		tb_clk = 1'b0;
		#(CLK_PERIOD / 2);
		tb_clk = 1'b1;
		#(CLK_PERIOD / 2);
	end
	
	
	always
	begin : SCL_GEN
	    tb_SCL_sync = 1'b0;
	    #(SCL_PERIOD / 3);
	    tb_SCL_sync = 1'b1;
	    #(SCL_PERIOD / 3); 
	    tb_SCL_sync = 1'b0;
	    #(SCL_PERIOD / 3);
	end	
	
	
	initial
	begin 
		// Initilize all inputs
		tb_n_rst				= 1'b0; // Initially inactive
		//tb_scl	= 1'b1; // Initially idle
		
		
		// Get away from Time = 0
		#0.1; 
		tb_n_rst = 1'b1;
		//#(CLK_PERIOD*2);
	//	tb_scl = 1'b0;
		//#(CLK_PERIOD*3);
		//tb_scl = 1'b1;
		//#(CLK_PERIOD*2);
		//tb_scl = 1'b0;
		//#(CLK_PERIOD);
		//tb_scl = 1'b1;
		//#(CLK_PERIOD);
		//tb_scl = 1'b0;
		
		
		
	end 

   

endmodule
