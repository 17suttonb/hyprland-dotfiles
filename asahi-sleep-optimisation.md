# Asahi Linux Sleep Optimisation Notes

> Last updated: April 2026  
> Hardware: Apple Silicon (Asahi ALARM / Arch Linux ARM)

---

## Current State of Sleep on Asahi

- Sleep mode is **s2idle** (suspend-to-idle) only — the CPU freezes and hardware idles, but no deep platform sleep occurs
- **True S3 deep sleep is not yet implemented** — Apple Silicon bypasses PSCI (the standard ARM power interface), requiring custom drivers
- **Hibernation (S4 / suspend-to-disk) is not supported** — `CONFIG_HIBERNATION` is explicitly disabled in the Asahi kernel; no active development tracked
- Battery drain during sleep is roughly **~2%/hr**, vs near **0% on macOS**
- The Asahi team's current roadmap: reduce s2idle drain first, then potentially revisit deeper sleep states

---

## Optimisations You Can Apply Today

### 1. powertop — auto-tune power settings

```bash
sudo pacman -S powertop
sudo systemctl enable powertop   # applies tunings on every boot
```

You can also run it interactively to see what's drawing power:

```bash
sudo powertop
```

Navigate to the "Tunables" tab and toggle anything showing "Bad" to "Good". The systemd service automates this on boot.

### 2. TLP — comprehensive battery management

```bash
sudo pacman -S tlp
sudo systemctl enable --now tlp
```

TLP applies a wide range of power-saving settings automatically. For Apple Silicon you may want to review `/etc/tlp.conf` and ensure CPU governor settings aren't fighting Asahi's own power management.

Check status with:

```bash
sudo tlp-stat -s
```

### 3. CPU governor

Ensure the energy-efficient governor is active when on battery:

```bash
# Check current governor
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

# Set to powersave (TLP should handle this, but manual check is useful)
echo powersave | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
```

### 4. Prevent full battery drain during long sleeps (shutdown on critical battery)

Since hibernate isn't available, this is the safest fallback — shut down cleanly instead of dying mid-sleep.

Create `/etc/udev/rules.d/99-lowbat.rules`:

```
SUBSYSTEM=="power_supply", ATTR{status}=="Discharging", ATTR{capacity}=="[0-5]", RUN+="/usr/bin/systemctl poweroff"
```

Reload udev rules:

```bash
sudo udevadm control --reload-rules
```

Adjust the `[0-5]` range to taste (matches battery % 0–5).

### 5. Reduce wakeup sources

Check what's waking the machine unexpectedly:

```bash
cat /proc/interrupts
journalctl -b | grep "PM: suspend" 
```

Disable unnecessary wakeup sources:

```bash
# List wakeup-capable devices
grep -r . /sys/bus/usb/devices/*/power/wakeup 2>/dev/null

# Disable a specific one (example)
echo disabled | sudo tee /sys/bus/usb/devices/1-1/power/wakeup
```

### 6. NetworkManager — don't wake on network activity

```bash
# Check NM sleep settings
cat /etc/NetworkManager/conf.d/*.conf

# Create a sleep config if it doesn't exist
sudo tee /etc/NetworkManager/conf.d/sleep.conf <<EOF
[connection]
wifi.powersave = 3
EOF
```

WiFi powersave values: `2` = disable, `3` = enable (recommended for battery).

### 7. Systemd sleep configuration

Even without hibernate, you can configure what happens on lid close and idle:

`/etc/systemd/logind.conf`:

```ini
[Login]
HandleLidSwitch=suspend
HandleLidSwitchExternalPower=ignore   # don't sleep when plugged in
IdleAction=suspend
IdleActionSec=10min
```

`/etc/systemd/sleep.conf`:

```ini
[Sleep]
AllowSuspend=yes
AllowHibernation=no      # keep off until Asahi supports it
SuspendState=freeze mem  # s2idle first, mem if available
```

---

## Monitoring Sleep Quality

After waking, check how long you were asleep and what woke you:

```bash
# Time spent in sleep states
sudo pm-suspend 2>&1 | tail   # if pm-utils installed

# Systemd sleep journal
journalctl -b | grep -E "sleep|suspend|wake|resume"

# Battery level before/after (rough drain rate)
upower -i $(upower -e | grep battery)
```

---

## What to Watch For (Future Asahi Releases)

- **True deep sleep (S3-equivalent)** — being considered after s2idle drain is reduced
- **Hibernate** — no issues filed, no ETA; requires foundational Apple Silicon power management work first
- Follow: [Asahi Linux Progress Reports](https://asahilinux.org/blog/)

---

## References

- [Asahi Kernel Config Options](https://asahilinux.org/docs/sw/kernel-config/)
- [M1 Feature Support](https://asahilinux.org/docs/platform/feature-support/m1/)
- [Asahi sleep battery issue #252](https://github.com/AsahiLinux/asahi-installer/issues/252)
- [ArchWiki: Power management/Suspend and hibernate](https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate)
- [ArchWiki: TLP](https://wiki.archlinux.org/title/TLP)
- [ArchWiki: Powertop](https://wiki.archlinux.org/title/Powertop)
