`include "register_set.v"
`include "remap.v"
module register_block(
                      input logic         clk,
                      input logic         reset,
                      input logic         wnr,
                      input logic [1:0]   req,
                      input logic [7:0]   address,
                      input logic [31:0]  data_in,
                      output logic        ack,
                      output logic [31:0] data_out,
                      output logic [15:0] sdma_address_low,
                      output logic [15:0] sdma_address_high,
                      output logic [15:0] block_size,
                      output logic [15:0] block_count,
                      output logic [15:0] argument_0,
                      output logic [15:0] argument_1,
                      output logic [15:0] response_0,
                      output logic [15:0] response_1,
                      output logic [15:0] response_2,
                      output logic [15:0] response_3,
                      output logic [15:0] response_4,
                      output logic [15:0] response_5,
                      output logic [15:0] response_6,
                      output logic [15:0] response_7,
                      output logic [15:0] buffer_data_port_0,
                      output logic [15:0] buffer_data_port_1,
                      output logic [31:0] present_state,
                      output logic [7:0]  host_control,
                      output logic [7:0]  power_control,
                      output logic [7:0]  block_gap_control,
                      output logic [7:0]  wakeup_control,
                      output logic [15:0] clock_control,
                      output logic [7:0]  timeout_control,
                      output logic [7:0]  software_reset,
                      output logic [15:0] normal_interrupt_status,
                      output logic [15:0] error_interruprt_status,
                      output logic [15:0] normal_interrupt_status_en,
                      output logic [15:0] error_interruprt_status_en,
                      output logic [15:0] normal_interrupt_signal_en,
                      output logic [15:0] error_interruprt_signal_en,
                      output logic [15:0] auto_cmd_12_error_status,
                      output logic [31:0] capabilities,
                      output logic [15:0] capabilities_resrv,
                      output logic [31:0] max_current_capabilities,
                      output logic [31:0] max_current_capabilities_resrv,
                      output logic [15:0] force_event_auto_cmd_12_error_status,
                      output logic [15:0] force_event_error_interrupt_status,
                      output logic [8:0]  adma_error_status,
                      output logic [63:0] adma_system_address,
                      output logic [15:0] slot_interrupt_status,
                      output logic [15:0] host_controller_version
                      );

   logic [2047:0]                         mem_data_out;

   register_set r( /*AUTOINST*/
                    .clk(clk),
                    .reset(reset),
                    .wnr(wnr),
                    .req(req),
                    .address(address),
                    .mem_data_out(mem_data_out),
                    .data_out(data_out),
                    .ack(ack),
                    .data_in(data_in)
                   );


   remap map( /*AUTOINST*/
              .mem_data_out(mem_data_out),
              .sdma_address_low(sdma_address_low),
              .sdma_address_high(sdma_address_high),
              .block_size(block_size),
              .block_count(block_count),
              .argument_0(argument_0),
              .argument_1(argument_1),
              .response_0(response_0),
              .response_1(response_1),
              .response_2(response_2),
              .response_3(response_3),
              .response_4(response_4),
              .response_5(response_5),
              .response_6(response_6),
              .response_7(response_7),
              .buffer_data_port_0(buffer_data_port_0),
              .buffer_data_port_1(buffer_data_port_1),
              .present_state(present_state),
              .host_control(host_control),
              .power_control(power_control),
              .block_gap_control(block_gap_control),
              .wakeup_control(wakeup_control),
              .clock_control(clock_control),
              .timeout_control(timeout_control),
              .software_reset(software_reset),
              .normal_interrupt_status(normal_interrupt_status),
              .error_interruprt_status(error_interruprt_status),
              .normal_interrupt_status_en(normal_interrupt_status_en),
              .error_interruprt_status_en(error_interruprt_status_en),
              .normal_interrupt_signal_en(normal_interrupt_signal_en),
              .error_interruprt_signal_en(error_interruprt_signal_en),
              .auto_cmd_12_error_status(auto_cmd_12_error_status),
              .capabilities(capabilities),
              .capabilities_resrv(capabilities_resrv),
              .max_current_capabilities(max_current_capabilities),
              .max_current_capabilities_resrv(max_current_capabilities_resrv),
              .force_event_auto_cmd_12_error_status(force_event_auto_cmd_12_error_status),
              .force_event_error_interrupt_status(force_event_error_interrupt_status),
              .adma_error_status(adma_error_status),
              .adma_system_address(adma_system_address),
              .slot_interrupt_status(slot_interrupt_status),
              .host_controller_version(host_controller_version)
              );
endmodule // register_block
