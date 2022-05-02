# positional arguments
complete -c PLUGIN_NAME -f -n "__fish_seen_argument -s h" -a ""

# optional arguments
complete -c PLUGIN_NAME -n "__fish_not_contain_opt -s h" -s h -l help -d "show help"
