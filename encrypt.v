module encrypt(clk,rst,msg,key,cipher);
    input clk,rst;
    input [127:0]msg,key;
    output  [127:0]cipher;
    
    
    wire [127:0] modulo;
    wire [127:0] temp;
    wire [127:0] plainwire;
    wire [127:0] m;
    wire [127:0] n;
    wire [127:0] o;

    wire [7:0] s1, s2, s3, s4, s5, s6, s7, s8;
    wire [7:0] s9, s10, s11, s12, s13, s14, s15, s16;

    wire [7:0] y1, y2, y3, y4, y5, y6, y7, y8;
    wire [7:0] y9, y10, y11, y12, y13, y14, y15, y16;
    
    wire [127:0] k0, k1, k2, k3, k4, k5, k6, k7, k8;
    wire [127:0] k9, k10;
    
    
 assign modulo = 128'h00000000000000010000000000000000;
 
        kalyna_interkey i0(key,k0);
        assign temp = msg+k0;
        assign temp = (temp>modulo)?(temp-modulo):temp;
         
        assign plainwire = temp;
        
        // Apply S-boxes and transformations
        kaly_sbox1 z1(plainwire[127:120], y1);
        kaly_sbox1 z5(plainwire[95:88], y5);
        kaly_sbox1 z9(plainwire[63:56], y9);
        kaly_sbox1 z13(plainwire[31:24], y13);

        kaly_sbox2 z2(plainwire[119:112], y2);
        kaly_sbox2 z6(plainwire[87:80], y6);
        kaly_sbox2 z10(plainwire[55:48], y10);
        kaly_sbox2 z14(plainwire[23:16], y14);

        kaly_sbox3 z3(plainwire[111:104], y3);
        kaly_sbox3 z7(plainwire[79:72], y7);
        kaly_sbox3 z11(plainwire[47:40], y11);
        kaly_sbox3 z15(plainwire[15:8], y15);

        kaly_sbox4 z4(plainwire[103:96], y4);
        kaly_sbox4 z8(plainwire[71:64], y8);
        kaly_sbox4 z12(plainwire[39:32], y12);
        kaly_sbox4 z16(plainwire[7:0], y16);

        assign m={y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16};

        // Apply kaly_sr and kaly_mc
        kaly_sr r1(m, n);
        kaly_mc c1(n, o); 
        
        kalyna_interkey i1(k0,k1);
        assign temp = (k0 << 56 )^ o;
        
        assign plainwire = temp;

        // Apply S-boxes and transformations again
        kaly_sbox1 q1(plainwire[127:120], y1);
        kaly_sbox1 q5(plainwire[95:88], y5);
        kaly_sbox1 q9(plainwire[63:56], y9);
        kaly_sbox1 q13(plainwire[31:24], y13);

        kaly_sbox2 q2(plainwire[119:112], y2);
        kaly_sbox2 q6(plainwire[87:80], y6);
        kaly_sbox2 q10(plainwire[55:48], y10);
        kaly_sbox2 q14(plainwire[23:16], y14);

        kaly_sbox3 q3(plainwire[111:104], y3);
        kaly_sbox3 q7(plainwire[79:72], y7);
        kaly_sbox3 q11(plainwire[47:40], y11);
        kaly_sbox3 q15(plainwire[15:8], y15);

        kaly_sbox4 q4(plainwire[103:96], y4);
        kaly_sbox4 q8(plainwire[71:64], y8);
        kaly_sbox4 q12(plainwire[39:32], y12);
        kaly_sbox4 q16(plainwire[7:0], y16);

        assign m={y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16};

        // Apply kaly_sr and kaly_mc again
        kaly_sr r2(m, n);
        kaly_mc c2(n, o);
        
        kalyna_interkey i2(k1,k2);
        assign temp = k2 ^ o;
        
        assign plainwire = temp;

        // Apply S-boxes and transformations again
        kaly_sbox1 w1(plainwire[127:120], y1);
        kaly_sbox1 w5(plainwire[95:88], y5);
        kaly_sbox1 w9(plainwire[63:56], y9);
        kaly_sbox1 w13(plainwire[31:24], y13);

        kaly_sbox2 w2(plainwire[119:112], y2);
        kaly_sbox2 w6(plainwire[87:80], y6);
        kaly_sbox2 w10(plainwire[55:48], y10);
        kaly_sbox2 w14(plainwire[23:16], y14);

        kaly_sbox3 w3(plainwire[111:104], y3);
        kaly_sbox3 w7(plainwire[79:72], y7);
        kaly_sbox3 w11(plainwire[47:40], y11);
        kaly_sbox3 w15(plainwire[15:8], y15);

        kaly_sbox4 w4(plainwire[103:96], y4);
        kaly_sbox4 w8(plainwire[71:64], y8);
        kaly_sbox4 w12(plainwire[39:32], y12);
        kaly_sbox4 w16(plainwire[7:0], y16);

        assign m={y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16};

        // Apply kaly_sr and kaly_mc again
        kaly_sr r3(m, n);
        kaly_mc c3(n, o);
        
        kalyna_interkey i3(k2,k3);
        assign temp = (k2 << 56 )^ o;
        
        assign plainwire = temp;

        // Apply S-boxes and transformations again
        kaly_sbox1 e1(plainwire[127:120], y1);
        kaly_sbox1 e5(plainwire[95:88], y5);
        kaly_sbox1 e9(plainwire[63:56], y9);
        kaly_sbox1 e13(plainwire[31:24], y13);

        kaly_sbox2 e2(plainwire[119:112], y2);
        kaly_sbox2 e6(plainwire[87:80], y6);
        kaly_sbox2 e10(plainwire[55:48], y10);
        kaly_sbox2 e14(plainwire[23:16], y14);

        kaly_sbox3 e3(plainwire[111:104], y3);
        kaly_sbox3 e7(plainwire[79:72], y7);
        kaly_sbox3 e11(plainwire[47:40], y11);
        kaly_sbox3 e15(plainwire[15:8], y15);

        kaly_sbox4 e4(plainwire[103:96], y4);
        kaly_sbox4 e8(plainwire[71:64], y8);
        kaly_sbox4 e12(plainwire[39:32], y12);
        kaly_sbox4 e16(plainwire[7:0], y16);

        assign m={y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16};

        // Apply kaly_sr and kaly_mc again
        kaly_sr r4(m, n);
        kaly_mc c4(n, o);
        
        kalyna_interkey i4(k3,k4);
        assign temp = k4 ^ o;
        
        assign plainwire = temp;

        // Apply S-boxes and transformations again
        kaly_sbox1 t1(plainwire[127:120], y1);
        kaly_sbox1 t5(plainwire[95:88], y5);
        kaly_sbox1 t9(plainwire[63:56], y9);
        kaly_sbox1 t13(plainwire[31:24], y13);

        kaly_sbox2 t2(plainwire[119:112], y2);
        kaly_sbox2 t6(plainwire[87:80], y6);
        kaly_sbox2 t10(plainwire[55:48], y10);
        kaly_sbox2 t14(plainwire[23:16], y14);

        kaly_sbox3 t3(plainwire[111:104], y3);
        kaly_sbox3 t7(plainwire[79:72], y7);
        kaly_sbox3 t11(plainwire[47:40], y11);
        kaly_sbox3 t15(plainwire[15:8], y15);

        kaly_sbox4 t4(plainwire[103:96], y4);
        kaly_sbox4 t8(plainwire[71:64], y8);
        kaly_sbox4 t12(plainwire[39:32], y12);
        kaly_sbox4 t16(plainwire[7:0], y16);

        assign m={y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16};

        // Apply kaly_sr and kaly_mc again
        kaly_sr r5(m, n);
        kaly_mc c5(n, o);
        
        
        kalyna_interkey i5(k4,k5);
        assign temp = (k4 << 56)^ o;
        
        assign plainwire = temp;

        // Apply S-boxes and transformations again
        kaly_sbox1 u1(plainwire[127:120], y1);
        kaly_sbox1 u5(plainwire[95:88], y5);
        kaly_sbox1 u9(plainwire[63:56], y9);
        kaly_sbox1 u13(plainwire[31:24], y13);

        kaly_sbox2 u2(plainwire[119:112], y2);
        kaly_sbox2 u6(plainwire[87:80], y6);
        kaly_sbox2 u10(plainwire[55:48], y10);
        kaly_sbox2 u14(plainwire[23:16], y14);

        kaly_sbox3 u3(plainwire[111:104], y3);
        kaly_sbox3 u7(plainwire[79:72], y7);
        kaly_sbox3 u11(plainwire[47:40], y11);
        kaly_sbox3 u15(plainwire[15:8], y15);

        kaly_sbox4 u4(plainwire[103:96], y4);
        kaly_sbox4 u8(plainwire[71:64], y8);
        kaly_sbox4 u12(plainwire[39:32], y12);
        kaly_sbox4 u16(plainwire[7:0], y16);

        assign m={y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16};

        // Apply kaly_sr and kaly_mc again
        kaly_sr r6(m, n);
        kaly_mc c6(n, o);
        
        
        kalyna_interkey i6(k5,k6);
        assign temp = k6 ^ o;
        
        assign plainwire = temp;

        // Apply S-boxes and transformations again
        kaly_sbox1 p1(plainwire[127:120], y1);
        kaly_sbox1 p5(plainwire[95:88], y5);
        kaly_sbox1 p9(plainwire[63:56], y9);
        kaly_sbox1 p13(plainwire[31:24], y13);

        kaly_sbox2 p2(plainwire[119:112], y2);
        kaly_sbox2 p6(plainwire[87:80], y6);
        kaly_sbox2 p10(plainwire[55:48], y10);
        kaly_sbox2 p14(plainwire[23:16], y14);

        kaly_sbox3 p3(plainwire[111:104], y3);
        kaly_sbox3 p7(plainwire[79:72], y7);
        kaly_sbox3 p11(plainwire[47:40], y11);
        kaly_sbox3 p15(plainwire[15:8], y15);

        kaly_sbox4 p4(plainwire[103:96], y4);
        kaly_sbox4 p8(plainwire[71:64], y8);
        kaly_sbox4 p12(plainwire[39:32], y12);
        kaly_sbox4 p16(plainwire[7:0], y16);

        assign m={y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16};

        // Apply kaly_sr and kaly_mc again
        kaly_sr r7(m, n);
        kaly_mc c7(n, o);
        
        kalyna_interkey i7(k6,k7);
        assign temp = (k6 << 56)^ o;
        
        assign plainwire = temp;

        // Apply S-boxes and transformations again
        kaly_sbox1 a1(plainwire[127:120], y1);
        kaly_sbox1 a5(plainwire[95:88], y5);
        kaly_sbox1 a9(plainwire[63:56], y9);
        kaly_sbox1 a13(plainwire[31:24], y13);

        kaly_sbox2 a2(plainwire[119:112], y2);
        kaly_sbox2 a6(plainwire[87:80], y6);
        kaly_sbox2 a10(plainwire[55:48], y10);
        kaly_sbox2 a14(plainwire[23:16], y14);

        kaly_sbox3 a3(plainwire[111:104], y3);
        kaly_sbox3 a7(plainwire[79:72], y7);
        kaly_sbox3 a11(plainwire[47:40], y11);
        kaly_sbox3 a15(plainwire[15:8], y15);

        kaly_sbox4 a4(plainwire[103:96], y4);
        kaly_sbox4 a8(plainwire[71:64], y8);
        kaly_sbox4 a12(plainwire[39:32], y12);
        kaly_sbox4 a16(plainwire[7:0], y16);

        assign m={y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16};

        // Apply kaly_sr and kaly_mc again
        kaly_sr r8(m, n);
        kaly_mc c8(n, o);
        
        kalyna_interkey i8(k7,k8);
        assign temp = k8 ^ o;
        
        assign plainwire = temp;

        // Apply S-boxes and transformations again
        kaly_sbox1 d1(plainwire[127:120], y1);
        kaly_sbox1 d5(plainwire[95:88], y5);
        kaly_sbox1 d9(plainwire[63:56], y9);
        kaly_sbox1 d13(plainwire[31:24], y13);

        kaly_sbox2 d2(plainwire[119:112], y2);
        kaly_sbox2 d6(plainwire[87:80], y6);
        kaly_sbox2 d10(plainwire[55:48], y10);
        kaly_sbox2 d14(plainwire[23:16], y14);

        kaly_sbox3 d3(plainwire[111:104], y3);
        kaly_sbox3 d7(plainwire[79:72], y7);
        kaly_sbox3 d11(plainwire[47:40], y11);
        kaly_sbox3 d15(plainwire[15:8], y15);

        kaly_sbox4 d4(plainwire[103:96], y4);
        kaly_sbox4 d8(plainwire[71:64], y8);
        kaly_sbox4 d12(plainwire[39:32], y12);
        kaly_sbox4 d16(plainwire[7:0], y16);

        assign m={y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16};

        // Apply kaly_sr and kaly_mc again
        kaly_sr r9(m, n);
        kaly_mc c9(n, o);
        
        kalyna_interkey i9(k8,k9);
        assign temp = (k8 << 56)^ o;
        
        assign plainwire = temp;

        // Apply S-boxes and transformations again
        kaly_sbox1 f1(plainwire[127:120], y1);
        kaly_sbox1 f5(plainwire[95:88], y5);
        kaly_sbox1 f9(plainwire[63:56], y9);
        kaly_sbox1 f13(plainwire[31:24], y13);

        kaly_sbox2 f2(plainwire[119:112], y2);
        kaly_sbox2 f6(plainwire[87:80], y6);
        kaly_sbox2 f10(plainwire[55:48], y10);
        kaly_sbox2 f14(plainwire[23:16], y14);

        kaly_sbox3 f3(plainwire[111:104], y3);
        kaly_sbox3 f7(plainwire[79:72], y7);
        kaly_sbox3 f11(plainwire[47:40], y11);
        kaly_sbox3 f15(plainwire[15:8], y15);

        kaly_sbox4 f4(plainwire[103:96], y4);
        kaly_sbox4 f8(plainwire[71:64], y8);
        kaly_sbox4 f12(plainwire[39:32], y12);
        kaly_sbox4 f16(plainwire[7:0], y16);

        assign m={y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14,y15,y16};

        // Apply kaly_sr and kaly_mc again
        kaly_sr r10(m, n);
        kaly_mc c10(n, o);
        
        assign temp = o + k9;
        assign temp = (temp>modulo)?(temp - modulo):temp;
        
assign cipher = temp;
endmodule 
     