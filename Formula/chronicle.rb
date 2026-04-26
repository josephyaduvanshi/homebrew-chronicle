# Linux-only formula. macOS users get the same `chronicle`
# binary via the cask (it's symlinked from inside Chronicle.app).
class Chronicle < Formula
  desc "Browser for your Claude Code session history (CLI)"
  homepage "https://github.com/josephyaduvanshi/claude-history-manager"
  license "MIT"
  version "0.2.2"

  depends_on :linux

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/chronicle-#{version}-linux-aarch64.tar.gz"
      sha256 "abf5e1de7aa90ca46b125eefeee11a28d6f7791f4f48cf0c695a87bcbc8beaa5"
    else
      url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/chronicle-#{version}-linux-x86_64.tar.gz"
      sha256 "62889a7799997812b4ebe18b3cfb3b2793d4cef0bfd202e7b77769e27cb2e745"
    end
  end

  def install
    bin.install "chronicle"
  end

  test do
    assert_match "chronicle 0.2.2", shell_output("#{bin}/chronicle --version")
  end
end
