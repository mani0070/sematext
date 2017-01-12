nodenames=ditools
for node in $(echo $nodenames | sed "s/,/ /g")
do
    echo "$node"
jmxhostip=$(nslookup ditools | tail -2 | awk -F ":" '{print $2}')
echo "$jmxhostip"
TOKEN=$(cat t.json | jq ".data.apps.spm | {token:.[] | select(.name == \"${node//,/\" or .name == \"}\") | .token}" | jq '.token')
echo ${TOKEN//\"/}
echo "/opt/spm/bin/spm-client-setup-conf.sh ${TOKEN//\"/} zookeeper standalone jmxhost:${jmxhostip}  jmxport:3000"
done
