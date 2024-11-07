module SmartPlug(
    input wire manualSwitch,
    input wire scheduleActive,
    input wire energySavingMode,
    output wire plugOn
);
    assign plugOn = manualSwitch | scheduleActive & ~energySavingMode;
endmodule