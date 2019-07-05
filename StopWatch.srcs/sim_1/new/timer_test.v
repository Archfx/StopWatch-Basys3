module timer_test;

	// Inputs
	
	reg clk;
    reg reset;
    reg pause;
	// Outputs
	wire [3:0] hex3;
    wire [3:0] hex2;
    wire [3:0] hex1;
    wire [3:0] hex0;

	// Instantiate the Unit Under Test (UUT)
	timer uut ( 
                .clk(clk),
                .reset(reset),
                .pause(pause),
                .hex3(hex3),
                .hex2(hex2),
                .hex1(hex1),
                .hex0(hex0)
                );

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		pause = 0;
		
		// Wait 100 ns for global reset to finish
		#5;
        reset = 1;
		#5;
		reset = 0;
		#5;
		//Value=4'b1000;
		

	end
	
      initial begin 
			clk=0;
			forever begin
				#5 clk = ~clk;
					  end 
					end
endmodule