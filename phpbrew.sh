# set default env vars
export PHPBREW_VERSION=5.3.29

# initialize and set php version
source /home/ubuntu/.phpbrew/bashrc
phpbrew use $PHPBREW_VERSION
