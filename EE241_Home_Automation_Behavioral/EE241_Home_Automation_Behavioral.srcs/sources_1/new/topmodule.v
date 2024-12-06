module home_automation(
    input wire motionDetected,
    input wire manualSwitch,
    input wire scheduleActive,
    input wire [7:0] currentTemp,
    input wire [7:0] desiredTemp,
    input wire doorOpen,
    input wire windowOpen,
    input wire energySavingMode,
    input wire webCommand,
    output wire lightOn,
    output wire heaterOn,
    output wire coolerOn,
    output wire alarm,
    output wire plugOn,
    output wire deviceControl
);

    // Instantiate SmartLighting module
    SmartLighting smart_lighting (
        .motionDetected(motionDetected),
        .manualSwitch(manualSwitch),
        .scheduleActive(scheduleActive),
        .lightOn(lightOn)
    );

    // Instantiate SmartThermostat module
    SmartThermostat smart_thermostat (
        .currentTemp(currentTemp),
        .desiredTemp(desiredTemp),
        .heaterOn(heaterOn),
        .coolerOn(coolerOn)
    );

    // Instantiate SecuritySystem module
    SecuritySystem security_system (
        .motionDetected(motionDetected),
        .doorOpen(doorOpen),
        .windowOpen(windowOpen),
        .alarm(alarm)
    );

    // Instantiate SmartPlug module
    SmartPlug smart_plug (
        .manualSwitch(manualSwitch),
        .scheduleActive(scheduleActive),
        .energySavingMode(energySavingMode),
        .plugOn(plugOn)
    );

    // Instantiate WebControl module
    WebControl web_control (
        .webCommand(webCommand),
        .deviceControl(deviceControl)
    );

endmodule