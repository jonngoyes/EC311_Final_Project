`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2020 07:34:56 AM
// Design Name: 
// Module Name: decimal_converter
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

module decimal_converter(
    output reg[9:0]pbcd,//pseudo bcd
    input [7:0] acc_in
);
integer k,i;
reg [15:0]temp;//

always@(*)begin
temp[7:0]= acc_in; 
temp[15:8]=0;
for(k=0;k<8;k=k+1)begin//run 8 times for a total of 8 shifts. enough to move enire input vector over

////add 3 to hundreds, tens, ones. each section is 4 bits. 
if(temp[11:8]>=5)
temp[11:8]=temp[11:8]+3;
if(temp[15:12]>=5)
temp[15:12]=temp[15:12]+3; 
temp = temp<<1;//shift 1 
end
//[15 14 13 12 11 10 9 8    |  7 6 5 4 3 2 1 0 ]
pbcd[4:0]={1'b0, temp[11:8]};
pbcd[9:5]={1'b0, temp[15:12]};
end

endmodule// pad zeroes in each colum. doesnt go past 99 so hundreds are not used. 