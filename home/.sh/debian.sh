#!/bin/bash
bash.usage_info() { 
cat <<__SCRIPTUSAGE__
# Basic Hardening Guide:
# https://docs.fedoraproject.org/en-US/Fedora/19/html/Security_Guide/chap-Security_Guide-Basic_Hardening.html
# OTHER INFORMATION:
# GRUB 2 PASSWORD PROTECTION
# https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/System_Administrators_Guide/sec-GRUB_2_Password_Protection.
# Set a password for the GRUB bootloader. Generate a password hash using the command 
# To generate an encrypted password, run the grub2-mkpasswd-pbkdf2 command on the command line as root.
# Enter the desired password when prompted and repeat it. The command then outputs your password in an encrypted form.
# Copy the hash, and paste it in the template file where you configured the users, that is, either 
# in /etc/grub.d/01_users or /etc/grub.d/40_custom.
# grub2-mkconfig -o /boot/grub2/grub.cfg
# this_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
__SCRIPTUSAGE__
  # we shoule exit here but we're not going to
  # exit 1
}

#--------------------------------------------
# FUNCTION: bash.sudo_user()
# DESCRIPTION:
# Get the sudo user's name
# Parameters: 
#   none
#--------------------------------------------
function bash.sudo_user() {
  if [[ $SUDO_USER ]]; then 
    this_user="${SUDO_USER}"
  else 
    this_user=$(whoami)
  fi
}

#--------------------------------------------
# FUNCTION: bash.common_packages()
# DESCRIPTION:
# Enusre some common packages are installed
# Parameters: 
#   none
#--------------------------------------------
function bash.common_packages() {
  if [[ "$(facter)" ]]; then
    bash.utils.consoleLog "Facter is installed."
    return
  else 
  
    if [[ $OSTYPE =~ "linux" ]]; then
      bash.utils.consoleLog "Facter is not installed."
        
        if [[ "$(apt-get)" ]]; then
          bash.utils.consoleLogDate "Enusre facter is installed."
          
          if [[ "$(apt)" ]]; then
            apt install -y facter >/dev/null 2>&1
            return
          else
            apt-get install -y facter >/dev/null 2>&1
            return
          fi
        fi
        
        if [[ "$(yum)" ]]; then
          bash.utils.consoleLogDate "Enusre facter is installed."
          
          if [[ "$(dnf)" ]]; then
            dnf install -y facter >/dev/null 2>&1
            return
          else
            yum install -y facter >/dev/null 2>&1
            return
          fi
        fi
    fi
    
  fi
  
  return
}

#--------------------------------------------
# Function: Main()
#--------------------------------------------
main() {
bash.utils.consoleLogDate "main() called"
bash.utils.is_root
bash.common_packages
bash.utils.common_packages

bash.utils.consoleLog 'Locking down Cron jobs'
touch /etc/cron.allow
chmod 600 /etc/cron.allow
awk -F: '{print $1}' /etc/passwd | grep -v root > /etc/cron.deny

bash.utils.consoleLog 'Locking down @AT'
touch /etc/at.allow
chmod 600 /etc/at.allow
awk -F: '{print $1}' /etc/passwd | grep -v root > /etc/at.deny

bash.utils.consoleLog 'Locking down default users'
usermod -s /sbin/nologin root
usermod -s /sbin/nologin mail
usermod -s /sbin/nologin ftp

# Reseaching these
#sudo apt-get install rxvt-unicode-256color ncurses-term

bash.utils.consoleLog 'Install RVM:'
\curl -sSL https://rvm.io/mpapis.asc | sudo gpg2 --import -
runuser -l ${this_user} -c '\curl -sSL https://get.rvm.io | bash -s stable --auto-dotfiles'

bash.utils.consoleLog 'Set git credential to use gnome-keyring.'
git config --global credential.helper gnome-keyring
}
#--------------------------------------------
# Source bash utils functions and call main()
#--------------------------------------------
bash.sudo_user
if [ -d /home/${this_user}/.src/bash/utils/ ]; then
  for file in /home/${this_user}/.src/bash/utils/* ; do
    source "${file}"
    bash.utils.consoleLog 'call main()'
    main "${@}"
  done
else
  bash.usage_info
  printf "%s\n" "[EXIT]: Couldn't source 'src/bash/utils/functions'."
fi
