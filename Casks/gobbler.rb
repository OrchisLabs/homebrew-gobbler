# typed: strict
# frozen_string_literal: true

cask "gobbler" do
  version "0.1.1"
  sha256 "4dc6e5a37591dd819e6efbe0cc31a2596f1275fcd46215f85833b0589a6d988a"

  url "https://github.com/OrchisLabs/gobbler-releases/releases/download/desktop-v#{version}/Gobbler-#{version}-universal.dmg"
  name "Gobbler"
  desc "Focused desktop client for Gobbler"
  homepage "https://gobbler.org/apps"

  depends_on macos: :monterey

  app "Gobbler.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Gobbler.app"]
  end

  zap trash: [
    "~/Library/Application Support/Gobbler",
    "~/Library/Caches/org.orchislabs.gobbler",
    "~/Library/Preferences/org.orchislabs.gobbler.plist",
    "~/Library/Saved Application State/org.orchislabs.gobbler.savedState",
  ]

  caveats <<~EOS
    Gobbler for Mac is currently an unsigned preview.
    This cask removes the quarantine attribute from Gobbler.app after install
    so the unsigned preview can launch. Review the public release before use.
  EOS
end
