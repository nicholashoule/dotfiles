#--------------------------------------------
# FUNCTION: is_empty()
# DESCRIPTION:
# Check if variable is empty
# Parameters: 
#   string - variable
#--------------------------------------------
function is_empty() {
  # Check value is not empty and a number
  if [[ -z "$1" ]]; then
      # return 0, is empty
      return 0
  fi
  # return 1, not empty
  return 1
}

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

#--------------------------------------------
# FUNCTION: find_git_repo()
# DESCRIPTION:
# Check for and update existing local git repo 
# or clone source/remote
# Parameters: 
#   $1, string - source git repo
#   $2, string - local git repo
#--------------------------------------------
function find_git_repo() {
v_srcrepo=$(printf "%s" "$1")
v_localrepo=$(printf "%s" "$2")

# Check for an empty string
if ( ! is_empty ${v_srcrepo} ) && ( ! is_empty ${v_localrepo} ); then

	# Detect repo
	if [ ! -d "${v_localrepo}" ]; then
	  git clone ${v_srcrepo} ${v_localrepo}
	else
	  cd "${v_localrepo}"
	  git pull ${v_srcrepo}
	fi

else
	printf "%s\n" "[Info]: Please specify a source and local repo."
fi

}

# Export functions to other bash sub-shells
# typeset -fx is_empty find_os_family find_git_repo
