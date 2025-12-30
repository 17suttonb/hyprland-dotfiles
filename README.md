# Hyprland Configuration

A comprehensive, modern, rust-powered Hyprland 🍚 with a focus on featuring automated theme management, dynamic wallpaper integration, and seamless workflow optimization.

---

# Fork notes

I forked this from https://github.com/saatvik333/hyprland-dotfiles
so credits to saatvik333. I also largely based the install scripts on their niri dotfiles install script.

## Installation Guide

### WARNING!!! THIS IS THE AARCH64 BRANCH FOR APPLE SILICON, THERE ARE NO CHECKS FOR THIS SO DO NOT USE UNLESS YOU ARE ON AN M BASED MAC

The installation script assumes a clean Arch-Linux installation, aka intended to setup a whole desktop stack from a minimal install, not just the requirements for these dotfiles.

```bash
curl -fsSL https://raw.githubusercontent.com/Paracolax1/hyprland-dotfiles/refs/heads/aarch64/install_apple.sh -o install_apple.sh
chmod +x install_apple.sh
./install_apple.sh
```

## Requirements

- Sudo priviledges
- Sufficent disk space, est. 40 GB (mostly for fonts weirdly)
- Internet connection
- DON'T RUN AS ROOT

## Overview

This configuration provides a complete desktop environment built around Hyprland with intelligent automation systems. The setup includes dynamic theme synchronization across all applications, animated wallpaper support, and a modular script architecture for system management.

## Key Features

### Automated Theme Management

- **Dynamic Color Extraction**: Automatically generates color schemes from wallpapers using Wallust
- **System-wide Synchronization**: Updates GTK themes, terminal colors, Waybar, and application themes
- **GIF Wallpaper Support**: Seamless integration with animated wallpapers via waytrogen and swww
- **Intelligent Adaptation**: Adjusts interface elements based on wallpaper luminosity

### Modular Script Architecture

- **Theme Orchestration**: Centralized theme management with component-specific handlers
- **Media Controls**: Unified volume, brightness, and playback management with visual feedback
- **System Utilities**: Package update monitoring, git repository maintenance, and status displays
- **Error Handling**: Comprehensive logging, notifications, and recovery mechanisms

### Application Integration

- **Terminal**: Alacritty with dynamic color schemes
- **Shell**: Zsh, Bash or fish with unified environment configuration
- **Editor**: Neovim (WIP) with theme synchronization
- **Browser**: Custom themes and integration
- **Development**: VSCode, various development tools

## Configuration Structure

```txt
~/.config/
├── hypr/           # Hyprland configuration
├── waybar/         # Status bar configuration
├── scripts/        # Automation and utility scripts
├── wallust/        # Color palette templates
├── themes/         # GTK and application themes
└── [applications]/ # Individual application configs
```

## Script System

The configuration includes a modular script system organized by functionality:

- **Theme Management**: Automated theme synchronization and wallpaper processing
- **Media Controls**: Volume, brightness, and playback management
- **System Utilities**: Package updates, git maintenance, status monitoring
- **Development Tools**: Project management and workflow automation

For detailed script documentation, see [`scripts/README.md`](scripts/README.md).

## License

This configuration is provided as-is for educational and personal use. Individual components may have their own licenses.

---

## Original Author

[saatvik333](https://github.com/saatvik333)
