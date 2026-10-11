
#!/bin/bash

websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

log_file="$(dirname "$0")/website_status.log"

# Clear the log file before each run
: > "$log_file"

for website in "${websites[@]}"; do
    status_code=$(curl -L -s -o /dev/null -w "%{http_code}" "$website")

    if [ "$status_code" = "200" ]; then
        result="$website is UP"
    else
        result="$website is DOWN"
    fi

    echo "$result"
    echo "$result" >> "$log_file"
done

echo "Results have been saved to $log_file"
