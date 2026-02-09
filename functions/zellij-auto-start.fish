function zellij-auto-start
    set -q ZELLIJ && return

    set -U ZELLIJ_DISABLE_AUTO_EXIT_ONLY_ONCE false

    set current_number (zellij list-sessions | rg "automatic-(\w+)" -or '$1' | sort -rV | head -n 1)
    test -z "$current_number" && set current_number 0
    set new_number (math "$current_number" + 1)

    if $ZELLIJ_AUTO_START
        zellij -s "automatic-$new_number" || exit

        if $ZELLIJ_AUTO_EXIT
            if not $ZELLIJ_DISABLE_AUTO_EXIT_ONLY_ONCE
                kill $fish_pid
            end
        end
    end

    ZELLIJ=0 exec fish
end
