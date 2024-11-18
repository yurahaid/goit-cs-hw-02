 #!/bin/bash

log_file="website_status.log"
sites=("https://google.com" "https://facebook.com" "https://twitter.com")
touch $log_file

for url in "${sites[@]}"; do
    response=$(curl -L -s -o /dev/null -w "%{http_code}" "$url");
    log="<$url> is DOWN"
    if [ "$response" -eq 200 ]; then
      log="<$url> is UP"
    fi

    echo $log >> $log_file
done

echo "All results was logged into $log_file"