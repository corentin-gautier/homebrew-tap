cask "backlog-hub" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "ba610fd056bab95cc19ac2c596b88662f04b6a484a05cd5fd592a7827ef5f423",
         intel: "a3c7f0ddd500d6a6a4dbd9fa65bd69cee056b0c99fbb6ea187ccb5e4721ff55a"

  url "https://github.com/corentin-gautier/backlog-hub/releases/download/v#{version}/Backlog-Hub-#{version}-#{arch}.dmg"
  name "Backlog Hub"
  desc "Home page for every Backlog.md board, with Claude Code beside each one"
  homepage "https://corentingautier.dev/backlog-hub/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

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
