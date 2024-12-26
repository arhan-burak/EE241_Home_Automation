`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2024 02:16:05
// Design Name: 
// Module Name: sequential
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

module SequentialHomeAutomation(
    input wire clk,
    input wire reset,
    input wire motionDetected,
    input wire manualSwitch,
    input wire scheduleActive,
    input wire [7:0] currentTemp,
    input wire [7:0] desiredTemp,
    input wire doorOpen,
    input wire windowOpen,
    input wire energySavingMode,
    input wire webCommand,
    output wire lightOn,
    output wire heaterOn,
    output wire coolerOn,
    output wire alarm,
    output wire plugOn,
    output wire deviceControl
);

    reg motionDetected_reg;
    reg manualSwitch_reg;
    reg scheduleActive_reg;
    reg [7:0] currentTemp_reg;
    reg [7:0] desiredTemp_reg;
    reg doorOpen_reg;
    reg windowOpen_reg;
    reg energySavingMode_reg;
    reg webCommand_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            motionDetected_reg <= 0;
            manualSwitch_reg <= 0;
            scheduleActive_reg <= 0;
            currentTemp_reg <= 0;
            desiredTemp_reg <= 0;
            doorOpen_reg <= 0;
            windowOpen_reg <= 0;
            energySavingMode_reg <= 0;
            webCommand_reg <= 0;
        end else begin
            motionDetected_reg <= motionDetected;
            manualSwitch_reg <= manualSwitch;
            scheduleActive_reg <= scheduleActive;
            currentTemp_reg <= currentTemp;
            desiredTemp_reg <= desiredTemp;
            doorOpen_reg <= doorOpen;
            windowOpen_reg <= windowOpen;
            energySavingMode_reg <= energySavingMode;
            webCommand_reg <= webCommand;
        end
    end

    SmartLighting smart_lighting (
        .motionDetected(motionDetected_reg),
        .manualSwitch(manualSwitch_reg),
        .scheduleActive(scheduleActive_reg),
        .lightOn(lightOn)
    );

    SmartThermostat smart_thermostat (
        .currentTemp(currentTemp_reg),
        .desiredTemp(desiredTemp_reg),
        .heaterOn(heaterOn),
        .coolerOn(coolerOn)
    );

    SecuritySystem security_system (
        .motionDetected(motionDetected_reg),
        .doorOpen(doorOpen_reg),
        .windowOpen(windowOpen_reg),
        .alarm(alarm)
    );

    SmartPlug smart_plug (
        .manualSwitch(manualSwitch_reg),
        .scheduleActive(scheduleActive_reg),
        .energySavingMode(energySavingMode_reg),
        .plugOn(plugOn)
    );

    WebControl web_control (
        .webCommand(webCommand_reg),
        .deviceControl(deviceControl)
    );

endmodule