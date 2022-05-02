function zellij-auto-start
    set -q ZELLIJ && return
    set -q VSCODE_GIT_IPC_HANDLE && return

    set current_number (zellij list-sessions | rg "automatic-(\w+)" -or '$1' | sort -r | head -n 1)
    test -z "$current_number" && set current_number 0
    set new_number (math "$current_number" + 1)
    zellij -s "automatic-$new_number"

    if $ZELLIJ_AUTO_EXIT
        kill $fish_pid
    end
end
