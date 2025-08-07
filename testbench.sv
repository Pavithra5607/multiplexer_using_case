
module tb_mux4to1;

    reg [1:0] sel;
    reg [3:0] in;

    wire out_assign;
    wire out_case;
    wire out_if;

    
    mux4to1_case mux_case (
        .sel(sel),
        .in(in),
        .out(out_case)
    );

    

    initial begin
      $dumpfile("mux4to1_case.vcd");
      $dumpvars;
        $display("Time\tSel\tIn\tAssign\tCase\tIf");
        $monitor("%0t\t%02b\t%b\t%b\t%b\t%b", 
                  $time, sel, in, out_case);

        in = 4'b1010; 

        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        in = 4'b0101;  
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        $finish;
    end

endmodule