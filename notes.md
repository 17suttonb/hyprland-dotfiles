# TODO Notes

Just general improvements that need doing

## Package

- [x] Vicinae must be built manually (package owner updated the PKGBUILD)
- [x] Wallust AUR doesn't work, install with cargo install wallust
- [ ] Waytrogen (moved to custom PKGBUILD, probably better to pull the PKGBUILD and paste in aarch64)
- [ ] Wlogout, same as above ^
- [ ] Hyprexpo fails to initialise (bind config disabled atm)
- [ ] Hyprshutdown doesn't work? (Do I even need it?)

## Config

- [ ] Datetime is in UTC by default (fix with timedatectl first time using script)
- [ ] Test if a default wallpaper is set (and works for any user)
- [ ] Function keybinds
  - [ ] Hyprexpo (F3)
  - [ ] Search (F4)
  - [ ] Microphone/Privacy (F5)
  - [ ] Do not disturb (F6)
- [ ] Waybar battery widget wildly inaccurate
- [ ] Trackpad scrolling doesn't have velocity (sometimes)
- [x] Right-click with double click
- [ ] Neovim needs complete configuration etc
- [ ] Configure hypridle sleep/hibernation
  - [ ] Add suspend to S3 for sleep, after 30 mins start back up to shutdown (or hibernate for x86)
- [ ] Captive portal auto open

## Design

- [ ] Check for any hard coded user-specific config files
- [x] Battery charge percentage limit (80%)
  - [ ] 1-2months health check, maybe implement my own ML charging pattern thingy
- [ ] Keybind for backlight
  - [ ] Automatic backlight
- [ ] Hyprpolkitagent/Hyprsysteminfo not themed correctly (I think it's a QT theming issue)
- [ ] Swap IWD for wpa_supplicant
- [x] Add widevine installer to install script (done for install_apple.sh)
- [ ] Boot splash screen
- [ ] Greeter
- [ ] Add spongebob splash screens as an option lol
- [ ] Add options for software you want to install
- [ ] luks full disk encryption, auto-unlock user keyring on login
  - [ ] Requires custom Asahi Alarm pipeline?

## Housekeeping

- [ ] Cleanup AUR package list
- [ ] Centralise shared installation to generic script, move platform specific to seperate scripts, have simple install script that downloads the real install scripts and chooses which based on the detected platform
- [ ] Investigate kernel warnings on boot/inspect dmesg
- [ ] Cleanup shell.env
- [ ] Cleanup the whole directory, maybe remove Archive
- [ ] Compare fish to bash config, see if anything is missing
