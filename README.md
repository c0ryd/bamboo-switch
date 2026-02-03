# bambu-switch

A simple profile manager for Bambu Studio on macOS.

**Problem:** Bambu Lab doesn't support sharing devices between accounts or switching accounts easily. If you have printers on different accounts (e.g., home and work), you need to log out and back in with 2FA every time you switch.

**Solution:** `bambu-switch` manages multiple Bambu Studio configuration profiles via symlinks. Each profile maintains its own login session, so you only need to authenticate once per profile.

## Installation

### Option 1: Homebrew (coming soon)

```bash
brew install bambu-switch
```

### Option 2: Manual Installation

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

## Quick Start

```bash
# First-time setup - migrates your existing config to a profile
bambu-switch init

# Create additional profiles
bambu-switch create work
bambu-switch create office

# Switch between profiles (quit BambuStudio first!)
bambu-switch work      # Switch to work profile
bambu-switch home      # Switch back to home
```

## Usage

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
