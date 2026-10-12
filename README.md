# bash-project-log-analyzer

## Purpose
This Bash script analyzes a log file to find failed logins,
successful logins, or IP addresses.

It is useful for IT support and cybersecurity because it helps
administrators review login activity without manually reading
every line of a log file.

## Files

- `log_analyzer.sh` - The Bash script
- `sample.log` - Sample login records
- `README.md` - Project instructions

## Requirements

- Linux or a Bash terminal
- grep
- A sample log file

## How to Run

First, make the script executable:

    chmod +x log_analyzer.sh

## Examples
Display the help menu:

    ./log_analyzer.sh -h

Show failed login attempts:

    ./log_analyzer.sh -f sample.log -t failed

Show successful login attempts:

    ./log_analyzer.sh -f sample.log -t success

Extract IP addresses:

    ./log_analyzer.sh -f sample.log -t ip

Show all login attempts:

    ./log_analyzer.sh -f sample.log -t all

## Options
- `-f` specifies the input file.
- `-t` selects the type of information to display.
- `-h` displays help instructions.

Supported types are `failed`, `success`, `ip`, and `all`.

## Regular Expressions
The script uses `grep -E` to search for patterns.
- `FAILED_LOGIN` matches failed login records.
- `SUCCESS_LOGIN` matches successful login records.
- `([0-9]{1,3}\.){3}[0-9]{1,3}` matches strings that resemble IPv4 addresses.

## Error Handling
The script displays an error if the input file is missing
or unreadable, an invalid option is used, or an unsupported
analysis type is provided.

## Example Output
Command:
    ./log_analyzer.sh -f sample.log -t failed
Output:
    2026-10-10 08:15:22 FAILED_LOGIN user=alex ip=192.168.1.15
    2026-10-10 08:19:43 FAILED_LOGIN user=admin ip=10.0.0.8
    2026-10-10 08:25:31 FAILED_LOGIN user=unknown ip=10.0.0.8
    2026-10-10 08:35:14 FAILED_LOGIN user=guest ip=172.16.0.5
