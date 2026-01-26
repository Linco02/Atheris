# 🐍 Atheris-Shell 🐍
information

## ⭐ Installation ⭐

```
cd /tmp/
```

```
git clone https://github.com/Linco02/Atheris
```

```
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount /tmp/Atheris/hosts/mini7/disko.nix
```

```
cd /Atheris/
```

```
sudo nixos-generate-config --no-filesystems --root /mnt
```

```
sudo nixos-install --flake .#mini7
```

