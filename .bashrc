# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Get path for current path
SCRIPT_PATH=$(readlink -f "${BASH_SOURCE}")

#Get dotfiles directory
DOTFILES_DIR=$(dirname ${SCRIPT_PATH})

# Finally we can source the dotfiles (order matters)
for DOTFILE in "$DOTFILES_DIR"/system/.{env,function,alias,pager}; do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done

# Source bash dotfiles
for DOTFILE in "$DOTFILES_DIR"/system/.*.bash; do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done


# Source development dotfiles
for DOTFILE in "$DOTFILES_DIR"/dev/.*; do
    [ -f "$DOTFILE" ] && source "$DOTFILE"
done


# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE

# Export
export OS DOTFILES_DIR


