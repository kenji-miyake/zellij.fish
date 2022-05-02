set -q ZELLIJ_AUTO_START || set -U ZELLIJ_AUTO_START true
set -q ZELLIJ_AUTO_EXIT || set -U ZELLIJ_AUTO_EXIT true

abbr -a z zellij
zellij setup --generate-completion fish | source

if type zellij-auto-start >/dev/null 2>&1
    zellij-auto-start
end
