# Linux-only formula. macOS users get the same `chronicle`
# binary via the cask (it's symlinked from inside Chronicle.app).
class Chronicle < Formula
  desc "Browser for your Claude Code session history (CLI)"
  homepage "https://github.com/josephyaduvanshi/claude-history-manager"
  license "MIT"
  version "0.2.0"

  depends_on :linux

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/chronicle-#{version}-linux-aarch64.tar.gz"
      sha256 "c4efd9d7aefad4d43e65ce17bc4db32c552c85ebb1fec081cfb3dfa17dfd1e43"
    else
      url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/chronicle-#{version}-linux-x86_64.tar.gz"
      sha256 "ea269c2dee9109ea26886061dca3e59b93236ef58584ea049996aaee91ebd3f6"
    end
  end

  def install
    bin.install "chronicle"
  end

  test do
    assert_match "chronicle 0.2.0", shell_output("#{bin}/chronicle --version")
  end
end
