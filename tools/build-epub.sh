#!/usr/bin/env bash
# Pack the unzipped EPUB source in en/epub into build/faif-2.1-en.epub.
#
# OCF requires the mimetype file to be the very first zip entry, stored
# without compression. Everything else (META-INF, EPUB/, root xhtml files)
# is added afterwards; dotfiles, editor backups and OS droppings are
# excluded.
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
src="$root/en/epub"
out="$root/build/faif-2.1-en.epub"

mkdir -p "$root/build"
rm -f "$out"

cd "$src"
zip -q -X -0 "$out" mimetype
zip -q -r -X -9 "$out" . \
  -x mimetype -x '.*' -x '*/.*' -x '*~' -x '*.bak' -x '*.orig' \
  -x 'Thumbs.db' -x '*/Thumbs.db' -x 'desktop.ini' -x '*/desktop.ini' \
  -x '.DS_Store' -x '*/.DS_Store'

echo "built $out"
