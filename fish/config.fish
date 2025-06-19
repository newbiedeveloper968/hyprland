if status is-interactive
    # Disable default welcome message
    function fish_greeting
    end

    # Custom greeting
    echo "🌱 Gambare Gambare!"

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
    set -g fish_color_autosuggestion 555   # Ghost text
    set -g fish_color_search_match --background=blue

    # Aliases
    alias c="clear"
    alias e="exit"
    alias vim='nvim'
    alias bl='bluetui'
    alias p='python3'

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

# === GTK dark theme override ===
set -Ux GTK_THEME Adwaita:dark

function pom
    timer $argv
    notify-send "Timer Done"
end
