# Linux-only formula. macOS users get the same `chronicle`
# binary via the cask (it's symlinked from inside Chronicle.app).
class Chronicle < Formula
  desc "Browser for your Claude Code session history (CLI)"
  homepage "https://github.com/josephyaduvanshi/claude-history-manager"
  license "MIT"
  version "0.1.5"

  depends_on :linux

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/chronicle-#{version}-linux-aarch64.tar.gz"
      sha256 "31a3054b9de09690ff3ca46caa868b54c67094742058eb79ff92ff55f58ece7a"
    else
      url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/chronicle-#{version}-linux-x86_64.tar.gz"
      sha256 "c3e554329a0f1c6bfecdb1b8d7ba925dd65c92293be9747dee6d870e4f81aa4e"
    end
  end

  def install
    bin.install "chronicle"
  end

  test do
    assert_match "chronicle 0.1.5", shell_output("#{bin}/chronicle --version")
  end
end
