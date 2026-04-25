# Linux-only formula. macOS users get the same `chronicle`
# binary via the cask (it's symlinked from inside Chronicle.app).
class Chronicle < Formula
  desc "Browser for your Claude Code session history (CLI)"
  homepage "https://github.com/josephyaduvanshi/claude-history-manager"
  license "MIT"
  version "0.1.6"

  depends_on :linux

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/chronicle-#{version}-linux-aarch64.tar.gz"
      sha256 "f464de919ffeb65503cb1a22451d1276fc704c0d99799d24077c4762d6a0ea2b"
    else
      url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/chronicle-#{version}-linux-x86_64.tar.gz"
      sha256 "d4fc4100c4fac47b751879146236e80050f1fb24d81e6c979c3e2d86140ec758"
    end
  end

  def install
    bin.install "chronicle"
  end

  test do
    assert_match "chronicle 0.1.6", shell_output("#{bin}/chronicle --version")
  end
end
