module WebControl(
    input wire webCommand,
    output reg deviceControl
);
    always @(*) begin
     deviceControl = webCommand;
end
endmodule