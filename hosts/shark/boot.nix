{
  boot = {
    kernelModules = [
      "i2c-dev"
      "i2c-piix4"
      "it87"
    ];

    kernelParams = [
      "acpi_enforce_resources=lax" 
    ];
  };
}