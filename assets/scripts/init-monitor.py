import subprocess


def monitor_on():
    subprocess.run(["hyprctl", "keyword", "monitor", "eDP-1,1920x1080@60,0x0,1"])

def monitor_off():
    subprocess.run(["hyprctl", "keyword", "monitor", "eDP-1,disable"])

num = 0
monitors = subprocess.run(["hyprctl", "monitors"], capture_output=True, text=True)
for res in monitors.stdout.splitlines():
    if "Monitor" in res:
        num += 1


if num > 1:
    monitor_off()
else:
    monitor_on()