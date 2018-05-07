#define our final file location
file="git-completion.bash"
directory="/opt/local/etc/bash_completion.d/"
echo "Running file creation and profile update script for Git auto completion"
#check if file exists, exit if it does
if [ -f "$directory$file" ]
then
	echo "$file already exists in $directory, exiting."
else
	#otherwise lets download and create our file
	echo "Need to run some things as root"
	sudo mkdir -p $directory
	echo "Created directory $directory"
	sudo bash -c "curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > $directory$file"
	echo "Copied $file to $directory"

	#then lets call it on every profile run.
	echo -e "\n#GIT command line integration" >> ~/.bash_profile
	echo "export LANG=C" >> ~/.bash_profile
	echo "source $directory$file" >> ~/.bash_profile
	echo "Added lines to .bash_prorfile"
	echo "exiting."
	echo "Open a new terminal."
	exit
fi
