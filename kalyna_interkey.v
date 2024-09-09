module kalyna_interkey(roundkey);
  //  input [127:0] key;
    output [127:0] roundkey;
    wire [127:0] intkey;
    
    wire [127:0]key;
    wire [127:0] modulo;
    wire [127:0] temp;
    wire [127:0] plainwire;
    wire [127:0] m1,m2,m3,m4,m5;
    wire [127:0] n1,n2,n3,n4,n5;
    wire [127:0] o1,o2,o3,o4,o5;

    wire [7:0] s1, s2, s3, s4, s5, s6, s7, s8;
    wire [7:0] s9, s10, s11, s12, s13, s14, s15, s16;

    wire [7:0] y1_1, y1_2, y1_3, y1_4, y1_5, y1_6, y1_7, y1_8;
    wire [7:0] y1_9, y1_10, y1_11, y1_12, y1_13, y1_14, y1_15, y1_16;
    
    wire [7:0] y2_1, y2_2, y2_3, y2_4, y2_5, y2_6, y2_7, y2_8;
    wire [7:0] y2_9, y2_10, y2_11, y2_12, y2_13, y2_14, y2_15, y2_16;
    
    wire [7:0] y3_1, y3_2, y3_3, y3_4, y3_5, y3_6, y3_7, y3_8;
    wire [7:0] y3_9, y3_10, y3_11, y3_12, y3_13, y3_14, y3_15, y3_16;
    
    wire [7:0] y4_1, y4_2, y4_3, y4_4, y4_5, y4_6, y4_7, y4_8;
    wire [7:0] y4_9, y4_10, y4_11, y4_12, y4_13, y4_14, y4_15, y4_16;
    
    wire [7:0] y5_1, y5_2, y5_3, y5_4, y5_5, y5_6, y5_7, y5_8;
    wire [7:0] y5_9, y5_10, y5_11, y5_12, y5_13, y5_14, y5_15, y5_16;
    
    
    wire [127:0] w1,w2,w3,w4;
    wire [127:0] const;
    wire [127:0] ci = 128'h00800040002000100008000400020001;
    wire [127:0] rk,k2,k3,k4,k5;
    wire [127:0] roundkey_reg;
    reg [127:0] const_reg;
    wire [127:0] k1,temp_reg1,temp2,temp3,temp4,temp5;
    
    assign modulo = 128'h00000000000000010000000000000000;
    assign key = 128'h000102030405060708090a0b0c0d0e0f;

    assign const = {120'd0, 8'd5};


        // First operation
        assign k1 = key + const;
        assign temp_reg1 = (k1 > modulo)? (k1 - modulo):k1;
        
        assign plainwire = temp_reg1;
        
        // Apply S-boxes and transformations
        kaly_sbox1 z1(plainwire[127:120], y1_1);
        kaly_sbox1 z5(plainwire[95:88], y1_5);
        kaly_sbox1 z9(plainwire[63:56], y1_9);
        kaly_sbox1 z13(plainwire[31:24], y1_13);

        kaly_sbox2 z2(plainwire[119:112], y1_2);
        kaly_sbox2 z6(plainwire[87:80], y1_6);
        kaly_sbox2 z10(plainwire[55:48], y1_10);
        kaly_sbox2 z14(plainwire[23:16], y1_14);

        kaly_sbox3 z3(plainwire[111:104], y1_3);
        kaly_sbox3 z7(plainwire[79:72], y1_7);
        kaly_sbox3 z11(plainwire[47:40], y1_11);
        kaly_sbox3 z15(plainwire[15:8], y1_15);

        kaly_sbox4 z4(plainwire[103:96], y1_4);
        kaly_sbox4 z8(plainwire[71:64], y1_8);
        kaly_sbox4 z12(plainwire[39:32], y1_12);
        kaly_sbox4 z16(plainwire[7:0], y1_16);

        assign m1={y1_1,y1_2,y1_3,y1_4,y1_5,y1_6,y1_7,y1_8,y1_9,y1_10,y1_11,y1_12,y1_13,y1_14,y1_15,y1_16};

        // Apply kaly_sr and kaly_mc
        kaly_sr r1(m1, n1);
        kaly_mc c1(n1, o1);
                     
        //continue with operations
        assign k2 = key ^ o1;
        assign w1 = k2;

        // Apply S-boxes and transformations again
        kaly_sbox1 q1(w1[127:120], y2_1);
        kaly_sbox1 q5(w1[95:88], y2_5);
        kaly_sbox1 q9(w1[63:56], y2_9);
        kaly_sbox1 q13(w1[31:24], y2_13);

        kaly_sbox2 q2(w1[119:112], y2_2);
        kaly_sbox2 q6(w1[87:80], y2_6);
        kaly_sbox2 q10(w1[55:48], y2_10);
        kaly_sbox2 q14(w1[23:16], y2_14);

        kaly_sbox3 q3(w1[111:104], y2_3);
        kaly_sbox3 q7(w1[79:72], y2_7);
        kaly_sbox3 q11(w1[47:40], y2_11);
        kaly_sbox3 q15(w1[15:8], y2_15);

        kaly_sbox4 q4(w1[103:96], y2_4);
        kaly_sbox4 q8(w1[71:64], y2_8);
        kaly_sbox4 q12(w1[39:32], y2_12);
        kaly_sbox4 q16(w1[7:0], y2_16);

        assign m2={y2_1,y2_2,y2_3,y2_4,y2_5,y2_6,y2_7,y2_8,y2_9,y2_10,y2_11,y2_12,y2_13,y2_14,y2_15,y2_16};

        // Apply kaly_sr and kaly_mc again
        kaly_sr r2(m2, n2);
        kaly_mc c2(n2, o2);
        
        // Continue with operations
        assign k3 = key + o2;
        assign temp2 = (k3 > modulo)? (k3 - modulo):k3;

        assign w2 = temp2;

        // Apply S-boxes and transformations again
        kaly_sbox1 d1(w2[127:120], y3_1);
        kaly_sbox1 w5(w2[95:88], y3_5);
        kaly_sbox1 w9(w2[63:56], y3_9);
        kaly_sbox1 w13(w2[31:24], y3_13);

        kaly_sbox2 d2(w2[119:112], y3_2);
        kaly_sbox2 w6(w2[87:80], y3_6);
        kaly_sbox2 w10(w2[55:48], y3_10);
        kaly_sbox2 w14(w2[23:16], y3_14);

        kaly_sbox3 d3(w2[111:104], y3_3);
        kaly_sbox3 w7(w2[79:72], y3_7);
        kaly_sbox3 w11(w2[47:40], y3_11);
        kaly_sbox3 w15(w2[15:8], y3_15);

        kaly_sbox4 d4(w2[103:96], y3_4);
        kaly_sbox4 w8(w2[71:64], y3_8);
        kaly_sbox4 w12(w2[39:32], y3_12);
        kaly_sbox4 w16(w2[7:0], y3_16);

        assign m3={y3_1,y3_2,y3_3,y3_4,y3_5,y3_6,y3_7,y3_8,y3_9,y3_10,y3_11,y3_12,y3_13,y3_14,y3_15,y3_16};

        // Apply kaly_sr and kaly_mc again
        kaly_sr r3(m3, n3);
        kaly_mc c3(n3, o3);
                     
        assign intkey = o3;

        // Compute the round key
        assign rk = ci + o3;
        assign rk = (rk > modulo)? (rk - modulo):rk;        

        // operation for round key generation
        assign k4 = key + rk;
        assign temp3 = (k4 > modulo)? (k4 - modulo):k4;
            
        assign w3 = temp3;
        
        // Apply S-boxes and transformations
        kaly_sbox1 e1(w3[127:120], y4_1);
        kaly_sbox1 e5(w3[95:88], y4_5);
        kaly_sbox1 e9(w3[63:56], y4_9);
        kaly_sbox1 e13(w3[31:24], y4_13);

        kaly_sbox2 e2(w3[119:112], y4_2);
        kaly_sbox2 e6(w3[87:80], y4_6);
        kaly_sbox2 e10(w3[55:48], y4_10);
        kaly_sbox2 e14(w3[23:16], y4_14);

        kaly_sbox3 e3(w3[111:104], y4_3);
        kaly_sbox3 e7(w3[79:72], y4_7);
        kaly_sbox3 e11(w3[47:40], y4_11);
        kaly_sbox3 e15(w3[15:8], y4_15);

        kaly_sbox4 e4(w3[103:96], y4_4);
        kaly_sbox4 e8(w3[71:64], y4_8);
        kaly_sbox4 e12(w3[39:32], y4_12);
        kaly_sbox4 e16(w3[7:0], y4_16);

        assign m4={y4_1,y4_2,y4_3,y4_4,y4_5,y4_6,y4_7,y4_8,y4_9,y4_10,y4_11,y4_12,y4_13,y4_14,y4_15,y4_16};

        // Apply kaly_sr and kaly_mc
        kaly_sr r4(m4, n4);
        kaly_mc c4(n4, o4);
                     
         //continue with operations
        assign k5 = rk ^ o4;
        assign w4 = k5;

        // Apply S-boxes and transformations again
        kaly_sbox1 t1(w4[127:120], y5_1);
        kaly_sbox1 t5(w4[95:88], y5_5);
        kaly_sbox1 t9(w4[63:56], y5_9);
        kaly_sbox1 t13(w4[31:24], y5_13);

        kaly_sbox2 t2(w4[119:112], y5_2);
        kaly_sbox2 t6(w4[87:80], y5_6);
        kaly_sbox2 t10(w4[55:48], y5_10);
        kaly_sbox2 t14(w4[23:16], y5_14);
        
        kaly_sbox3 t3(w4[111:104], y5_3);
        kaly_sbox3 t7(w4[79:72], y5_7);
        kaly_sbox3 t11(w4[47:40], y5_11);
        kaly_sbox3 t15(w4[15:8], y5_15);

        kaly_sbox4 t4(w4[103:96], y5_4);
        kaly_sbox4 t8(w4[71:64], y5_8);
        kaly_sbox4 t12(w4[39:32], y5_12);
        kaly_sbox4 t16(w4[7:0], y5_16);

        assign m5={y5_1,y5_2,y5_3,y5_4,y5_5,y5_6,y5_7,y5_8,y5_9,y5_10,y5_11,y5_12,y5_13,y5_14,y5_15,y5_16};

        // Apply kaly_sr and kaly_mc again
        kaly_sr r5(m5, n5);
        kaly_mc c5(n5, o5);
        
        // Compute the round key
        assign roundkey_reg = o5 + rk;
        assign roundkey_reg = (roundkey_reg > modulo)? (roundkey_reg - modulo):roundkey_reg;

    assign roundkey = roundkey_reg;
endmodule

