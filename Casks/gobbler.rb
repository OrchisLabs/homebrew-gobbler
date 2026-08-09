# typed: strict
# frozen_string_literal: true

cask "gobbler" do
  version "0.1.3"
  sha256 "e0a4767ecc2116f64122d598ea04d5a3b28eb9dc03da02ff87314a6ffdf0205a"

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
