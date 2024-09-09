module kaly_mc(y);
//input [127:0]x;
output wire [127:0]y;
wire [7:0]a[0:7][0:7];
wire [7:0]temp[0:7][0:1];
wire [7:0]ytemp[0:7][0:1];
wire [7:0]c[0:7][0:1];
wire [7:0]sum;
genvar i,j,k;

wire [127:0]x;
assign x = 128'h75bb9a4d1790511f713adfb36bcb452a;
assign sum = 8'd0;

assign a[0][0]=8'h01;
assign a[0][1]=8'h01;
assign a[0][2]=8'h05;
assign a[0][3]=8'h01;
assign a[0][4]=8'h08;
assign a[0][5]=8'h06;
assign a[0][6]=8'h07;
assign a[0][7]=8'h04;

assign a[1][0]=8'h04;
assign a[1][1]=8'h01;
assign a[1][2]=8'h01;
assign a[1][3]=8'h05;
assign a[1][4]=8'h01;
assign a[1][5]=8'h08;
assign a[1][6]=8'h06;
assign a[1][7]=8'h07;

assign a[2][0]=8'h07;
assign a[2][1]=8'h04;
assign a[2][2]=8'h01;
assign a[2][3]=8'h01;
assign a[2][4]=8'h05;
assign a[2][5]=8'h01;
assign a[2][6]=8'h08;
assign a[2][7]=8'h06;

assign a[3][0]=8'h06;
assign a[3][1]=8'h07;
assign a[3][2]=8'h04;
assign a[3][3]=8'h01;
assign a[3][4]=8'h01;
assign a[3][5]=8'h05;
assign a[3][6]=8'h01;
assign a[3][7]=8'h08;

assign a[4][0]=8'h08;
assign a[4][1]=8'h06;
assign a[4][2]=8'h07;
assign a[4][3]=8'h04;
assign a[4][4]=8'h01;
assign a[4][5]=8'h01;
assign a[4][6]=8'h05;
assign a[4][7]=8'h01;

assign a[5][0]=8'h01;
assign a[5][1]=8'h08;
assign a[5][2]=8'h06;
assign a[5][3]=8'h07;
assign a[5][4]=8'h04;
assign a[5][5]=8'h01;
assign a[5][6]=8'h01;
assign a[5][7]=8'h05;

assign a[6][0]=8'h05;
assign a[6][1]=8'h01;
assign a[6][2]=8'h08;
assign a[6][3]=8'h06;
assign a[6][4]=8'h07;
assign a[6][5]=8'h04;
assign a[6][6]=8'h01;
assign a[6][7]=8'h01;

assign a[7][0]=8'h01;
assign a[7][1]=8'h05;
assign a[7][2]=8'h01;
assign a[7][3]=8'h08;
assign a[7][4]=8'h06;
assign a[7][5]=8'h07;
assign a[7][6]=8'h04;
assign a[7][7]=8'h01;

//splitting input to matrix

    assign c[0][0]=x[127:120];
    assign c[0][1]=x[119:112];
    assign c[1][0]=x[111:104];
    assign c[1][1]=x[103:96];
    assign c[2][0]=x[95:88];
    assign c[2][1]=x[87:80];
    assign c[3][0]=x[79:72];
    assign c[3][1]=x[71:64];
    assign c[4][0]=x[63:56];
    assign c[4][1]=x[55:48];
    assign c[5][0]=x[47:40];
    assign c[5][1]=x[39:32];
    assign c[6][0]=x[31:24];
    assign c[6][1]=x[23:16];
    assign c[7][0]=x[15:8];
    assign c[7][1]=x[7:0];
     

//matrix multiplication
generate 
for(i=0;i < 8;i=i+1)
begin
   for(j=0;j < 2;j=j+1)
   begin
      for(k=0;k < 8;k=k+1)
      begin
          gf_mult g0(.a(a[i][k]),.b(c[k][j]),.result(temp[i][j][k]));
          assign  sum = sum ^ temp[i][j];
      end
      assign ytemp[i][j] = sum;
    end
 end
 endgenerate


 assign y={ytemp[0][0],ytemp[0][1],ytemp[1][0],ytemp[1][1],ytemp[2][0],ytemp[2][1],ytemp[3][0],ytemp[3][1],
            ytemp[4][0],ytemp[4][1],ytemp[5][0],ytemp[5][1],ytemp[6][0],ytemp[6][1],ytemp[7][0],ytemp[7][1]};
            
            
endmodule