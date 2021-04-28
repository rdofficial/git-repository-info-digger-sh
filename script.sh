# The script displays all the information about the GIT repository in which we are currently active on, and also it requires to be run inside the folder that holds the GIT repository.
#
# Author : Rishav Das (https://github.com/rdofficial)
# Created on : April 27, 2021
#

# Defining the ANSII color codes for the colored output
RED="\033[91m"
GREEN="\033[92m"
YELLOW="\033[93m"
BLUE="\033[94m"
RED_REV="\033[07;91m"
DEFCOL="\033[00m"

# Checking the arguments entered by the user while calling the script
if [[ -z $1 ]]; then
	# If there are no arguments entered by the user while calling the script, then we continue using the current folder as the user specified GIT repository

	directoryLocation=$( pwd )
else
	# If the user entered an argument while calling the script, then we take the argument as the directory location where the required GIT repository is held at

	directoryLocation=$1
	initialDirectoryLocation=$( pwd )

	# Changing the terminal location to the user specified directory
	cd $directoryLocation
fi

# Displaying the script name (heading) on the console screen
echo -e "\n\033[07;93m[ GIT Repository Info Digger ]\033[00m"
echo -e "[ Created by : ${GREEN}Rishav Das ${YELLOW}(https://github.com/rdofficial)${DEFCOL} ]"

# Checking wheter a GIT repository or not
if [[ -d .git ]]; then
	# If the directory is a GIT repository (as it has a .git hidden folder inside it), then we continue the further process

	# Checking the number (amount) of commits that are done in this repository till date
	echo -e ""
	echo -e "[${BLUE}#${DEFCOL}] The number of commits made till date : ${YELLOW}$( git log --pretty=oneline | wc -l )${DEFCOL}"

	# Checking the remote information the repository
	echo -e ""
	echo -e "[${BLUE}#${DEFCOL}}] The remote information of the repository is : ${YELLOW}"
	git remote --verbose
	printf "${DEFCOL}"

	# Checking the branch information about the repository
	echo -e ""
	echo -e "[${BLUE}#${DEFCOL}] The information about the branches in the repository are : ${YELLOW}"
	git branch
	printf "${DEFCOL}"

	# Checking the GIT status
	echo -e ""
	echo -e "[${BLUE}#${DEFCOL}] The status of the repository is : ${YELLOW}"
	git status
	printf "${DEFCOL}"
else
	# If the directory is not a GIT repository, then we display the error message to the user

	echo -e "\n${RED_REV}[ Error : The specified directory is not a valid GIT repository ]${DEFCOL}"
fi

# After every code is executed, then we finally switch back to the intial directory where the user called the script
cd $intialDirectoryLocation
