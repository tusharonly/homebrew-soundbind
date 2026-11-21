# Homebrew tap for Soundbind

[Soundbind](https://github.com/tusharonly/Soundbind) is a tiny native macOS menu bar soundboard: drop in a sound, bind a key, done.

## Install

```sh
brew install --cask tusharonly/soundbind/soundbind
```

Then open it with `open -a Soundbind` and look for its icon in the menu bar.

Soundbind is not notarized by Apple. This cask clears the macOS quarantine flag after installing, so the app opens without the "Apple could not verify" dialog. The app is open source; read the code before trusting it.

## Update and uninstall

```sh
brew upgrade --cask soundbind
brew uninstall --cask soundbind          # add --zap to also delete your sounds and settings
```
