# typed: strict
# frozen_string_literal: true

cask "gobbler" do
  version "0.2.3"
  sha256 "d9e6417af84614e067d929e261201402fdc6a2e00bd3ef7ac32ba4de508e0f26"

  url "https://github.com/OrchisLabs/gobbler-releases/releases/download/desktop-v#{version}/Gobbler-#{version}-universal.dmg",
      verified: "github.com/OrchisLabs/gobbler-releases/"
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
