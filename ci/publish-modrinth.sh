#!/usr/bin/env bash

set -ex

PROJECT_NAME="Innovation Timespace 7"
PROJECT_ID="bchAhFQi"

TAG_VERSION=${TAG_NAME:1}

CHANGELOG="$(cat "changelogs/changelog-$TAG_NAME.md" | jq -Rsa .)"

read -r -d '' CREATE_VERSION_JSON <<EOF
{
    "name": "$PROJECT_NAME $TAG_NAME",
    "version_number": "$TAG_VERSION",
    "changelog": "$CHANGELOG",
    "dependencies": [],
    "game_versions": [
        "1.20.1"
    ],
    "version_type": "alpha",
    "loaders": [
        "quilt"
    ],
    "featured": false,
    "status": "listed",
    "requested_status": "listed",
    "project_id": "$PROJECT_ID",
    "file_parts": [
        "file"
    ],
    "primary_file": "file"
}
EOF

echo "Sending Request:"
echo "$CREATE_VERSION_JSON"

FILENAME="$PROJECT_NAME-$TAG_VERSION.mrpack"

echo "Getting Response"
curl -H "Authorization: $MODRINTH_TOKEN" -F "data=$CREATE_VERSION_JSON" -F file=@"$FILENAME" 'https://api.modrinth.com/v2/version'

