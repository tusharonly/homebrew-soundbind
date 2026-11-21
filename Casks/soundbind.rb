cask "soundbind" do
  version "0.0.1"
  sha256 "876df740c9498c640cdc4b7b76a492baddee0c89fe086916e9ac48ac218ad094"

  url "https://github.com/tusharonly/Soundbind/releases/download/v#{version}/Soundbind-#{version}.zip"
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
