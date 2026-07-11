# ❄️ Dotfiles

<picture>
  <img alt="Desktop Preview" align="right" width="400px" src="assets/preview.jpg"/>
</picture>

> [!NOTE]
> **System Information:**
> * **OS:** NixOS
> * **Window Manager:** Swayfx
> * **Shell:** Zsh
> * **Terminal:** Alacritty
> * **Editor:** Nixvim

A minimalist and strict environment. Built around tiling, the terminal, and a keyboard-centric workflow.

### Setup Details

* **Visuals:** Unified color palette based on Catppuccin. Applied consistently across the system, from the Swayfx interface to `fastfetch` output.
* **Modularity:** Configurations are managed via Home Manager, making it easy to port the setup or decouple specific widgets.

### Installation

This guide assumes you have a fresh NixOS installation with Flakes enabled.

1. Clone the repository to your preferred location:
```bash
git clone https://github.com/f01zy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

2. Copy the hardware configuration from your current system:
```bash
cp /etc/nixos/hardware-configuration.nix ./hosts/device-name/
```

3. Edit the variables (username, host) in `flake.nix` to match your setup.
4. Apply the system configuration:
```bash
sudo nixos-rebuild switch --flake .#hostname
```
