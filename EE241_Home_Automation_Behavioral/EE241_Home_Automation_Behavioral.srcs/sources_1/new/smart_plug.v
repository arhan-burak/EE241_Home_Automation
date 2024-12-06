module SmartPlug(
    input wire manualSwitch,
    input wire scheduleActive,
    input wire energySavingMode,
    output reg plugOn
);

always @(*) begin
    if (manualSwitch || (scheduleActive && !energySavingMode)) begin
        plugOn = 1;
    end else begin
        plugOn = 0;
    end
end

endmodule