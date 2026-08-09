cask "gobbler" do
  version "0.1.0"
  sha256 "e8ccf554fc9ea9ce83b3ac9458eddc011bf3efa3367a752f798f64e655af2478"

  url "https://github.com/OrchisLabs/gobbler-releases/releases/download/desktop-v#{version}/Gobbler-#{version}-universal.dmg"
  name "Gobbler"
  desc "Focused desktop client for Gobbler"
  homepage "https://gobbler.org/apps"

  depends_on macos: :monterey

  app "Gobbler.app"

  zap trash: [
    "~/Library/Application Support/Gobbler",
    "~/Library/Caches/org.orchislabs.gobbler",
    "~/Library/Preferences/org.orchislabs.gobbler.plist",
    "~/Library/Saved Application State/org.orchislabs.gobbler.savedState",
  ]

  caveats <<~EOS
    Gobbler for Mac is currently an unsigned preview.
    Install it with Homebrew's --no-quarantine option:
      brew install --cask --no-quarantine orchislabs/gobbler/gobbler
  EOS
end
