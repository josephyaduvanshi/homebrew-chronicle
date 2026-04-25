# Linux-only formula. macOS users get the same `chronicle`
# binary via the cask (it's symlinked from inside Chronicle.app).
class Chronicle < Formula
  desc "Browser for your Claude Code session history (CLI)"
  homepage "https://github.com/josephyaduvanshi/claude-history-manager"
  license "MIT"
  version "0.1.4"

  depends_on :linux

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/chronicle-#{version}-linux-aarch64.tar.gz"
      sha256 "f0a83dd5b9977438d7e6fde5e52e9a9cf7a0bf4d63379444ebdaa597fb22dcba"
    else
      url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/chronicle-#{version}-linux-x86_64.tar.gz"
      sha256 "26bb9ce613352605d282889617d087ab05dea0c62dbacb3509457add26cdc232"
    end
  end

  def install
    bin.install "chronicle"
  end

  test do
    assert_match "chronicle 0.1.4", shell_output("#{bin}/chronicle --version")
  end
end
