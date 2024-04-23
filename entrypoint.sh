#!/bin/sh
set -e

if [ "$(printf '%s' "$1" | cut -c 1)" = '-' ]; then
	set -- nscan "$@"
fi

exec "$@"
