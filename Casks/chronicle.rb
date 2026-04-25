cask "chronicle" do
  version "0.1.4"
  sha256 "8984a2fcecec94dc964feae62022aed98e8d49dbf1990197b0bb24fad6b06edf"

  url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/Chronicle-#{version}.pkg",
      verified: "github.com/josephyaduvanshi/claude-history-manager/"
  name "Chronicle"
  desc "Browser for your Claude Code session history"
  homepage "https://github.com/josephyaduvanshi/claude-history-manager"

  depends_on macos: ">= :sequoia"

  pkg "Chronicle-#{version}.pkg"

  # Expose the embedded `chronicle` CLI on PATH. The .app's
  # postinstall script strips quarantine on the bundle (and so on
  # the helper inside it), so this symlink works without any
  # additional Gatekeeper dance.
  binary "#{appdir}/Chronicle.app/Contents/Helpers/chronicle"

  uninstall pkgutil: "app.chronicle.Chronicle",
            delete:  "/Applications/Chronicle.app"

  zap trash: [
    "~/Library/Application Support/Chronicle",
    "~/Library/Mobile Documents/com~apple~CloudDocs/Chronicle",
    "~/Library/Preferences/app.chronicle.Chronicle.plist",
    "~/Library/Saved Application State/app.chronicle.Chronicle.savedState",
    "~/Library/Caches/app.chronicle.Chronicle",
    "~/Library/HTTPStorages/app.chronicle.Chronicle",
  ]
end
