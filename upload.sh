#!/bin/bash
# A script to upload a file to dropbox
for f in ./*.pdf; do
    basename=`basename $f`

    echo
    echo "Upload $basename to Dropbox"
    echo

    curl -X POST https://content.dropboxapi.com/2/files/upload \
        --header "Authorization: Bearer $DROPBOX_TOKEN" \
        --header "Dropbox-API-Arg: {\"path\": \"/$basename\",\"mode\": \"overwrite\",\"autorename\": true,\"mute\": false}" \
        --header "Content-Type: application/octet-stream" \
        --data-binary @$f \
        > /dev/null
done