# Linux-only formula. macOS users get the same `chronicle`
# binary via the cask (it's symlinked from inside Chronicle.app).
class Chronicle < Formula
  desc "Browser for your Claude Code session history (CLI)"
  homepage "https://github.com/josephyaduvanshi/claude-history-manager"
  license "MIT"
  version "0.2.3"

  depends_on :linux

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/chronicle-#{version}-linux-aarch64.tar.gz"
      sha256 "4a68c74457aa4036a5b636439dc35051c9ca7fc8b74347ec6e800f510cbdb4f6"
    else
      url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/chronicle-#{version}-linux-x86_64.tar.gz"
      sha256 "4d6622c1a5f9ba2337ee4c149aad845d5e593bbb3d7463abd8f0cbc59fc563a4"
    end
  end

  def install
    bin.install "chronicle"
  end

  test do
    assert_match "chronicle 0.2.3", shell_output("#{bin}/chronicle --version")
  end
end
