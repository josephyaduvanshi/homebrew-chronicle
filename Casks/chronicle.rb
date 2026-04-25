cask "chronicle" do
  version "0.1.3"
  sha256 "13a2474d8b56d0e5e51f2c7f0e3bd24964a4bdb0e2b1ba82d5e64ad71de068ba"

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
