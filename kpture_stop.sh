#!/bin/bash

uuid=$(cat .current_capture_uuid | tr -d '"' )
name=$(cat .current_capture_name | tr -d '"' )

set -x
curl  --request PUT --url http://$KPTURE_URL/kpture/api/v1/kpture/$uuid/stop | jq 

sleep 2

wget http://$KPTURE_URL/kpture/api/v1/captures/default/$uuid/$name.tar


