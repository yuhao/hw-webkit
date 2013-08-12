/////////////////////////////////////////////////////////////////////
////                                                             ////
////  Primitives                                                 ////
////  FPU Primitives                                             ////
////                                                             ////
////  Author: Rudolf Usselmann                                   ////
////          rudi@asics.ws                                      ////
////                                                             ////
/////////////////////////////////////////////////////////////////////
////                                                             ////
//// Copyright (C) 2000 Rudolf Usselmann                         ////
////                    rudi@asics.ws                            ////
////                                                             ////
//// This source file may be used and distributed without        ////
//// restriction provided that this copyright statement is not   ////
//// removed from the file and that any derivative work contains ////
//// the original copyright notice and the associated disclaimer.////
////                                                             ////
////     THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY     ////
//// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED   ////
//// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS   ////
//// FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHOR      ////
//// OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,         ////
//// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES    ////
//// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE   ////
//// GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR        ////
//// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF  ////
//// LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR TORT  ////
//// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT  ////
//// OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE         ////
//// POSSIBILITY OF SUCH DAMAGE.                                 ////
////                                                             ////
/////////////////////////////////////////////////////////////////////


//`timescale 1ns / 100ps


//function [7:0] GetByte;        //FUNCTION DEFINITION
//  input [63:0] Word;             //declaration order
//  input [3:0] ByteNum;           //determines order
//  integer Bit;                   //of arguments when
//  reg [7:0] temp;                //called
//  begin
    //for (Bit=0; Bit<=7; Bit=Bit+1)
    //temp[Bit] = Word[((ByteNum-1)*8)+Bit];
    //GetByte = temp;              //A function returns
  //end                            // the value assigned
//endfunction                      // to its name
    




////////////////////////////////////////////////////////////////////////
//
// Add/Sub
//

module add_sub27(add, opa, opb, sum, co);
input		add;
input	[26:0]	opa, opb;
output	[26:0]	sum;
output		co;



assign {co, sum} = add ? (opa + opb) : (opa - opb);

endmodule

////////////////////////////////////////////////////////////////////////
//
// Multiply
//

module mul_r2(clk, opa, opb, prod);
input		clk;
input	[23:0]	opa, opb;
output	[47:0]	prod;

reg	[47:0]	prod1, prod;

always @(posedge clk)
	prod1 <= #1 opa * opb;

always @(posedge clk)
	prod <= #1 prod1;

endmodule

////////////////////////////////////////////////////////////////////////
//
// Divide
//

//module div_r2(clk, opa, opb, quo, rem);
//input		clk;
//input	[49:0]	opa;
//input	[23:0]	opb;
//output	[49:0]	quo, rem;
//
//reg	[49:0]	quo, rem, quo1, remainder;
//
//always @(posedge clk)
//	quo1 <= #1 opa / opb;
//	// TEMPORARY DIVISION Chirayu
//	//quo1 <= #1 opa * opb;
//
//always @(posedge clk)
//	quo <= #1 quo1;
//
//always @(posedge clk)
//	remainder <= #1 opa % opb;
//	// TEMPORARY REMAINDER Chirayu
//	//remainder <= #1 opa * opb;
//
//always @(posedge clk)
//	rem <= #1 remainder;
//
//endmodule

//module simple_divider(quotient,remainder,dividend,divider);
module div_r2(clk, opa, opb, quo, rem);   
   input  [49:0]  opa;
   input  [23:0]  opb;
   output [49:0]  quo, rem;
   input         clk;

   reg	[49:0]	quo, rem, quo1, rem1;

//  """"""""|
//     1011 |  <----  dividend_copy
// -0011    |  <----  divider_copy
//  """"""""|    0  Difference is negative: copy dividend and put 0 in quotient.
//     1011 |  <----  dividend_copy
//  -0011   |  <----  divider_copy
//  """"""""|   00  Difference is negative: copy dividend and put 0 in quotient.
//     1011 |  <----  dividend_copy
//   -0011  |  <----  divider_copy
//  """"""""|  001  Difference is positive: use difference and put 1 in quotient.
//            quotient (numbers above)   


   reg [49:0]    quotient;
   reg [49:0]    dividend_copy, diff;
   reg [49:0]    divider_copy;
   wire [49:0]   remainder = dividend_copy[49:0];
   integer i;

always @(opa,opb) begin
    for (i=-1; i<27; i=i+1) begin
        if (i==-1) begin
            // initialization
		quotient = 49'd0;
		dividend_copy = opa;
		divider_copy = {opb,26'd0};
	end else begin
            diff = dividend_copy - divider_copy;
            quotient = quotient << 1;

            if( !diff[49] ) begin
                dividend_copy = diff;
                quotient[0] = 1'd1;
            end
            divider_copy = divider_copy >> 1;
 	end
    end
end

always @(posedge clk)
      quo1 <= #1 quotient;

always @(posedge clk)
	quo <= #1 quo1;

always @(posedge clk)
	rem1 <= #1 remainder;

always @(posedge clk)
	rem <= #1 remainder;
endmodule

//force -freeze /div_r2/opa 10#5
//force -freeze /div_r2/opb 10#3
//force -freeze /div_r2/clk -repeat 10 0 0 ,1 5
//run 10
