function fish_prompt
    set -l exitCode $status
    set -l face
    if test "$exitCode" -eq 0
        set face (set_color green)"ミ*'-'彡"
    else
        set face (set_color blue)"ミ*;-;彡"
    end

    echo (whoami)@(hostname) (set_color yellow)(prompt_pwd)(set_color normal)
    echo -n $face(set_color normal)" < "
end

function fish_right_prompt
    fish_vcs_prompt
end

