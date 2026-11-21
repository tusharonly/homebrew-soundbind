cask "soundbind" do
  version "0.0.1"
  sha256 "503be32aa73804ad634d889ddc3acc08e127e54d89907e20e0b56908da2223ef"

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
