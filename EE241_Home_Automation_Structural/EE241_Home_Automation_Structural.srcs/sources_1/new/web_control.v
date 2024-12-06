module WebControl(
    input wire webCommand,
    output wire deviceControl
);
    assign deviceControl = webCommand;
endmodule