#!/usr/bin/env bash

# This is just enough of an install script for my current purposes.

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 BASE_URL" >&2
    echo "BASE_URL is the URL of the directory search.html is served from." >&2
    echo "Example: $0 https://alice.example.org" >&2
    exit 1
fi

base_url="${1%/}"

cp search.html ~/html/search.html
sed "s|https://example.com|${base_url}|" opensearch.xml > ~/html/opensearch.xml
chmod 644 ~/html/search.html ~/html/opensearch.xml
