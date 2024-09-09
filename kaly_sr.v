module kaly_sr(x, y);
    input [127:0] x;
    output wire [127:0] y;
    reg [7:0] y1, y2, y3, y4, y5, y6, y7, y8;
    reg [7:0] y9, y10, y11, y12, y13, y14, y15, y16;
 
    always @(*) begin
    assign y1=x[127:120];
    assign y2=x[119:112];
    assign y3=x[111:104];
    assign y4=x[103:96];
    assign y5=x[95:88];
    assign y6=x[87:80];
    assign y7=x[79:72];
    assign y8=x[71:64];
    assign y9=x[63:56];
    assign y10=x[55:48];
    assign y11=x[47:40];
    assign y12=x[39:32];
    assign y13=x[31:24];
    assign y14=x[23:16];
    assign y15=x[15:8];
    assign y16=x[7:0]; 
    end
    assign y={y1,y2,y3,y4,y5,y6,y7,y9,y8,y11,y10,y13,y12,y15,y14};
endmodule
