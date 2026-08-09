# typed: strict
# frozen_string_literal: true

cask "gobbler" do
  version "0.1.3"
  sha256 "f2cda00f5662c543b4ba0e02effd004d5bc34ad927bf90acb1e87e9216d68825"

  url "https://github.com/OrchisLabs/gobbler-releases/releases/download/desktop-v#{version}/Gobbler-#{version}-universal.dmg"
  name "Gobbler"
  desc "Focused desktop client for Gobbler"
  homepage "https://gobbler.org/apps"

  depends_on macos: :monterey

  app "Gobbler.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Gobbler.app"]
  end

  zap trash: [
    "~/Library/Application Support/Gobbler",
    "~/Library/Caches/org.orchislabs.gobbler",
    "~/Library/Preferences/org.orchislabs.gobbler.plist",
    "~/Library/Saved Application State/org.orchislabs.gobbler.savedState",
  ]

  caveats <<~EOS
    Gobbler for Mac is currently an unsigned preview.
    Install with --no-quarantine so the preview can launch:
      brew install --cask --no-quarantine orchislabs/gobbler/gobbler
    Review the public release before use.
  EOS
end
