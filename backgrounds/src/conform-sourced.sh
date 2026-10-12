#!/usr/bin/env bash
# Conforms the generated-in-palette sourced wallpapers (already dual-accent:
# magenta/cyan over black mass) to the theme: fill-crop to 4K, trim the chroma
# budget, and crush the floor to the void. Unlike night-shift these are NOT
# regraded through a CLUT — a grayscale ramp would destroy the two-hue split
# that makes them ours. Dep: imagemagick. WebPs are committed (q82, metadata
# stripped: about a twentieth of the PNGs they replaced); rerun to retune.
set -euo pipefail

SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
BG_DIR="$(dirname "$SRC_DIR")"

conform() { # src out brightness% saturation% [shave WxH — baked-in frame edges]
  magick "$SRC_DIR/$1" -shave "${5:-0x0}" \
    -resize 3840x2160^ -gravity center -extent 3840x2160 \
    -modulate "$3,$4,100" -level '1%,100%' -strip -quality 82 "$BG_DIR/$2"
  echo "Rendered: $BG_DIR/$2"
}

# Loud frames: pull them back toward the 90/10 budget.
conform low-orbit-src.png 5-low-orbit.webp 88 86
# Already near-black; just seat the floor.
conform mountain-portal-src.png 6-mountain-portal.webp 96 94
# 4:3 with a baked CRT vignette: the height crop eats the top/bottom frame,
# the shave takes the side strips; loudest sky of the set, firmest trim.
conform prospector-src.png 7-prospector.webp 86 84 12x0
