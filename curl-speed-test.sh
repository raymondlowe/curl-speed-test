
now=$(date +"%Y-%m-%d-%H-%M-%S")
echo url_effective,http_code, http_connect, time_total, time_namelookup, time_connect, time_appconnect, time_pretransfer, time_redirect, time_starttransfer, size_download, size_upload, size_header, size_request, speed_download, speed_upload, content_type, num_connects, num_redirects > "output-${now}.csv"

while read url; do
    curl -L --output /dev/nul -s -w "@curl-format-line.txt"  $url >>  "output-${now}.csv"
done <urls.csv



