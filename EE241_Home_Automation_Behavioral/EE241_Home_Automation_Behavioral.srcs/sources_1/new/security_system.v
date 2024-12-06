module SecuritySystem(
    input wire motionDetected,
    input wire doorOpen,
    input wire windowOpen,
    output reg alarm
);

always @(*) begin
    if (motionDetected || doorOpen || windowOpen) begin
        alarm = 1;
    end else begin
        alarm = 0;
    end
end

endmodule