`timescale 1ns/10ps
module mips_pipeline_tb();
reg clk1,clk2;
mips_pipeline DUT(.clk1(clk1),.clk2(clk2));
initial
begin
clk1 = 1'b0;
clk2 = 1'b1;
forever
begin
#10;
clk1 = ~clk1;
clk2 = ~clk2;
end
end

initial 
begin
 
DUT.PC = 32'b00000000000000000000000000000000;
DUT.HALTED = 1'b0;

DUT.Data_Mem[0] = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 
DUT.Data_Mem[1] = 32'b00000000000000000000000000000111; //7
DUT.Data_Mem[2] = 32'b00000000000000000000000000000001; //1 
DUT.Data_Mem[3] = 32'b00000000000000000000000000000010; //2
DUT.Data_Mem[4] = 32'b00000000000000000000000000001100; //12
DUT.Data_Mem[5] = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 
DUT.Data_Mem[6] = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 
DUT.Data_Mem[7] = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 
DUT.Data_Mem[8] = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 
DUT.Data_Mem[9] = 32'b00000000000000000000000000000100; //4
DUT.Data_Mem[10] = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 
DUT.Data_Mem[11] = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 
DUT.Data_Mem[12] = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 
DUT.Data_Mem[13] = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 
DUT.Data_Mem[14] = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 
DUT.Data_Mem[15] = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx; 

//fibonacci series & factorial
DUT.Inst_Mem[0] = 32'b001000_00000_00001_0000000000000000; //R1<--R0
DUT.Inst_Mem[1] = 32'b000110_00000_00010_0000000000000010; //R2<--[R0+2]
DUT.Inst_Mem[2]	= 32'b000110_00000_00011_0000000000000100; //R3<--[R0+4]
DUT.Inst_Mem[3] = 32'b001011_00011_00000_0000000000000101; //BRANCH to +6 if R3=R0
DUT.Inst_Mem[4]	= 32'b001110_00010_00000_00100_00000000000; //R4<--R2
DUT.Inst_Mem[5]	= 32'b001110_00010_00001_00010_00000000010; //R2<--R1+R2
DUT.Inst_Mem[6]	= 32'b001110_00100_00000_00001_00000000000; //R1<--R4
DUT.Inst_Mem[7]	= 32'b001001_00011_00011_0000000000000001; //R3<--R3-1
DUT.Inst_Mem[8]	= 32'b001101_00000000000000000000000011; //JUMP to 3
DUT.Inst_Mem[9]	= 32'b000110_00000_00101_0000000000000001; //R5<--[R0+1]
DUT.Inst_Mem[10] = 32'b001000_00000_00110_0000000000000001; //R6<--1
DUT.Inst_Mem[11] = 32'b001011_00000_00101_0000000000000011; //BRANCH to +4 if R6=R5
DUT.Inst_Mem[12] = 32'b000010_00101_00110_00110_00000000001; //R5<--R6*R5
DUT.Inst_Mem[13] = 32'b001001_00101_00101_0000000000000001; //R6<--R6-1
DUT.Inst_Mem[14] = 32'b001101_00000000000000000000001011; //JUMP to 11
DUT.Inst_Mem[15] = 32'b111111_00000000000000000000000000; //HALT
		   
end	  

endmodule