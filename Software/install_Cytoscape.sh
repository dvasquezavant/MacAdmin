#!/bin/bash

###################################################################################################
# Script Name:  install_Cytoscape.sh
# By:  Zack Thompson / Created:  9/1/2020
# Version:  1.0.0 / Updated:  9/1/2020 / By:  ZT
#
# Description:  This script installs Cytoscape silently.
#
###################################################################################################

echo "*****  Install Cytoscape process:  START  *****"

if [[ $3 != "/" ]]; then
	echo "ERROR:  Target disk is not the startup disk."
	echo "*****  Install Cytoscape process:  FAILED  *****"
	exit 1
fi

# Set working directory
pkgDir=$(/usr/bin/dirname "${0}")

# Get the name of the install .app in the directory
installApp=$(/bin/ls "${pkgDir}" | /usr/bin/grep .app)

# Install
echo "Installing Cytoscape..."
exitStatus=$( "${pkgDir}/${installApp}/Contents/MacOS/JavaApplicationStub" -q )
exitCode=$?

if [[ $exitCode == 0 ]]; then

	echo "Cytoscape has been installed!"

else

	echo "ERROR:  Failed to install Cytoscape"
	echo "ERROR Contents:  ${exitStatus}"
	echo "*****  Install Cytoscape process:  FAILED  *****"
	exit 2

fi

echo "*****  Install Cytoscape process:  COMPLETE  *****"

exit 0