#!/usr/bin/env bash
# Install command-line tools using Homebrew.
# Ask for the administrator password upfront.
sudo -v
#sudo chgrp -R admin /usr/local
#sudo chmod -R g+w /usr/local

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished.
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update
# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install more recent versions of some OS X tools.
# Install some other useful utilities like `sponge`.
brew install moreutils
# Install `wget` with IRI support.
brew install wget --with-iri
brew install vim --override-system-vi
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen
brew install ack
brew install git
brew install speedtest_cli
brew install tree
brew install nmap
brew install xz
brew install htop

# Create symlinks 
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Remove outdated versions from the cellar.
brew cleanup
