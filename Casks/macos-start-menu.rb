cask "macos-start-menu" do
  version "1.7.1"
  sha256 "9d8e5962ea79edec5e4c8b03af75d72bb19e026d7f7e8a1d5a0d88660a157369"

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

  # The app isn't notarized: without this, macOS refuses the first launch
  # until "Open Anyway" is clicked in Privacy & Security.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Start Menu.app"],
        writable_paths: ["Start Menu.app"],
        writable_base:  :appdir
  end

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
