#!/usr/bin/env bash
# Dump the plain text of every content document in en/epub (tags stripped,
# entities decoded, whitespace collapsed) into the given output directory,
# one .txt per source file. Used to prove markup fixes don't touch the
# book's visible text:
#   tools/extract-text.sh build/text-before   # before fixing
#   tools/extract-text.sh build/text-after    # after fixing
#   diff -r build/text-before build/text-after
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
src="$root/en/epub"
outdir="${1:?usage: extract-text.sh <output-dir>}"
case "$outdir" in /*) ;; *) outdir="$root/$outdir" ;; esac

rm -rf "$outdir"
mkdir -p "$outdir"

python3 - "$src" "$outdir" <<'PY'
import html.parser
import pathlib
import re
import sys

src, outdir = map(pathlib.Path, sys.argv[1:3])


class TextDump(html.parser.HTMLParser):
    """Collect text nodes, skipping <script>/<style> contents."""

    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.parts = []
        self.skip = 0

    def handle_starttag(self, tag, attrs):
        if tag in ("script", "style"):
            self.skip += 1

    def handle_endtag(self, tag):
        if tag in ("script", "style") and self.skip:
            self.skip -= 1

    def handle_data(self, data):
        if not self.skip:
            self.parts.append(data)


for path in sorted(src.rglob("*")):
    if path.suffix.lower() not in (".html", ".xhtml", ".htm"):
        continue
    parser = TextDump()
    parser.feed(path.read_text(encoding="utf-8"))
    parser.close()
    text = re.sub(r"\s+", " ", "".join(parser.parts)).strip()
    rel = str(path.relative_to(src)).replace("/", "__")
    (outdir / (rel + ".txt")).write_text(text + "\n", encoding="utf-8")
PY

echo "extracted text to $outdir"
