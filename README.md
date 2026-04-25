# josephyaduvanshi/chronicle

Homebrew tap for [Chronicle](https://github.com/josephyaduvanshi/claude-history-manager), a native macOS browser for your Claude Code session history.

## Install

```bash
brew tap josephyaduvanshi/chronicle
brew install --cask chronicle
```

That's it. The cask installs `Chronicle.app` to `/Applications/`. macOS Gatekeeper will prompt on first launch because the app is ad-hoc signed (no Apple Developer ID); right-click the app and choose Open the first time, or run:

```bash
xattr -cr /Applications/Chronicle.app
```

## Update

```bash
brew update
brew upgrade --cask chronicle
```

## Uninstall

```bash
brew uninstall --cask chronicle
brew untap josephyaduvanshi/chronicle
```

The uninstall removes the app. To wipe local data too (sessions index, preferences, sync file):

```bash
brew uninstall --cask --zap chronicle
```

## Why a separate tap?

The official `homebrew/cask` repo requires apps to be signed and notarized with an Apple Developer ID, plus a minimum number of stars/forks. Chronicle is a one-developer project shipping ad-hoc signed builds for now, so it lives here instead.

If notarization and notability ever land, this tap may move into `homebrew/cask`.

## Links

- [Chronicle source](https://github.com/josephyaduvanshi/claude-history-manager)
- [Releases](https://github.com/josephyaduvanshi/claude-history-manager/releases)
- [Issues](https://github.com/josephyaduvanshi/claude-history-manager/issues)

## License

This tap is MIT-licensed. The Cask formula is under the same license as Homebrew. See [Chronicle's LICENSE](https://github.com/josephyaduvanshi/claude-history-manager/blob/main/LICENSE) for the app itself.
