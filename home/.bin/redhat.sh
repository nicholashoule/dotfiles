#!/bin/bash
usage_info() { 
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
    this_user=$(logname)
  fi
}

#--------------------------------------------
# Source bash utils functions
#--------------------------------------------
bash.sudo_user
if [ -d /home/${this_user}/.src/bash/utils/ ]; then
  for file in /home/${this_user}/.src/bash/utils/* ; do
    source "${file}"
  done
else
  printf "%s\n" "[EXIT]: Couldn't source 'src/bash/utils/functions'."
fi

#--------------------------------------------
# Main()
#--------------------------------------------
main() {
bash.utils.consoleLogDate "main() called"
bash.utils.is_root

bash.utils.consoleLog "Idle users will be removed after 15 minutes"
echo "readonly TMOUT=900" > /etc/profile.d/os-security.sh
echo "readonly HISTFILE" > /etc/profile.d/os-security.sh
chmod 0644 /etc/profile.d/os-security.sh

bash.utils.consoleLog 'Locking down Cron jobs'
touch /etc/cron.allow
chmod 600 /etc/cron.allow
awk -F: '{print $1}' /etc/passwd | grep -v root > /etc/cron.deny

bash.utils.consoleLog 'Locking down @AT'
touch /etc/at.allow
chmod 600 /etc/at.allow
awk -F: '{print $1}' /etc/passwd | grep -v root > /etc/at.deny

bash.utils.consoleLog 'Locking down securetty'
# Prevents root login on any devices attached to the computer
tee /etc/securetty << 'EOF' > /dev/null
#tty1
#tty2
#tty3
#tty4
#tty5
#tty6
#tty7
#tty8
EOF

bash.utils.consoleLog 'Locking down default users'
usermod -s /sbin/nologin root
usermod -s /sbin/nologin mail
usermod -s /sbin/nologin ftp

bash.utils.consoleLog 'Locking down live CD reminents'
chkconfig livesys off
chkconfig livesys-late off
chkconfig --del livesys
chkconfig --del livesys-late

bash.utils.consoleLog 'Firewalld set default zone to drop'
# Configure the default zone by Editing the firewalld Configuration File
firewall-cmd --set-default-zone=drop

bash.utils.consoleLog 'Firewalld default config'
tee /etc/firewalld/firewalld.conf <<- 'EOF' > /dev/null
# firewalld config file

# default zone
# The default zone used if an empty zone string is used.
# Default: public
DefaultZone=drop

# Minimal mark
# Marks up to this minimum are free for use for example in the direct 
# interface. If more free marks are needed, increase the minimum
# Default: 100
MinimalMark=100

# Clean up on exit
# If set to no or false the firewall configuration will not get cleaned up
# on exit or stop of firewalld
# Default: yes
CleanupOnExit=yes

# Lockdown
# If set to enabled, firewall changes with the D-Bus interface will be limited
# to applications that are listed in the lockdown whitelist.
# The lockdown whitelist file is lockdown-whitelist.xml
# Default: no
Lockdown=no

# IPv6_rpfilter
# Performs a reverse path filter test on a packet for IPv6. If a reply to the
# packet would be sent via the same interface that the packet arrived on, the 
# packet will match and be accepted, otherwise dropped.
# The rp_filter for IPv4 is controlled using sysctl.
# Default: yes
IPv6_rpfilter=yes
EOF

bash.utils.consoleLog 'Firewalld reload'
firewall-cmd --reload

bash.utils.consoleLog 'Manage hosts.deny'
# Deny for service(s) user(s) and severity
tee /etc/hosts.deny <<- 'EOF' > /dev/null
in.telnetd : ALL : severity emerg
in.ftpd : ALL : severity emerg
vsftpd : ALL : severity emerg
sshd : ALL : severity emerg
EOF

bash.utils.consoleLog 'Manage xinetd defaults config'
# The /etc/xinetd.conf file contains general configuration settings 
# which affect every service under xinetd's control.
tee /etc/xinetd.conf <<- 'EOF' > /dev/null
defaults
{
         instances               = 60        
         log_type                = SYSLOG       authpriv
         log_on_success          = HOST PID
         log_on_failure          = HOST
         cps                     = 25 30
}
includedir /etc/xinetd.d
EOF

bash.utils.consoleLog 'Manage xinetd.d telnet config'
# Block Telnet access from a particular network group or restrict overall
tee -a /etc/xinetd.d/telnet <<- 'EOF' > /dev/null
service telnet
{
        flags           = REUSE
        socket_type     = stream
        wait            = no
        user            = root
        server          = /usr/sbin/in.telnetd
        log_on_failure  += USERID
        log_on_success  += DURATION USERID PID HOST EXIT
        disable         = yes
}
EOF

bash.utils.consoleLog 'Manage xinetd.d ftp config'
# Block ftp access from a particular network group or restrict overall
tee -a /etc/xinetd.d/ftp <<- 'EOF' > /dev/null
service ftp
{
        socket_type     = stream
        wait            = no
        user            = root
        server          = /usr/sbin/in.ftpd
        server_args     = -l -a
        log_on_failure  += USERID
        log_on_success  += DURATION USERID PID HOST EXIT
        nice            = 10
        disable         = yes
}
EOF

}
bash.utils.consoleLog 'call main()'
main "${@}"
