# bamboo-switch

A command-line profile manager for Bambu Studio on macOS.

> **Note:** This tool is not affiliated with Bambu Lab. It simply helps manage Bambu Studio profiles.

**Problem:** Bambu Lab doesn't support sharing devices between accounts or switching accounts easily. If you have printers on different accounts (e.g., home and work), you need to log out and back in with 2FA every time you switch.

**Solution:** `bamboo-switch` manages multiple Bambu Studio configuration profiles via symlinks. Each profile maintains its own login session, so you only need to authenticate once per profile.

---

## Want a Menu Bar App?

Skip the terminal with **Bamboo Switch for Menu Bar** — click to switch profiles, auto-quit/launch BambuStudio, and more.

**[Get it on Gumroad →](https://corydawson8.gumroad.com/l/qmriaz)**

---

## Installation

### Homebrew (Recommended)

```bash
brew tap c0ryd/bamboo-switch
brew install bamboo-switch
```

### Manual Installation

```bash
# Download
curl -LO https://github.com/c0ryd/bamboo-switch/releases/latest/download/bamboo-switch

# Install
chmod +x bamboo-switch
sudo mv bamboo-switch /usr/local/bin/

# Or install to ~/bin (no sudo required)
mkdir -p ~/bin && mv bamboo-switch ~/bin/
export PATH="$HOME/bin:$PATH"  # Add to ~/.zshrc
```

---

## Quick Start

### First-Time Setup

```bash
bamboo-switch init
```

This migrates your existing BambuStudio config to a profile called "default".

### Create Profiles

```bash
bamboo-switch create home
bamboo-switch create work
```

### Switch Profiles

```bash
bamboo-switch work    # Switch to work profile
bamboo-switch home    # Switch back to home
```

BambuStudio will automatically quit (if running) and relaunch with the selected profile.

---

## CLI Usage

```
bamboo-switch <command> [arguments]

Commands:
  <profile>           Switch to the specified profile
  list                List all available profiles
  create <name>       Create a new profile
  delete <name>       Delete a profile (with confirmation)
  status              Show current active profile
  init [name]         Initialize (migrate existing config to profile)
  help                Show help message
```

---

## How It Works

Bambu Studio stores its configuration in:
```
~/Library/Application Support/BambuStudio/
```

`bamboo-switch` converts this directory into a symlink that points to profile-specific directories:
```
~/Library/Application Support/BambuStudio -> BambuStudio-home
~/Library/Application Support/BambuStudio-home/
~/Library/Application Support/BambuStudio-work/
```

When you switch profiles, the symlink is updated. Each profile maintains its own login credentials, printer settings, and preferences.

---

## Limitations

- **macOS only** — Uses macOS-specific paths
- **Must quit BambuStudio** before switching (handled automatically by the CLI)
- **Single instance** — Can't run multiple BambuStudio instances with different accounts simultaneously

---

## License

MIT
