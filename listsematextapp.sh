nslookup ditools | tail -2 | awk -F ":" '{print $2}'
curl -H "Content-Type: application/json" -X POST -d '{"apiKey":"xyz"}' https://apps.sematext.com/users-web/api/v2/app/list

