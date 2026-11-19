cask "macos-start-menu" do
  version "1.9"
  sha256 "e546e9448defa495d49a2f68c3b6c1e8a1e2d1831f26bb87271363a2190c95ab"

  url "https://github.com/corentin-gautier/macos-start-menu/releases/download/v#{version}/Start-Menu.zip"
  name "macOS Start Menu"
  desc "Windows-style Start menu opened by tapping the Command key"
  homepage "https://corentingautier.dev/macos-start-menu/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Start Menu.app"

  uninstall quit:       "local.mac-start-menu",
            login_item: "Start Menu"

  zap trash: [
    "~/Library/Caches/local.mac-start-menu",
    "~/Library/HTTPStorages/local.mac-start-menu",
    "~/Library/Preferences/local.mac-start-menu.plist",
  ]

  caveats <<~EOS
    On first launch, Start Menu asks for the Accessibility permission
    (System Settings › Privacy & Security › Accessibility) so it can notice
    the ⌘ key. Then tap ⌘ on its own to open the menu.
  EOS
end
