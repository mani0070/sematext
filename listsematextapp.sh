nslookup ditools | tail -2 | awk -F ":" '{print $2}'
curl -H "Content-Type: application/json" -X POST -d '{"apiKey":"xyz"}' https://apps.sematext.com/users-web/api/v2/app/list
cat t.json | jq '.[]' | jq '.[]' | jq '.[]' | jq '.[]| select(.name=="Mani")'

## working copy
nodenames=ditools
for node in $(echo $nodenames | sed "s/,/ /g")
do
    echo "$node"
jmxhostip=$(nslookup ditools | tail -2 | awk -F ":" '{print $2}')
echo "$jmxhostip"
TOKEN=$(cat t.json | jq ".data.apps.spm | {token:.[] | select(.name == \"${node//,/\" or .name == \"}\") | .token}" | jq '.token')
echo "$TOKEN"
echo "/opt/spm/bin/spm-client-setup-conf.sh ${TOKEN} zookeeper standalone jmxhost:${jmxhostip}  jmxport:3000"
done



