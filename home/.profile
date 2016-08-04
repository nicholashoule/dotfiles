#--------------------------------------------
# .profile
# The stuff NOT specifically related to bash, 
# such as environment variables and PATH
#--------------------------------------------
# Default User specific env path
#--------------------------------------------
PATH="$PATH"
export PATH
#--------------------------------------------
# Other specific env variables and exports
#--------------------------------------------
# JAVA information
#export JAVA_HOME="[PATH]"           # export JAVA_HOME

# aws client authentication information
# - This should go in a separate file
#export AWS_ACCESS_KEY=[key]         # export AWS_ACCESS_KEY
#export AWS_SECRET_KEY=[key]         # export AWS_SECRET_KEY
#export EC2_HOME="[path]"            # export EC2_HOME

# Nova client authentication information
# - This should go in a separate file
#export OS_USERNAME='[name]'
#export OS_PASSWORD='[password]'
#export OS_TENANT_NAME='[name]'
#export OS_AUTH_URL='https://localhost:5000/v2.0'
#export OS_AUTH_STRATEGY='[strategy]'
# The following lines can be omitted
#export OS_TENANT_ID='[id]'
#export NOVACLIENT_INSECURE=1
#export OS_NO_CACHE=1
