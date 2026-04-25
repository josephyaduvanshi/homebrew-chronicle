cask "chronicle" do
  version "0.1.3"
  sha256 "b65f62ef28d710e64443f5676397bac68ae6a0357355d2d1d7693da4d59dfc22"

  url "https://github.com/josephyaduvanshi/claude-history-manager/releases/download/v#{version}/Chronicle-#{version}.pkg"
  name "Chronicle"
  desc "Browser for your Claude Code session history"
  homepage "https://github.com/josephyaduvanshi/claude-history-manager"

  depends_on macos: ">= :sequoia"

  pkg "Chronicle-#{version}.pkg"

  uninstall pkgutil: "app.chronicle.Chronicle",
            delete:  "/Applications/Chronicle.app"

  zap trash: [
    "~/Library/Application Support/Chronicle",
    "~/Library/Mobile Documents/com~apple~CloudDocs/Chronicle",
    "~/Library/Preferences/app.chronicle.Chronicle.plist",
  ]
end
