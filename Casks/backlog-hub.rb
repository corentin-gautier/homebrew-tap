cask "backlog-hub" do
  arch arm: "arm64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "7ea27a047e93f327656253e47c6b8de2e0549ef3441b2c0ee005dccad127fcd1",
         intel: "81397413130d964e877d4d8f33ae0f7d806ca9940b24c5247b84d4dcaeaaa1ef"

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
