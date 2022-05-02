function PLUGIN_NAME \
    --argument-names arg \
    --description ''

    # Help
    function __help -d "show help"
        printf "usage: PLUGIN_NAME [-h]\n\n"

        printf "positional arguments:\n"
        printf "\n"

        printf "optional arguments:\n"
        printf "  -h, --help          show this help message and exit\n"
        printf "\n"

        return 0
    end

    # Parse arguments
    set -l options "h/help"
    argparse $options -- $argv || return 1

    # Show help
    set -q _flag_help && __help && return 0
end
