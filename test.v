module binTObcd_cpu(

    input      [111:0] bin,
    output reg [111:0] bcd
   );
//   wire inputA;
   
//   assign inputA = bin[15:0] +
//                   bin[31:16] * 10 +
//                   bin[47:32] * 100 +
//                   bin[63:48] * 1000 +
//                   bin[79:64] * 10000 +
//                   bin[95:80] * 100000;
    
//   assign bcd[15:0]  =  inputA % 10;            // digit 0, ones place
//   assign bcd[31:16] = (inputA / 10) % 10;     // digit 1, tens place
//   assign bcd[47:32] = (inputA / 100) % 10;   // digit 2, hundreds place
//   assign bcd[63:48] = (inputA / 1000) % 10; // digit 3, thousands place
//   assign bcd[79:64] = (inputA / 10000) % 10;
//   assign bcd[95:80] = (inputA / 100000) % 10;
      
    integer i;
        
    always @(bin) begin
        bcd=0;		 	
        for (i=0; i<112; i=i+1) begin					//Iterate once for each bit in input number
            if (bin[i] <= 9 && bin[i] >= 0) begin
                bcd[i] = bin[i];
            end else if (bin[i] == "a") begin
                bcd[i] = 0;
            end else if (bin[i] == "b") begin
                bcd[i] = 1;
            end else if (bin[i] == "c") begin
                bcd[i] = 2;
            end else if (bin[i] == "d") begin
                bcd[i] = 3;
            end else if (bin[i] == "e") begin
                bcd[i] = 4;
            end else if (bin[i] == "f") begin
                bcd[i] = 5;
            end 
        end
    end
endmodule
