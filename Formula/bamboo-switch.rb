# typed: false
# frozen_string_literal: true

class BambooSwitch < Formula
  desc "Profile manager for Bambu Studio on macOS"
  homepage "https://github.com/c0ryd/bamboo-switch"
  url "https://github.com/c0ryd/bamboo-switch/releases/download/v1.0.0/bamboo-switch"
  sha256 "0c074c78796f27a4bc7eba5db2c6f4f8e666ce48359712b5843d71e42aa116ed"
  license "MIT"

  def install
    bin.install "bamboo-switch"
  end

  test do
    assert_match "bamboo-switch", shell_output("#{bin}/bamboo-switch help")
  end
end
