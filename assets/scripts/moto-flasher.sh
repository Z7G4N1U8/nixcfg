# Initialize variables
DIRECTORY=""
slot_mode="dual"        # default: flash both _a and _b
execution_mode="print"   # default: only print commands
erase=true
root=false
super_only=false
show_help=false

# Function to display help
show_help() {
    cat << EOF
Usage: $0 [OPTIONS] DIRECTORY

Flash stock ROM images based on XML configuration.

OPTIONS:
  -a, --a-only        Flash only the '_a' partitions as in the XML (no _b).
  -f, --flash         Execute fastboot commands (default: print only).
  -p, --preserve      Ignore erase commands
  -r, --root          Don't flash boot
  -s, --super-only    Flash only super partition
  -h, --help          Show this help message.

By default (no options), the script will print all fastboot commands for both slots
(_a and _b), but will NOT execute them.

Examples:
  $0 --a-only ./stock/        # Print flash commands for _a only
  $0 --flash ./stock/         # Flash both _a and _b partitions
  $0 -af ./stock/             # Flash only _a (a takes precedence over f)
  $0 ./stock/                 # Print commands for both slots (dry run)
EOF
    exit 0
}

# Parse command-line options and directory
for arg in "$@"; do
    case "$arg" in
        -a|--a-only)
            slot_mode="a-only"
            ;;
        -f|--flash)
            execution_mode="execute"
            ;;
        -p|--preserve)
            erase=false
            ;;
        -r|--root)
            root=true
            ;;
        -s|--super-only)
            super_only=true
            ;;
        -h|--help)
            show_help
            ;;
        -[a-z]*)
            # Handle combined short options (e.g., -af)
            for ((i=1; i<${#arg}; i++)); do
                case "${arg:$i:1}" in
                    a)
                        slot_mode="a-only"
                        ;;
                    f)
                        execution_mode="execute"
                        ;;
                    p)
                        erase=false
                        ;;
                    r)
                        root=true
                        ;;
                    h)
                        show_help
                        ;;
                    s)
                        super_only=true
                        ;;
                    *)
                        echo "Unknown option: -${arg:$i:1}" >&2
                        exit 1
                        ;;
                esac
            done
            ;;
        *)
            # Assume remaining argument is the directory
            if [[ -z "$DIRECTORY" && -d "$arg" ]]; then
                DIRECTORY="$arg"
            else
                echo "Invalid argument: $arg" >&2
                echo "Usage: $0 [OPTIONS] DIRECTORY" >&2
                exit 1
            fi
            ;;
    esac
done

# Validate directory
if [[ -z "$DIRECTORY" ]]; then
    echo "Error: No valid directory provided." >&2
    echo "Usage: $0 [OPTIONS] DIRECTORY" >&2
    exit 1
fi

XML_FILE="$DIRECTORY/flashfile.xml"

# Validate XML file
if [[ ! -f "$XML_FILE" ]]; then
    echo "Error: XML file '$XML_FILE' not found." >&2
    exit 1
fi

# Extract and process each <step>
grep "<step" "$XML_FILE" | while IFS= read -r line; do
    operation=$(echo "$line" | sed -n 's/.*operation="\([^"]*\)".*/\1/p')

    case "$operation" in
        "flash")
            partition=$(echo "$line" | sed -n 's/.*partition="\([^"]*\)".*/\1/p')
            filename=$(echo "$line" | sed -n 's/.*filename="\([^"]*\)".*/\1/p')
            flash=true
            [[ "${partition%_a}" == "boot" && $root = true ]] && flash=false

            if [[ $super_only == true ]]; then
                if [[ "$partition" == "super" ]]; then
                    echo "fastboot flash $partition $DIRECTORY/$filename"
                    fastboot flash "$partition" "$DIRECTORY/$filename"
                fi
            elif [[ "$slot_mode" == "a-only" && $flash == true ]]; then
                # Only flash _a as in XML
                [[ $flash == true ]] && echo "fastboot flash $partition $DIRECTORY/$filename"
                [[ "$execution_mode" == "execute" && $flash == true ]] && fastboot flash "$partition" "$DIRECTORY/$filename"
            else
                # Dual slot mode: flash both _a and _b for applicable partitions
                if [[ "$partition" == *_a ]]; then
                    [[ $flash == true ]] && echo "fastboot flash $partition $DIRECTORY/$filename"
                    [[ "$execution_mode" == "execute" && $flash == true ]] && fastboot flash "$partition" "$DIRECTORY/$filename"

                    partition_b="${partition%_a}_b"
                    [[ $flash == true ]] && echo "fastboot flash $partition_b $DIRECTORY/$filename"
                    [[ "$execution_mode" == "execute" && $flash == true ]] && fastboot flash "$partition_b" "$DIRECTORY/$filename"
                else
                    echo "fastboot flash $partition $DIRECTORY/$filename"
                    [[ "$execution_mode" == "execute" ]] && fastboot flash "$partition" "$DIRECTORY/$filename"
                fi
            fi
            ;;
        "erase")
            partition=$(echo "$line" | sed -n 's/.*partition="\([^"]*\)".*/\1/p')
            [[ $erase == true ]] && echo "fastboot erase $partition"
            [[ "$execution_mode" == "execute" && $erase == true ]] && fastboot erase "$partition"
            ;;
        "oem")
            var=$(echo "$line" | sed -n 's/.*var="\([^"]*\)".*/\1/p')
            echo "fastboot oem $var"
            [[ "$execution_mode" == "execute" ]] && fastboot oem "$var"
            ;;
        "getvar")
            var=$(echo "$line" | sed -n 's/.*var="\([^"]*\)".*/\1/p')
            echo "fastboot getvar $var"
            [[ "$execution_mode" == "execute" ]] && fastboot getvar "$var"
            ;;
        *)
            echo "# Unknown operation: $operation" >&2
            ;;
    esac
done
