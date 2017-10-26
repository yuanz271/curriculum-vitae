#!/bin/bash
# A script to upload a file to dropbox
basename=`basename $1`

echo
echo "Upload $basename to Dropbox"
echo

curl -X POST https://content.dropboxapi.com/2/files/upload \
    --header "Authorization: Bearer $DROPBOX_TOKEN" \
    --header "Dropbox-API-Arg: {\"path\": \"/$basename\",\"mode\": \"overwrite\",\"autorename\": true,\"mute\": false}" \
    --header "Content-Type: application/octet-stream" \
    --data-binary @$1 \
    > /dev/null
