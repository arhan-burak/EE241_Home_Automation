module SmartThermostat(
    input wire [7:0] currentTemp, // Current temperature
    input wire [7:0] desiredTemp, // Desired temperature
    output reg heaterOn,
    output reg coolerOn
);
    // Threshold to avoid frequent switches
    parameter threshold = 2;

    always @(*) begin
        if (currentTemp < (desiredTemp - threshold)) begin
            heaterOn = 1;
            coolerOn = 0;
        end else if (currentTemp > (desiredTemp + threshold)) begin
            heaterOn = 0;
            coolerOn = 1;
        end else begin
            heaterOn = 0;
            coolerOn = 0;
        end
    end
endmodule