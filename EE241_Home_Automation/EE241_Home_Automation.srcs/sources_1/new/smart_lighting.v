module SmartLighting(
    input wire motionDetected,
    input wire manualSwitch,
    input wire scheduleActive,
    output wire lightOn
);
    assign lightOn = motionDetected | manualSwitch | scheduleActive;
endmodule