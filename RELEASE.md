# Release Process

## Repository Structure

This project is split into two repositories:

| Repository | Visibility | Purpose |
|------------|------------|---------|
| `bamboo-switch` | Public | Free CLI tool (this repo) |
| `bamboo-switch-app` | Private | Paid menu bar app (Gumroad) |
| `homebrew-bamboo-switch` | Public | Homebrew tap |

---

## CLI Release (This Repo)

### 1. Tag a Release

```bash
git tag v1.0.0
git push origin v1.0.0
```

GitHub Actions will automatically:
- Create a release
- Attach the `bamboo-switch` script
- Calculate and display the SHA256

### 2. Update Homebrew Formula

After the release is created:

```bash
./scripts/update-formula-sha.sh v1.0.0
git add Formula/bamboo-switch.rb
git commit -m "Update formula for v1.0.0"
git push
```

### 3. Update Homebrew Tap

Copy the updated formula to your `homebrew-bamboo-switch` repo:

```bash
cp Formula/bamboo-switch.rb ../homebrew-bamboo-switch/
cd ../homebrew-bamboo-switch
git add bamboo-switch.rb
git commit -m "Update to v1.0.0"
git push
```

---

## App Release (Private Repo)

### 1. Build the App

```bash
cd bamboo-switch-app
./build.sh
```

### 2. Package for Gumroad

```bash
cd dist
zip -r "Bamboo-Switch-v1.0.0.zip" "Bamboo Switch.app" ../README.txt ../install-autostart.sh
```

### 3. Upload to Gumroad

1. Go to your Gumroad dashboard
2. Update the product with the new ZIP
3. Update version notes if needed

---

## Setting Up the Homebrew Tap

Create a new public repo called `homebrew-bamboo-switch`:

```bash
mkdir homebrew-bamboo-switch
cd homebrew-bamboo-switch
git init
cp ../bamboo-switch/Formula/bamboo-switch.rb .
git add bamboo-switch.rb
git commit -m "Initial formula"
git remote add origin git@github.com:c0ryd/homebrew-bamboo-switch.git
git push -u origin main
```

Users can then install with:
```bash
brew tap c0ryd/bamboo-switch
brew install bamboo-switch
```

---

## Future: Submit to homebrew-core

Once you have enough users/stars, consider submitting to homebrew-core:

1. Fork https://github.com/Homebrew/homebrew-core
2. Add your formula to `Formula/b/bamboo-switch.rb`
3. Run `brew audit --new bamboo-switch`
4. Submit a PR

Requirements for homebrew-core:
- 30+ GitHub stars (or notable/useful tool)
- Stable release history
- Working formula with tests
