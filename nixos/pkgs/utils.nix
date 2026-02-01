{ pkgs, ... }:

{
  # Утиліти
  environment.systemPackages = with pkgs; [
    ntfs3g
    exfatprogs
    os-prober
    dnsmasq
  ];
}
