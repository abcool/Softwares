#!/bin/bash
echo "To run this script use command source java_version_selector.sh"
# Correctly assign values to variables without spaces around `=`
JAVA8_HOME="/Library/Java/JavaVirtualMachines/jdk-1.8.jdk/Contents/Home"
JAVA17_HOME="/Library/Java/JavaVirtualMachines/jdk-17.0.4.jdk/Contents/Home"
JAVA21_HOME="/Library/Java/JavaVirtualMachines/jdk-21.jdk/Contents/Home"

# Display options
echo "Present java versions:"
echo "1. JAVA_8"
echo "2. JAVA_17"
echo "3. JAVA_21"

# Prompt user to select a java version
echo "Select java version: 1/2/3"
read version

# Set JAVA_HOME based on user selection
case $version in
  1)
    export JAVA_HOME=$JAVA8_HOME
    echo "Java version 8 selected"
    ;;
  2)
    export JAVA_HOME=$JAVA17_HOME
    echo "Java version 17 selected"
    ;;
  3)
    export JAVA_HOME=$JAVA21_HOME
    echo "Java version 21 selected"
    ;;
  *)
    echo "Invalid selection, please choose 1, 2, or 3."
    exit 1
    ;;
esac

# Optionally, show the JAVA_HOME path after selection
echo "JAVA_HOME is now set to: $JAVA_HOME"

# Source the appropriate profile file to immediately refresh the environment
# First, check for bash configuration files
if [[ -f ~/.bash_profile ]]; then
    source ~/.bash_profile
    echo "Refreshed environment from ~/.bash_profile"
elif [[ -f ~/.bashrc ]]; then
    source ~/.bashrc
    echo "Refreshed environment from ~/.bashrc"
fi

# Then, check for zsh configuration file
if [[ -f ~/.zshrc ]]; then
    source ~/.zshrc
    echo "Refreshed environment from ~/.zshrc"
else
    echo "No ~/.zshrc file found, changes will only apply to the current session."
fi