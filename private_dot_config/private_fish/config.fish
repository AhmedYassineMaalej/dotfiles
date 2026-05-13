if status is-interactive
    fish_config theme choose "Catppuccin Mocha"
    bind alt-a history-token-search-backward

    function starship_transient_prompt_func
      starship module character
    end

    set -gx SUDO_EDITOR nvim
    starship init fish | source
    zoxide init fish | source
    enable_transience
end
