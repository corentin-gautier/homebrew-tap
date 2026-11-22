cask "backlog-hub" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "a8bea99b4efb71fff4c718a47146960c8eccefc43f2cb1f45068b6a77df4fe31",
         intel: "c3fb35af6be5c2a3b82945d8c17c5d5167f417978fbc96d2d1dc3b444eeac3cf"

  url "https://github.com/corentin-gautier/backlog-hub/releases/download/v#{version}/Backlog-Hub-#{version}-#{arch}.dmg"
  name "Backlog Hub"
  desc "Home page for every Backlog.md board, with Claude Code beside each one"
  homepage "https://corentingautier.dev/backlog-hub/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Backlog Hub.app"

  uninstall quit:       "dev.corentingautier.backloghub",
            login_item: "Backlog Hub"

  zap trash: [
    "~/Library/Application Support/backlog-hub",
    "~/Library/Application Support/Backlogs",
    "~/Library/Logs/backlog-hub",
    "~/Library/Preferences/dev.corentingautier.backloghub.plist",
  ]

  caveats <<~EOS
    For the Claude Code panel, install the claude CLI and sign in once:
      brew install --cask claude-code
  EOS
end
