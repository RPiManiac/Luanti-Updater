SCRIPT_NAME="update_luanti"
SCRIPT_PATH="$(pwd)/build_luanti.sh"

# Issue a warning
echo "Warning: Script will be installed to $(pwd)"

# Check if the script exists
if [ ! -f "$SCRIPT_PATH" ]; then
    echo "Error: Script not found at $SCRIPT_PATH"
    exit 1
fi

# Make sure the script is executable
chmod +x "$SCRIPT_PATH"

# Define where to place the script in the PATH (e.g., /usr/local/bin)
INSTALL_DIR="$(pwd)"

# Check if the INSTALL_DIR is writable
if [ ! -w "$INSTALL_DIR" ]; then
    echo "Error: $INSTALL_DIR does not have write permissions. Please fix this."
    exit 1
fi

# Copy or create a symlink to the script in INSTALL_DIR
if [ -L "$INSTALL_DIR/$SCRIPT_NAME" ] || [ -f "$INSTALL_DIR/$SCRIPT_NAME" ]; then
    echo "Warning: A command named '$SCRIPT_NAME' already exists in $INSTALL_DIR. Overwriting it."
    sudo rm -f "$INSTALL_DIR/$SCRIPT_NAME"
fi

# Create symlink (or copy if you prefer)
sudo ln -s "$SCRIPT_PATH" "$INSTALL_DIR/$SCRIPT_NAME"

# Let the user know it was successful
echo "Setup complete! You can now run 'update_luanti' to update Luanti to the latest dev version!"
