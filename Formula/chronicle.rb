# Linux-only formula. macOS users get the same `chronicle`
# binary via the cask (it's symlinked from inside Chronicle.app).
class Chronicle < Formula
  desc "Browser for your Claude Code session history (CLI)"
  homepage "https://github.com/josephyaduvanshi/claude-history-manager"
  license "MIT"
  version "0.2.1"

  depends_on :linux

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/chronicle-#{version}-linux-aarch64.tar.gz"
      sha256 "6c2b1e62ee364cd9b5b9bc76dc3845a100255e531ff73112c82cc807900eb334"
    else
      url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/chronicle-#{version}-linux-x86_64.tar.gz"
      sha256 "0615239c79ae6b1e142c678391930a0b916c6ea7b12428f911d0873b8fca7eda"
    end
  end

  def install
    bin.install "chronicle"
  end

  test do
    assert_match "chronicle 0.2.1", shell_output("#{bin}/chronicle --version")
  end
end
