#!/bin/bash

if [ "$#" != "2" ]; then
    echo "Usage : $0 kpture_name kpture_namespace"
    exit  1
fi

NAME=$1
NAMESPACE=$2

set -e

generate_post_data()
{
  cat <<EOF
{
  "kptureName": "$NAME",
  "kptureNamespace": "$NAMESPACE"
}
EOF
}

request=$(curl -s --request POST \
  --url http://$KPTURE_URL/kpture/api/v1/kpture/k8s/namespace \
  --header 'Content-Type: application/json' \
  --data "$(generate_post_data)") 

uuid=$(echo $request | jq .uuid )
name=$(echo $request | jq .name )

echo $uuid > .current_capture_uuid
echo $name > .current_capture_name
echo $uuid $name
