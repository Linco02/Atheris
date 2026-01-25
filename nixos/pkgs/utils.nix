{ pkgs, ... }:

{
  # Утиліти
  environment.systemPackages = with pkgs; [
    git
    ntfs3g
    exfatprogs
    os-prober
    brightnessctl
  ];
}
