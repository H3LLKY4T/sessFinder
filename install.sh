#!/bin/bash

INSTALL_DIR="/usr/local/bin"
RESOURCES_DIR="./Resources"
SCRIPT_NAME="sessFinder"
SCRIPT_PATH="$RESOURCES_DIR/sessFinder.sh"

if [ ! -d "$RESOURCES_DIR" ]; then
  echo "The Resources directory does not exist. Please run this script from the correct location."
  exit 1
fi

cp "$SCRIPT_PATH" "$INSTALL_DIR/$SCRIPT_NAME"

chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

echo "Installation completed. You can now run the script using '$SCRIPT_NAME'"

if [ "$1" == "--uninstall" ]; then
  rm -f "$INSTALL_DIR/$SCRIPT_NAME"
  echo "Uninstallation completed."
  exit 0
fi

