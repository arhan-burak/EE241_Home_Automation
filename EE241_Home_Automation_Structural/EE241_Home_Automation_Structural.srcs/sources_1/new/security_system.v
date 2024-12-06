module SecuritySystem(
    input wire motionDetected,
    input wire doorOpen,
    input wire windowOpen,
    output wire alarm
);
    assign alarm = motionDetected | doorOpen | windowOpen;
endmodule