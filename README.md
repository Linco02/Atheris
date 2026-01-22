# 🐍 Atheris-Shell 🐍
information

## ⭐ Installation ⭐
1. Спочатку клонуємо репозиторій

```
git clone https://github.com/Linco02/Atheris
```

2. Вибираємо потрібний профіль

| profile | Description |
| - | - |
| aspire7 | основна робоча версія |
| mini7 | мінімальна робоча версія |

3. Копіюємо **hardware-configuration.nix** в папку з вибраним профілем

```
cp /etc/nixos/hardware-configuration.nix ~/Atheris/hosts/profile
```
Якщо встановленна версія з grub потрібно змінити налаштування в /nixos/modules/boot.nix з bootloader --> grub

4. Потім замінивши profile на вибраний застовуємо до системи

```
nixos-rebuild switch --flake ~/Atheris#profile --impure --refresh
```

## 🖼️ Preview 🖼️
images