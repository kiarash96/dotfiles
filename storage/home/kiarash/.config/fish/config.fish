set fish_greeting

function fish_prompt
    set --local last_status $status

    set_color purple
    echo -n '['(basename (echo $PWD | sed "s|^$HOME|~|"))']'

    if test $last_status -eq 0
        set_color green
    else
        set_color red
    end
    echo ' ❯ '
end

set fish_color_command green
set fish_color_param normal
set fish_color_valid_path
set fish_color_autosuggestion brblack

set fish_pager_color_prefix brblack
set fish_pager_color_description yellow
