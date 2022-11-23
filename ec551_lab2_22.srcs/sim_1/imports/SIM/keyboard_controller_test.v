`timescale 1us / 1us


module keyboard_controller_test;

	// Inputs
	reg clk;
	reg data;
    reg kclk;
	// Outputs
	wire [31:0] keycodeout;

	// Instantiate the Unit Under Test (UUT)
	PS2Receiver uut (
		.clk(kclk), 
		.kclk(clk),
		.data(data), 
		.key(keycodeout)
	);

	task KeyPress;
		input [7:0] in;
		integer i;
		begin
			data = 0; // start bit
			#20;
			clk = 0;
			#20;
			data = in[0];
			clk = 1;
			#20 clk = 0;
			#20;
			data = in[1];
			clk = 1;
			#20 clk = 0;
			#20;
			data = in[2];
			clk = 1;
			#20 clk = 0;
			#20;
			data = in[3];
			clk = 1;
			#20 clk = 0;
			#20;
			data = in[4];
			clk = 1;
			#20 clk = 0;
			#20;
			data = in[5];
			clk = 1;
			#20 clk = 0;
			#20;
			data = in[6];
			clk = 1;
			#20 clk = 0;
			#20;
			data = in[7];
			clk = 1;
			#20 clk = 0;
			#20;
			data = !((in[0] + in[1] + in[2] + in[3] + in[4] + in[5] + in[6] + in[7]) % 2); // odd parity bit
			clk = 1;
			#20 clk = 0;
			#20;
			data = 1; // stop bit
			clk = 1;
			#20 clk = 0;
			#20;
			data = 1; // return to idle
			clk = 1;
		end
	endtask

	initial begin
		// Initialize Inputs
		clk = 1;
		data = 1;

		// Wait 10 us for global reset to finish
		#10;
        
		// Add stimulus here
		// 'a'
		KeyPress(8'h1c);  // 'a'
		KeyPress(8'hf0);  // end byte
		
		// 'z'
		KeyPress(8'h1a);  // 'z'
		KeyPress(8'hf0);  // end byte
		
		// 'A'
		KeyPress(8'h12);  // shift
		KeyPress(8'h1c);  // 'a'
		KeyPress(8'hf0);  // end byte
		KeyPress(8'h12);  // shift
		KeyPress(8'hf0);  // end byte
	end
      
endmodule
