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
    set -g fish_color_autosuggestion 9C9990   # Ghost text
    set -g fish_color_search_match --background=blue

    # Aliases
    alias c="clear"
    alias e="exit"
    alias vim='nvim'
    alias bl='bluetui'
    alias p='python3'
    alias cs50 'gcc -lcs50'
    alias run="gcc -fsanitize=address -fsanitize=leak -g"
    alias studywith="mpv --no-border --really-quiet --ytdl-format=worst --vo=gpu --framedrop=vo"

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

function pom
    timer $argv
    notify-send "Timer Done"
end

function cs50
    gcc $argv -lcs50
end


set -Ux EDITOR nvim
set -Ux VISUAL nvim
export MOZ_ENABLE_WAYLAND=1
set -Ux XCURSOR_THEME macOS
set -Ux XCURSOR_SIZE 35
