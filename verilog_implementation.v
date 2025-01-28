`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.01.2025 15:26:50
// Design Name: 
// Module Name: approximate_multiplier
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module approximate_ha(
    input a,b,
    output s,c
    );
    assign s=a|b;
    assign c=a&b;
endmodule

module approximate_fa(
    input a,b,cin,
    output s,cout
    );
    assign s=a|b|cin;
    assign cout=a&b + b&cin;
endmodule

module approximate_compressor(
    input x,y,z,w,
    output o,carry
    );
    wire temp,ignore;
    approximate_fa fa0(
    .a(x),
    .b(y),
    .cin(z),
    .s(temp),
    .cout(ignore)
    );
    approximate_ha ha0(
    .a(temp),
    .b(w),
    .s(o),
    .c(carry)
    );
endmodule

module approximate_multiplier(
    input [3:0] a,
    input [3:0] b,
    output [7:0] result
    );
    wire a00, a01, a02, a03, a10, a11, a12, a13, a20, a21, a22, a23, a30, a31, a32, a33;
    wire o30,cin40,o40,cin50,cin20,cin30,cin41,cin51,cin60;
    wire p10, p20, p21, p30, p31, p32;
    wire g10, g20, g21, g30, g31, g32;
    assign a00=a[0]&b[0];
    assign a10=a[1]&b[0];
    assign a20=a[2]&b[0];
    assign a30=a[3]&b[0];
    assign a01=a[0]&b[1];
    assign a11=a[1]&b[1];
    assign a21=a[2]&b[1];
    assign a31=a[3]&b[1];
    assign a02=a[0]&b[2];
    assign a12=a[1]&b[2];
    assign a22=a[2]&b[2];
    assign a32=a[3]&b[2];
    assign a03=a[0]&b[3];
    assign a13=a[1]&b[3];
    assign a23=a[2]&b[3];
    assign a33=a[3]&b[3];
    or _p10(p10,a10,a01);
    or _p20(p20,a20,a02);
    or _p21(p21,a21,a12);
    or _p30(p30,a30,a03);
    or _p31(p31,a31,a13);
    or _p32(p32,a32,a23);
    and _g10(g10,a10,a01);
    and _g20(g20,a20,a02);
    and _g21(g21,a21,a12);
    and _g30(g30,a30,a03);
    and _g31(g31,a31,a13);
    and _g32(g32,a32,a23);
     /*			p30	p20	p10	a00
            p31	p21	g20	g10
        p32	g31	g30	a11
    a33	g32	a22	g21			   */   
    approximate_compressor u0(
    .x(p30),
    .y(p21),
    .z(g30),
    .w(g21),
    .o(o30),
    .carry(cin40)
    );
    /*		cin40	o30	p20	p10	a00
            p31		g20	g10
        p32	g31		a11
    a33	g32	a22				   */
    approximate_compressor u1(
    .x(p31),
    .y(a22),
    .z(g31),
    .w(cin40),
    .o(o40),
    .carry(cin50)
    );
    /*		o40	o30	p20	p10	a00
        cin50			g20	g10
        p32			a11
    a33	g32					   */
    approximate_ha ha1(
    .a(p10),
    .b(g10),
    .s(result[1]),
    .c(cin20)
    );
    /*		o40	o30	cin20	res[1]	a00
        cin50			p20	
        p32			g20
    a33	g32			a11		   */
    approximate_compressor u2(
    .x(p20),
    .y(g20),
    .z(a11),
    .w(cin20),
    .o(result[2]),
    .carry(cin30)
    );        
    /*		o40	cin30	res[2]	res[1]	a00
        cin50		o30		
        p32			
    a33	g32					   */
    approximate_ha ha2(
    .a(o30),
    .b(cin30),
    .s(result[3]),
    .c(cin41)
    );
    /*		    cin41	res[3]	res[2]	res[1]	a00
        cin50	o40			
        p32			
    a33	g32                                         */
    approximate_ha ha3(
    .a(o40),
    .b(cin41),
    .s(result[4]),
    .c(cin51)
    );
    /*	cin51	res[4]	res[3]	res[2]	res[1]	a00
        cin50				
        p32			
    a33	g32*/
    approximate_compressor u3(
    .x(p32),
    .y(g32),
    .z(cin50),
    .w(cin51),
    .o(result[5]),
    .carry(cin60)
    );
    /*  res[5]	res[4]	res[3]	res[2]	res[1]	a00
                        
    cin60				
    a33	                                            */
    approximate_ha ha4(
    .a(a33),
    .b(cin60),
    .s(result[6]),
    .c(result[7])
    );
    //res[7]	res[6]	res[5]	res[4]	res[3]	res[2]	res[1]	a00
    assign result[0]=a00;
    //res[7]	res[6]	res[5]	res[4]	res[3]	res[2]	res[1]	res[0]
endmodule
