module led_tb;
  
  reg sys_clk;
  reg sys_rst_n;
  wire [2:0] led;

  // led modülü örneği
  led dut (
    .sys_clk(sys_clk),
    .sys_rst_n(sys_rst_n),
    .led(led)
  );

  always
    #5 sys_clk = ~sys_clk; // 5 zaman birimi boyunca saat sinyalini değiştirir

  initial begin
    sys_clk = 0; // başlangıçta saat sinyalini düşük olarak ayarlar
    sys_rst_n = 1; // başlangıçta reset sinyalini etkinleştirir

    // Reset düğmesine 7 zaman birimi boyunca basılı tutar
    #35 sys_rst_n = 0;
    #7 sys_rst_n = 1;

    // 100 zaman birimi boyunca devam eden simulasyon süresi
    #1000 $finish;
  end

  // LED çıkışını gözlemlemek için basit bir yazdırma işlevi
  always @(posedge sys_clk) begin
    $display("LED: %b", led);
  end

endmodule
