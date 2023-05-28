module led (
    input sys_clk,
    input sys_rst_n,
    output reg[2:0] led
);

reg[31:0] counter;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        counter <= 32'd0;
    else if (counter < 32'd240_000_000) // 10 saniye için 240M hesaplaması
        counter <= counter+1;
    else if (counter < 32'd300_000_000) // 2 saniye için 40M hesaplaması
        counter <= counter+1;
    else if (counter < 32'd430_000_000) // 5 saniye için 150M hesaplaması
        counter <= counter+1;
    else
        counter <= 32'd0;
end

always @(posedge sys_clk or negedge sys_rst_n)begin
    if (!sys_rst_n)
        led <= 3'b011; // kırmızı renk ile başlayacak
    else if(counter < 32'd240_000_000) // kırmızı LED için
        led <= 3'b011;
    else if(counter < 32'd300_000_000) // mavi LED için
        led <= 3'b101;
    else if(counter < 32'd430_000_000) // yeşil LED için
        led <= 3'b110;
    else
        led <= 3'b011; // tekrar kırmızı renge dönecek
end

endmodule

 