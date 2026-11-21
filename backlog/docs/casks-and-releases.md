---
id: doc-2
title: "Casks and releases"
type: guide
---

## Install

- Homebrew 7 asks to trust third-party taps: `brew tap`, then `brew trust --cask`, then `brew install --cask` (exact commands: the root README).

## `macos-start-menu`

| Field | Value |
| --- | --- |
| App | macOS Start Menu (`Start Menu.app`), a Start menu opened by tapping ⌘ |
| Download | `Start-Menu.zip` from the GitHub release `v<version>` of `corentin-gautier/macos-start-menu` |
| Livecheck | Latest GitHub release |
| Requires | Apple silicon (`arm64`), macOS Tahoe |
| Uninstall | Quits `local.mac-start-menu`, removes the "Start Menu" login item |
| Zap | Caches, HTTPStorages and preferences plist of `local.mac-start-menu` |
| Caveat | Asks for Accessibility on first launch, to notice the ⌘ key |

- No quarantine removal: the app is notarized.

## Releasing a new version

Not done by hand here. The app's `scripts/release.sh` (in `~/Projects/mac-start-menu`):

1. Builds and publishes the GitHub release with the zip.
2. Rewrites `version` and `sha256` in `Casks/macos-start-menu.rb` (tap path from `$TAP_DIR`, default `~/Projects/homebrew-tap`, cloned if missing).
3. Commits "macos-start-menu <version>" in the tap and pushes.

Other cask changes (requirements, uninstall, caveats) are edited by hand.
