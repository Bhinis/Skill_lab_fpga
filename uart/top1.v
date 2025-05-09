`include "uart_trx.v"

//----------------------------------------------------------------------------
//                                                                          --
//                         Module Declaration                               --
//                                                                          --
//----------------------------------------------------------------------------

module top (
  output wire led_red,
  output wire led_blue,
  output wire led_green,
  output wire uarttx,
  input wire uartrx,
  input wire hw_clk
);

  wire        int_osc;
  reg  [27:0] frequency_counter_i;

  /* 9600 Hz clock generation (from 12 MHz) */
  reg clk_9600 = 0;
  reg [31:0] cntr_9600 = 32'b0;
  parameter period_9600 = 625;

  // UART TX related registers
  reg [7:0] message [0:10];
  reg [3:0] msg_index = 0;
  reg [7:0] tx_data = 8'b0;
  reg send = 0;
  wire tx_done;

  // Initialize message
  initial begin
    message[0] = "B";
    message[1] = "H";
    message[2] = "I";
    message[3] = "N";
    message[4] = "I";
    message[5] = "\n";       // Newline
    message[6] = 8'h00;      // Null terminator
  end

  // Instantiate UART module
  uart_tx_8n1 DanUART (
    .clk(clk_9600),
    .txbyte(tx_data),
    .senddata(send),
    .txdone(tx_done),
    .tx(uarttx)
  );

  // Internal oscillator
  SB_HFOSC #(.CLKHF_DIV ("0b10")) u_SB_HFOSC (
    .CLKHFPU(1'b1),
    .CLKHFEN(1'b1),
    .CLKHF(int_osc)
  );

  // Generate 9600 Hz clock
  always @(posedge int_osc) begin
    frequency_counter_i <= frequency_counter_i + 1'b1;
    cntr_9600 <= cntr_9600 + 1;
    if (cntr_9600 == period_9600) begin
      clk_9600 <= ~clk_9600;
      cntr_9600 <= 32'b0;
    end
  end

  // Message transmission FSM (loops)
  reg [1:0] tx_state = 0;

  always @(posedge clk_9600) begin
    case (tx_state)
      0: begin
        tx_data <= message[msg_index];
        send <= 1;
        tx_state <= 1;
      end
      1: begin
        send <= 0; // pulse send for one clock
        if (tx_done) begin
          if (message[msg_index] != 8'h00) begin
            msg_index <= msg_index + 1;
          end else begin
            msg_index <= 0; // restart transmission
          end
          tx_state <= 0;
        end
      end
    endcase
  end

  // RGB driver for status (optional)
  SB_RGBA_DRV RGB_DRIVER (
    .RGBLEDEN(1'b1),
    .RGB0PWM (uartrx),
    .RGB1PWM (uartrx),
    .RGB2PWM (uartrx),
    .CURREN  (1'b1),
    .RGB0    (led_green),
    .RGB1    (led_blue),
    .RGB2    (led_red)
  );
  defparam RGB_DRIVER.RGB0_CURRENT = "0b000001";
  defparam RGB_DRIVER.RGB1_CURRENT = "0b000001";
  defparam RGB_DRIVER.RGB2_CURRENT = "0b000001";

endmodule
