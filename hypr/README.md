# Hyprland Configuration

A modular and professional Hyprland configuration with clean organization and reduced code repetition.

## Format

Since Hyprland 0.55, the compositor's own config (`hyprland.conf`) moved to
**Lua** (`hyprland.lua`). Other `hypr*` tools (hypridle, hyprlock, hyprpaper)
have **not** moved and still use the old hyprlang syntax, so this repo mixes
both formats — see the entry points below.

Splitting is done with Lua's `require()`: a dotted path maps to a
subdirectory relative to `hyprland.lua`, e.g. `require("config.appearance")`
loads `config/appearance.lua`.

## Structure

### Entry points

- `hyprland.lua` - main Hyprland config, requires everything below
- `hyprrules.lua` - imports all window/layer rule modules
- `monitors.lua` - display configuration
- `hypridle.conf` - idle management (hyprlang, unconverted)
- `hyprlock.conf` - screen lock configuration (hyprlang, unconverted)
- `hyprpaper.conf` - wallpaper daemon (hyprlang, unconverted)

### Core Configuration (`config/`)

- `variables.lua` - global variables/constants used by `hyprland.lua`
- `variables.conf` - **hyprlang** copy of the same constants, kept only
  because `hypridle.conf`/`hyprlock.conf` still `source` it. Update both
  files together when changing a shared value.
- `environment.lua` - environment variables
- `border.lua` - color definitions and border styling (wallust compatible)
- `autostart.lua` - startup applications
- `appearance.lua` - visual styling and effects
- `animations.lua` - animation settings
- `layouts.lua` - window layout configurations
- `input.lua` - keyboard, mouse, and touchpad settings
- `plugins.lua` - third-party plugin configurations
- `hyprswitch.css` - styling for the `hyprswitch` window switcher

### Keybindings (`keybinds/`)

- `applications.lua` - application launchers and utilities
- `windows.lua` - window management
- `workspaces.lua` - workspace navigation and management
- `media.lua` - media controls, screenshots, and system bindings

### Window Rules (`rules/`)

- `general.lua` - basic window behavior and system fixes
- `floating.lua` - applications that should float by default
- `dialogs.lua` - modal dialogs and file choosers
- `media.lua` - picture-in-picture and media applications
- `opacity.lua` - transparency settings for applications
- `layers.lua` - layer-specific visual effects and behavior

## Customization

Edit `config/variables.lua` to customize:

- Applications and paths
- Theme colors and fonts
- Layout settings
- Animation timing

If you change a value also used by hypridle/hyprlock (fonts, timeouts),
update `config/variables.conf` as well until those tools get their own Lua
configs.
