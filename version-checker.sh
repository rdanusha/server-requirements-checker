#!/bin/bash

#Required versions
REQUIRED_COMPOSER_VERSION="2.4.4"
REQUIRED_NODE_VERSION="v14.15.2"
REQUIRED_NPM_VERSION="7.24.3"
REQUIRED_PHP_VERSION="8.0"

echo $'\e[1;37m'Checking the server requirements.$'\e[0m'

echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'


# Check if the terminal supports ANSI color codes
if [[ -t 1 && $(tput colors) -ge 8 ]]; then
  # Define color codes
  green=$(tput setaf 2)
  red=$(tput setaf 1)
  reset=$(tput sgr0)
else
  # Define Unicode characters
  green="\xE2\x9C\x94"
  red="\xE2\x9C\x98"
  reset=""
fi

# Table header
printf "%-30s %-10s %-25s\n" "Component" "Status" "Notes"
echo "--------------------------------------------------------------"

#Check PHP version
# Check if PHP is installed
if command -v php >/dev/null 2>&1; then
    PHP_VERSION=$(php -r 'echo PHP_VERSION;')
    if [[ "$(printf '%s\n' "$REQUIRED_PHP_VERSION" "$PHP_VERSION" | sort -V | head -n1)" == "$REQUIRED_PHP_VERSION" ]]; then
        printf "%-30s %-10s %-25s\n" "PHP ($REQUIRED_PHP_VERSION)" "${green}PASS      ${reset}" "Installed version $PHP_VERSION"
    else
      printf "%-30s %-10s %-25s\n" "PHP ($REQUIRED_PHP_VERSION)" "${red}FAIL      ${reset}" "Error: PHP version mismatch. Expected version $REQUIRED_PHP_VERSION but found $PHP_VERSION."
    fi
else
    printf "%-30s %-10s %-25s\n" "PHP ($REQUIRED_PHP_VERSION)" "${red}FAIL      ${reset}" "PHP is not installed. Please follow the instructions to install PHP in the following link. https://www.php.net/manual/en/install.php"
fi

#Check Composer version
# Check if Composer is installed
if command -v composer >/dev/null 2>&1; then
    COMPOSER_VERSION=$(composer -V | grep -o 'Composer version [0-9]*\.[0-9]*\.[0-9]*' | cut -d' ' -f3)
    if [ $COMPOSER_VERSION = $REQUIRED_COMPOSER_VERSION ]; then
        printf "%-30s %-10s %-25s\n" "Composer ($REQUIRED_COMPOSER_VERSION)" "${green}PASS      ${reset}" "Installed version $COMPOSER_VERSION"
    else
        printf "%-30s %-10s %-25s\n" "Composer ($REQUIRED_COMPOSER_VERSION)" "${red}FAIL      ${reset}" "Error: Composer version mismatch. Expected version $REQUIRED_COMPOSER_VERSION but found $COMPOSER_VERSION."
    fi
else
    printf "%-30s %-10s %-25s\n" "Composer ($REQUIRED_COMPOSER_VERSION)" "${red}FAIL      ${reset}" "Composer is not installed. Please follow the instructions to install composer in the following link. https://getcomposer.org/doc/00-intro.md"
fi

#Check Node version
# Check if Node.js is installed
if command -v node >/dev/null 2>&1; then
    NODE_VERSION=$(node -v)
    if [ $NODE_VERSION = $REQUIRED_NODE_VERSION ]; then
         printf "%-30s %-10s %-25s\n" "Node ($REQUIRED_NODE_VERSION)" "${green}PASS      ${reset}" "Installed version $NODE_VERSION"
    else
        printf "%-30s %-10s %-25s\n" "Node ($REQUIRED_NODE_VERSION)" "${red}FAIL      ${reset}" "Error: Node version mismatch. Expected version $REQUIRED_NODE_VERSION but found $NODE_VERSION."
    fi
else
    printf "%-30s %-10s %-25s\n" "Node ($REQUIRED_NODE_VERSION)" "${red}FAIL      ${reset}" "Node is not installed. Please follow the below link to install the node using the node version manager. https://github.com/nvm-sh/nvm"
fi


#Check NPM version
# Check if npm is installed
if command -v npm >/dev/null 2>&1; then
    NPM_VERSION=$(npm -v)
    if [[ "$(printf '%s\n' "$REQUIRED_NPM_VERSION" "$NPM_VERSION" | sort -V | head -n1)" == "$REQUIRED_NPM_VERSION" ]]; then
         printf "%-30s %-10s %-25s\n" "NPM ($REQUIRED_NPM_VERSION)" "${green}PASS      ${reset}" "Installed version $NPM_VERSION"
    else
        printf "%-30s %-10s %-25s\n" "NPM ($REQUIRED_NPM_VERSION)" "${red}FAIL      ${reset}" "Error: Node version mismatch. Expected version $REQUIRED_NPM_VERSION but found $NPM_VERSION."
    fi
else
    printf "%-30s %-10s %-25s\n" "NPM ($REQUIRED_NPM_VERSION)" "${red}FAIL      ${reset}" "NPM is not installed. Please follow the instructions to install npm in the following link. https://docs.npmjs.com/downloading-and-installing-node-js-and-npm"
fi
 

