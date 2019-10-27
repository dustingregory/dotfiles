#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

#git pull origin master;

function doIt() {
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		--exclude "brew.sh" \
		-avh --no-perms . ~;
	PFILE=~/Library/LaunchAgents/com.__username__.homebrewupdate.plist
	sed -i '' "s/__username__/$LOGNAME/g" ${PFILE} 
	mv "${PFILE}" "${PFILE//__username__/$LOGNAME}"
	/bin/launchctl load ${PFILE//__username__/$LOGNAME} 
	/bin/launchctl list |grep $LOGNAME 
	source ~/.bash_profile;
        
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
