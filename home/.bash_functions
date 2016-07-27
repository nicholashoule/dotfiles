#--------------------------------------------
# FUNCTION: find_os_family()
# DESCRIPTION:
# Use 'uname -s' to find Darwin or Linux
# Parameters: 
#   none
#--------------------------------------------
function find_os_family() {
  # Detect Linux or Darwin
  printf "%s" "$(uname -s)"
}
