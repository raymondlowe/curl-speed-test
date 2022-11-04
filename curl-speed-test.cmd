for /f %%x in ('wmic path win32_localtime get /format:list ^| findstr "="') do set %%x
set NOW=%Year%-%Month%-%Day%-%Hour%-%Minute%-%Second%

echo url_effective,http_code, http_connect, time_total, time_namelookup, time_connect, time_appconnect, time_pretransfer, time_redirect, time_starttransfer, size_download, size_upload, size_header, size_request, speed_download, speed_upload, content_type, num_connects, num_redirects > "output-%NOW%.csv"
for /F "tokens=*" %%A in (urls.dsv) do curl -L --output /dev/nul -s -w "@curl-format-line.txt"  %%A >> "output-%NOW%.csv"

