{ pkgs, ... }:

{
  # Утиліти
  environment.systemPackages = with pkgs; [
    ntfs3g
    exfatprogs
    os-prober
    dnsmasq
    spice-gtk
    polkit_gnome
    steam-run
  ];
}
