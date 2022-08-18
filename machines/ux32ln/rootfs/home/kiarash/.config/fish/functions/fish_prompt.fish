
function fish_prompt --description 'Kiarash\'s custom prompt'
    set -l last_status $status

    set -l format_clear set_color normal
    set -l format_user set_color cyan
    set -l suffix '»'

    # Color the prompt differently when we're root
    if functions -q fish_is_root_user; and fish_is_root_user
        set format_user set_color -o red
        set suffix '#'
    end

    set -l format_suffix set_color green
    if test $last_status -ne 0
        set format_suffix set_color red
    end

    echo -n -s '[' ($format_user) $USER ($format_clear) '@' $hostname ']' ' ' (prompt_pwd) ' ' ($format_suffix) $suffix ($format_clear) ' '
end
