# bambu-switch

A profile manager for Bambu Studio on macOS — available as both a **menu bar app** and a **command-line tool**.

**Problem:** Bambu Lab doesn't support sharing devices between accounts or switching accounts easily. If you have printers on different accounts (e.g., home and work), you need to log out and back in with 2FA every time you switch.

**Solution:** `bambu-switch` manages multiple Bambu Studio configuration profiles via symlinks. Each profile maintains its own login session, so you only need to authenticate once per profile.

![Menu Bar Screenshot](docs/screenshot.png)

## Features

- 🖱️ **Menu bar app** — Click to switch profiles, no terminal needed
- ⌨️ **CLI tool** — For power users and automation
- 🔄 **Auto quit/launch** — Optionally closes and reopens BambuStudio when switching
- 🚀 **Auto-start on login** — Always available in your menu bar
- 📁 **Unlimited profiles** — Home, work, clients, whatever you need

---

## Installation

### Menu Bar App (Recommended)

#### Download Release (easiest)

Download the latest `.app` from [Releases](https://github.com/yourusername/bambu-switch/releases) and drag to `/Applications`.

#### Build from Source

```bash
# Clone the repo
git clone https://github.com/yourusername/bambu-switch.git
cd bambu-switch/app

# Build the app
./build.sh

# Copy to Applications
cp -r "dist/Bambu Switch.app" /Applications/

# Optional: Enable auto-start on login
./install-autostart.sh
```

### Command-Line Tool

```bash
# Clone the repo
git clone https://github.com/yourusername/bambu-switch.git
cd bambu-switch

# Install to /usr/local/bin (or ~/bin)
sudo cp bambu-switch /usr/local/bin/
# OR
mkdir -p ~/bin && cp bambu-switch ~/bin/

# Make sure ~/bin is in your PATH (add to ~/.zshrc if needed)
export PATH="$HOME/bin:$PATH"
```

---

## Quick Start

### First-Time Setup

If you have an existing BambuStudio installation, run the CLI to set up profiles:

```bash
bambu-switch init
```

This migrates your existing config to a profile called "default".

### Using the Menu Bar App

1. Click the Bambu Switch icon in your menu bar
2. Select a profile to switch to
3. If BambuStudio is running, you'll be prompted to close it
4. After switching, optionally launch BambuStudio

### Using the CLI

```bash
# Create profiles
bambu-switch create work
bambu-switch create home

# Switch between profiles (quit BambuStudio first!)
bambu-switch work      # Switch to work profile
bambu-switch home      # Switch back to home

# List all profiles
bambu-switch list
```

---

## CLI Usage

```
bambu-switch <command> [arguments]

Commands:
  <profile>           Switch to the specified profile
  list                List all available profiles
  create <name>       Create a new profile
  delete <name>       Delete a profile (with confirmation)
  status              Show current active profile
  init [name]         Initialize (migrate existing config to profile)
  help                Show help message
```

## How It Works

Bambu Studio stores its configuration in:
```
~/Library/Application Support/BambuStudio/
```

`bambu-switch` converts this directory into a symlink that points to profile-specific directories:
```
~/Library/Application Support/BambuStudio -> BambuStudio-home
~/Library/Application Support/BambuStudio-home/
~/Library/Application Support/BambuStudio-work/
~/Library/Application Support/BambuStudio-office/
```

When you switch profiles, the symlink is updated to point to the selected profile's directory. Each profile maintains its own login credentials, printer settings, and preferences.

## Workflow

1. **Quit BambuStudio** (required before switching)
2. Run `bambu-switch <profile-name>`
3. **Launch BambuStudio** - you'll be logged into that profile's account

The first time you use a new profile, you'll need to log in. After that, the session is remembered.

## Limitations

- **macOS only** - Uses macOS-specific paths
- **Must quit BambuStudio** before switching profiles
- **Doesn't run multiple instances simultaneously** with different accounts (the app itself prevents this)

## Why This Exists

Bambu Lab's ecosystem doesn't support:
- Sharing printers between accounts
- Multiple account logins in Bambu Studio
- Easy account switching

This is frustrating when you have printers at home and work on different accounts, especially with mandatory 2FA. This tool makes switching accounts a 2-second terminal command instead of a multi-step re-authentication flow.

## Contributing

Issues and PRs welcome!

## License

MIT
