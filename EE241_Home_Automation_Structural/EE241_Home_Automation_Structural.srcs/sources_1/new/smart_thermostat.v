module SmartThermostat(
    input wire [7:0] currentTemp, // Current temperature
    input wire [7:0] desiredTemp, // Desired temperature
    output wire heaterOn,
    output wire coolerOn
);

    wire [7:0] lowerThreshold;
    wire [7:0] upperThreshold;

    wire heater;
    wire cooler;

    assign cold = desiredTemp - 8;
    assign hot = desiredTemp + 8;

    assign heater = (currentTemp < lowerThreshold);
    assign cooler = (currentTemp > upperThreshold);

    assign heaterOn = heater;
    assign coolerOn = cooler;

endmodule
