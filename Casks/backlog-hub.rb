cask "backlog-hub" do
  arch arm: "arm64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "cfba21a636ce4abafb8e1c02d4387389634a8e506430edebfe99dafc8ff4efb8",
         intel: "e99f3bb3b5aab8d440cd075344617bb5dc528cbd4a005ae7ed3421e312432d90"

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
