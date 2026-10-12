
#!/bin/bash

# Log File Analyzer

# Show help
if [[ "$1" == "-h" ]]; then
    echo "Usage: ./log_analyzer.sh -f filename -t type"
    echo "Types: failed, success, ip, all"
    echo "Example: ./log_analyzer.sh -f sample.log -t failed"
    exit 0
fi

# Get options
while getopts "f:t:" opt; do
    case $opt in
        f) file="$OPTARG" ;;
        t) type="$OPTARG" ;;
        *) echo "Error: Invalid option. Use -h for help."; exit 1 ;;
    esac
done

# Check input file
if [[ -z "$file" || ! -r "$file" ]]; then
    echo "Error: Provide a readable file using -f."
    exit 1
fi

# Choose what to search for
case "$type" in
    failed)
        grep -E "FAILED_LOGIN" "$file"
        ;;
    success)
        grep -E "SUCCESS_LOGIN" "$file"
        ;;
    ip)
        grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' "$file"
        ;;
    all)
        grep -E "FAILED_LOGIN|SUCCESS_LOGIN" "$file"
        ;;
    *)
        echo "Error: Choose failed, success, ip, or all."
        exit 1
        ;;
esac
