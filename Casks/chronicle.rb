cask "chronicle" do
  version "0.1.0"
  sha256 "71d88fbd75bb6bc78c2e3accf6c1a32466631cec8f68c54f7ed7605d4449d134"

  url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/Chronicle-#{version}.dmg"
  name "Chronicle"
  desc "Browser for your Claude Code session history"
  homepage "https://github.com/josephyaduvanshi/claude-history-manager"

  depends_on macos: ">= :sequoia"

  app "Chronicle.app"

  zap trash: [
    "~/Library/Application Support/Chronicle",
    "~/Library/Mobile Documents/com~apple~CloudDocs/Chronicle",
    "~/Library/Preferences/app.chronicle.Chronicle.plist",
  ]
end
