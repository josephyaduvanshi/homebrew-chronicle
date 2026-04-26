cask "chronicle" do
  version "0.2.0"
  sha256 "c2ed567fbce12b42f53a24e3600dab479f590f06f02242c77946881ede45ecd5"

  url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/Chronicle-#{version}.zip",
      verified: "github.com/josephyaduvanshi/claude-history-manager/"
  name "Chronicle"
  desc "Browser for your Claude Code session history"
  homepage "https://github.com/josephyaduvanshi/claude-history-manager"

  depends_on macos: ">= :sequoia"

  app "Chronicle.app"
  binary "#{appdir}/Chronicle.app/Contents/Helpers/chronicle"

  postflight do
    # Strip the Gatekeeper quarantine attribute. The .app ships
    # ad-hoc signed (no Apple Developer ID); without this users
    # see the "Apple could not verify" dialog on first launch.
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Chronicle.app"],
                   sudo: false
  end

  uninstall quit:   "app.chronicle.Chronicle",
            delete: "#{appdir}/Chronicle.app"

  zap trash: [
    "~/Library/Application Support/Chronicle",
    "~/Library/Mobile Documents/com~apple~CloudDocs/Chronicle",
    "~/Library/Preferences/app.chronicle.Chronicle.plist",
    "~/Library/Saved Application State/app.chronicle.Chronicle.savedState",
    "~/Library/Caches/app.chronicle.Chronicle",
    "~/Library/HTTPStorages/app.chronicle.Chronicle",
  ]
end
