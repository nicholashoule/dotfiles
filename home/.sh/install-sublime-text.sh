#!/bin/bash
# Priv check: Only root can run script
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Script Variables
appName='sublime_text_3'
appVersion='3'
buildVersion='3126'

# Define Sublimme Text 3 launcher
read -r -d '' launcher <<'__APPENTRY__'
[Desktop Entry]
Name=Sublime Text 3
Comment=Edit text files
Exec=/usr/local/sublime_text_3/sublime_text
Icon=/usr/local/sublime_text_3/Icon/128x128/sublime-text.png
Terminal=false
Type=Application
Encoding=UTF-8
Categories=Utility;TextEditor;
__APPENTRY__

# Define Sublime Text 3 script
read -r -d '' script <<'__HEREDOC__'
#!/bin/bash
if [ "$1" == "--help" ]; then
    /usr/local/sublime_text_3/sublime_text --help
else
    /usr/local/sublime_text_3/sublime_text $@ > /dev/null 2>&1 &
fi
__HEREDOC__


# Get Sublime Text
curl -s -L "https://download.sublimetext.com/sublime_text_3_build_${buildVersion}_x64.tar.bz2" -o "/usr/src/${appName}.tar.bz2"

# Untar and copy dir/files to directory locations
cd /usr/src && tar -xvjf "${appName}.tar.bz2" || exit
cd "/usr/src/${appName}" || exit
mkdir -pv "/usr/local/${appName}"
mv -fv -- * "/usr/local/${appName}/"

# Create system script
echo "${script}" > "/usr/local/bin/sublime${appVersion}"
chmod 0700 "/usr/local/bin/sublime${appVersion}"

# Create desktop launcher
echo "${launcher}" > "/usr/share/applications/${appName}.desktop"
echo "Done."
