#!/bin/bash
#
# Update the Homebrew formula SHA256 after creating a release
#
# Usage: ./scripts/update-formula-sha.sh v1.0.0
#

set -e

VERSION="${1:-}"

if [ -z "$VERSION" ]; then
    echo "Usage: $0 <version>"
    echo "Example: $0 v1.0.0"
    exit 1
fi

FORMULA="Formula/bamboo-switch.rb"
DOWNLOAD_URL="https://github.com/c0ryd/bamboo-switch/releases/download/${VERSION}/bamboo-switch"

echo "Downloading release to calculate SHA256..."
SHA256=$(curl -sL "$DOWNLOAD_URL" | shasum -a 256 | cut -d' ' -f1)

if [ -z "$SHA256" ] || [ "$SHA256" = "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" ]; then
    echo "Error: Could not download release or file is empty"
    echo "Make sure the release exists at: $DOWNLOAD_URL"
    exit 1
fi

echo "SHA256: $SHA256"
echo ""
echo "Updating formula..."

# Update URL version
sed -i '' "s|releases/download/v[^/]*/bamboo-switch|releases/download/${VERSION}/bamboo-switch|g" "$FORMULA"

# Update SHA256
sed -i '' "s/sha256 \".*\"/sha256 \"${SHA256}\"/" "$FORMULA"

echo "Done! Updated $FORMULA"
echo ""
echo "Don't forget to:"
echo "  1. Commit and push the formula update"
echo "  2. Update the homebrew-bamboo-switch tap repo if separate"
