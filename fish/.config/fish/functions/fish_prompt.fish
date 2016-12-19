function fish_prompt
    # Set prompt symbol depending on the user
    set -l prompt_symbol ''
    switch $USER
        case root; set prompt_symbol '#'
        case '*';  set prompt_symbol '$'
    end

    printf '%s[%s@%s]%s%s%s%s ' (set_color normal) $USER (prompt_pwd) (set_color green) (__fish_git_prompt ' %s ') (set_color normal) $prompt_symbol
end
