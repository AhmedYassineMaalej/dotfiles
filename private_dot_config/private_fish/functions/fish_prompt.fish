function fish_prompt --description 'Write out the prompt'
    # print username
    printf "%s%s%s " (set_color $fish_color_user --bold --italics) $USER (set_color normal)

    # print current working directory
    printf "in %s%s%s " (set_color $fish_color_cwd --bold) (prompt_pwd --full-length-dirs=3) (set_color normal)

    git_prompt

    set_color $fish_color_keyword
    echo -ne " "
    set_color normal
end

function git_prompt --description 'Write out git status and branch info'
    if test -d ".git"
        printf "on %s %s%s " (set_color green -o) (git branch --show-current) (set_color normal)
    end
end
