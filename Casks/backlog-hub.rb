cask "backlog-hub" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "51194520dcb07e2ed7e393c4f37d8bebf125c209e1c04282c8e5bcd5a9d38091",
         intel: "5cec9a93ee00c489ab7f279875f8b5d2346a29c76cfbc51cd4071425854fb809"

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
