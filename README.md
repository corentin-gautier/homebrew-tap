# Homebrew tap

Homebrew 7 asks you to trust third-party taps, hence the `brew trust` step.

```sh
brew tap corentin-gautier/tap
brew trust --cask corentin-gautier/tap/macos-start-menu
brew install --cask corentin-gautier/tap/macos-start-menu
```

Replace `macos-start-menu` with the cask you want.

| Cask | App |
| --- | --- |
| `macos-start-menu` | [macOS Start Menu](https://corentingautier.dev/macos-start-menu/): a Start menu for macOS, opened by tapping ⌘ |
| `backlog-hub` | [Backlog Hub](https://corentingautier.dev/backlog-hub/): every Backlog.md board on one page, with Claude Code beside each one |
