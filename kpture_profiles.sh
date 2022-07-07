#!/bin/bash
curl --request GET -s --url http://$KPTURE_URL/kpture/api/v1/profiles | jq
