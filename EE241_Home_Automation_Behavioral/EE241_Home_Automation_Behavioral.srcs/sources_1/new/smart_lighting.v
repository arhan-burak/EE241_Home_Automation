module SmartLighting(
    input wire motionDetected,
    input wire manualSwitch,
    input wire scheduleActive,
    output reg lightOn
);

always @(*) begin
    if (motionDetected || manualSwitch || scheduleActive) begin
        lightOn = 1;
    end else begin
        lightOn = 0;
    end
end

endmodule