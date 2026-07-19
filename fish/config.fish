if status is-interactive
    # Disable default welcome message
    function fish_greeting
    end

    # Custom greeting
    echo "🌱 \"THROUGH DIFFICULTIES TO HONORS\""

    # Customize syntax highlighting colors
    set -g fish_color_command brcyan       # Commands
    set -g fish_color_param white          # Arguments
    set -g fish_color_error red            # Errors
    set -g fish_color_quote green          # Strings in quotes
    set -g fish_color_operator magenta     # |, >, &&, etc.
    set -g fish_color_comment brblack      # Comments (#)
    set -g fish_color_end brblue           # Statement terminators (;)
    set -g fish_color_cwd yellow           # Current directory in prompt
    set -g fish_color_user white
    set -g fish_color_host gray
    set -g fish_color_autosuggestion 9C9990   # Ghost text
    set -g fish_color_search_match --background=blue

    # Aliases
    alias c="clear"
    alias e="exit"
    alias vim='nvim'
    alias bl='bluetui'
    alias p='python3'
    # alias cs50 'gcc -lcs50'
    alias run="gcc -fsanitize=address -fsanitize=leak -g"
    alias b0="rfkill block bluetooth"
    alias b1="rfkill unblock bluetooth && bluetui"
    # Environment variables
    set -x HYPRSHOT_DIR "$HOME/Pictures/Screenshots"

    # Prompt customization
    function fish_prompt
        set_color c0c0c0
        echo -n (prompt_pwd)
        set_color ffffff
        echo \n"➜ "
    end
end

function cs50
    gcc $argv -lcs50
end

# function set_wallpaper
#     if acpi -a 2>/dev/null | grep -q "on-line"
#         pkill -f mpvpaper
#         mpvpaper -o "loop --hwdec=auto --no-audio --framedrop=vo --vf=fps=15" "*" "$VIDEO" &
#     else
#         pkill -f mpvpaper
#         if test -f "$STATIC"
#             echo "Applying static wallpaper: $STATIC"
#             hyprpaper wallpaper "$STATIC"
#         else
#             echo "Static wallpaper missing for $VIDEO"
#         end
#     end
# end

function cs
    set src $argv[1]
    clang $src -lcs50 -o (basename $src .c)
end

set -Ux EDITOR nvim
set -Ux VISUAL nvim
export MOZ_ENABLE_WAYLAND=1
set -Ux XCURSOR_THEME macOS
set -Ux XCURSOR_SIZE 35
