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
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount /tmp/Atheris/nixos/disko.nix
```

```
cd Atheris/
```

```
sudo nixos-generate-config --no-filesystems --root /mnt
```

|профіль|інформація|
|-|-|
|mini7|міні профіль|
|aspire7|основний профіль|
```
sudo nixos-install --flake .#profile
```

