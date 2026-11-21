cask "soundbind" do
  version "0.0.1"
  sha256 "4248b39dcdd6622e30aaa383e7b89b4b22beaae435a8e01082a50ced7c4b28e4"

  url "https://github.com/tusharonly/Soundbind/releases/download/v#{version}/Soundbind-#{version}.dmg"
  name "Soundbind"
  desc "Menu bar soundboard that plays audio files with global keyboard shortcuts"
  homepage "https://soundbind.vercel.app/"

  depends_on macos: :sonoma

  app "Soundbind.app"

  # Soundbind is not notarized by Apple. Clearing the quarantine flag lets it open
  # without the "Apple could not verify" dialog.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Soundbind.app"]
  end

  zap trash: "~/Library/Containers/io.github.tusharonly.soundbind"

  caveats <<~EOS
    Soundbind lives in the menu bar. Launch it with:
      open -a Soundbind
  EOS
end
