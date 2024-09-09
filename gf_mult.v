module gf_mult(
    input [7:0] a, // First operand
    input [7:0] b, // Second operand
    output wire[7:0] result // Result of the multiplication
);
    reg [15:0] p;
    integer i;
    
    always @(*) begin
        p = 0;
        for (i = 0; i < 8; i = i + 1) begin
            if (b[i])
                p = p ^ (a << i);
        end
        
        for (i = 14; i >= 8; i = i - 1) begin
            if (p[i])
                p = p ^ (16'h11B << (i - 8));
        end
    end
            assign result = p[7:0];
endmodule

