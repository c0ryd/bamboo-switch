# typed: false
# frozen_string_literal: true

class BambooSwitch < Formula
  desc "Profile manager for Bambu Studio on macOS"
  homepage "https://github.com/c0ryd/bamboo-switch"
  url "https://github.com/c0ryd/bamboo-switch/releases/download/v1.0.0/bamboo-switch"
  sha256 "PLACEHOLDER_SHA256"
  license "MIT"

  def install
    bin.install "bamboo-switch"
  end

  test do
    assert_match "bamboo-switch", shell_output("#{bin}/bamboo-switch help")
  end
end
