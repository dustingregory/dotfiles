#!/usr/bin/env bash

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
#brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
#brew install gnu-sed --with-default-names
# Install Bash 4.
#brew install bash
#brew install bash-completion2

# Switch to using brew-installed bash as default shell
#if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
#  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
#  chsh -s "${BREW_PREFIX}/bin/bash";
#fi;

# Install `wget` with IRI support.
brew install wget 

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

brew install npm

# Install more recent versions of some macOS tools.
brew install vim 
brew install grep
#brew install openssh
brew install screen
#brew install php
#brew install gmp

# Install font tools.
#brew tap bramstein/webfonttools
#brew install sfnt2woff
#brew install sfnt2woff-zopfli
#brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
#brew install aircrack-ng
#brew install bfg
brew install binutils
#brew install binwalk
#brew install cifer
#brew install dex2jar
#brew install dns2tcp
#brew install fcrackzip
#brew install foremost
#brew install hashpump
#brew install hydra
#brew install john
#brew install knock
#brew install netpbm
brew install nmap
#brew install pngcheck
#brew install socat
#brew install sqlmap
#brew install tcpflow
#brew install tcpreplay
#brew install tcptrace
#brew install ucspi-tcp # `tcpserver` etc.
#brew install xpdf
#brew install xz

# Install other useful binaries.
#brew install ack
#brew install exiv2
brew install git
#brew install git-lfs
#brew install imagemagick --with-webp
#brew install lua
#brew install lynx
brew install p7zip
#brew install pigz
#brew install pv
#brew install rename
#brew install rlwrap
#brew install ssh-copy-id
brew install tree
#brew install vbindiff
#brew install zopfli
brew install htop
brew install tmux
brew install pstree

brew install calc
brew install cask
brew install git
brew install htop
brew install p7zip
brew install parallel
brew install perl
brew install python
brew install python@2
brew install speedtest-cli
brew install unrar
brew install watch
brew install youtube-dl
brew install ansible
brew install coreutils
brew install rbenv ruby-build
brew cask install iterm2
brew cask install google-chrome

brew tap homebrew/cask-fonts
brew cask install font-meslo-nerd-font
brew cask install visual-studio-code
brew cask install dotnet-sdk
brew cask install slack
brew cask install microsoft-teams
brew cask install virtualbox virtualbox-extension-pack
brew cask install vagrant
brew cask install discord



# Remove outdated versions from the cellar.
brew cleanup

# Set the iterm2 and terminal font to nerdfonts and other settings
/usr/libexec/PlistBuddy -c 'Set :"New Bookmarks":0:"Normal Font" "MesloLGLNerdFontComplete-Regular 12"' ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c 'Set :"New Bookmarks":0:"Rows" "22"' ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c 'Set :"New Bookmarks":0:"Columns" "98"' ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c 'Set :"New Bookmarks":0:"Scrollback Lines" "0"' ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c 'Set :"New Bookmarks":0:"Silence Bell" "1"' ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c 'Set :"New Bookmarks":0:"Unlimited Scrollback" "1"' ~/Library/Preferences/com.googlecode.iterm2.plist

/usr/bin/osascript <<END
tell application "Terminal"
        set ProfilesNames to name of every settings set
        repeat with ProfileName in ProfilesNames
                set font name of settings set ProfileName to "MesloLGS Nerd Font"
                set font size of settings set ProfileName to 11
        end repeat
end tell
END
