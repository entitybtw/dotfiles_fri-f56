# dotfiles_fri-f56
my hyprland dotfiles for my HONOR FRI-F56 (MagicBook X14) laptop on Bedrock Linux (main strat - Gentoo)

## Installation

**Warning:**  
if you have folders with the same names as in this repository inside your `~/.config/` directory (e.g., `rofi`, `waybar`, `kitty`), they **will be overwritten** during the installation process.  
please make sure to back up these existing configuration folders manually before proceeding to avoid data loss.

2. copy the contents of the `.config` folder to your local `.config` directory:
```
cp -r dotfiles_fri-f56/.config/* ~/.config/
```

3. remove the cloned repository folder:
```
rm -rf dotfiles_fri-f56
```

4. restart your session or relevant applications to apply the new configurations.