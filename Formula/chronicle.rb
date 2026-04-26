# Linux-only formula. macOS users get the same `chronicle`
# binary via the cask (it's symlinked from inside Chronicle.app).
class Chronicle < Formula
  desc "Browser for your Claude Code session history (CLI)"
  homepage "https://github.com/josephyaduvanshi/claude-history-manager"
  license "MIT"
  version "0.3.0"

  depends_on :linux

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/chronicle-#{version}-linux-aarch64.tar.gz"
      sha256 "ed1f227bb9fabf39842d989c9c297b2fd9361845001b99bb2ba781214d808f2f"
    else
      url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/chronicle-#{version}-linux-x86_64.tar.gz"
      sha256 "7c43c2aca644b7c3a06133018b2ee3a83d11ba2eb2fa7cae6f58ba329a8c9bdb"
    end
  end

  def install
    bin.install "chronicle"
  end

  test do
    assert_match "chronicle 0.3.0", shell_output("#{bin}/chronicle --version")
  end
end
