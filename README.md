# Bright Future

An Omarchy theme. Dark-space duotone: an indigo-glass ground, one hot
magenta signal, one electric cyan depth. About 90% of every surface stays
dark — but the dark is a colour, not a void, and the accents behave like
light sources, not paint. Text warms as it brightens, as if the magenta were
doing the lighting; gaps and wallpaper sit a layer darker than the windows,
so the terminals read as lit panes above the scene.

![Bright Future, applied](screenshots/terminals.png)

The capture is real and reproducible: [`bin/shoot-terminals`](https://github.com/parker-brown-family/omarchy-bright-future-tools/blob/main/bin/shoot-terminals)
stages fastfetch, the omarchy palette preview and btop on a spare workspace,
shoots the monitor, and derives `preview.png` from the same frame.

## Install

```
omarchy theme install https://github.com/parker-brown-family/omarchy-bright-future-theme
```

Omarchy names it `bright-future` and applies it on install. Later:

```
omarchy theme set bright-future
```

This is a colours-only theme, the shape Omarchy 4 expects from installed
repos: terminal, btop, Hyprland, the generated Neovim/Helix/VS Code schemes,
lock screen and keyboard backlight all derive from [`colors.toml`](colors.toml)
through Omarchy's own templates. Active window borders run a magenta→cyan
gradient at 45° — the one place both accents meet.

## Palette

| Role | Hex | Where it lands |
|---|---|---|
| Signal — accent A | `#ff4fd1` | accent, magenta, active-border start, keyboard backlight |
| Depth — accent B | `#45e5ff` | active-border end; cyan family `#38d2f5` / `#7deeff` |
| Ground | `#131637` | background glass, over void shades `#0b0c19` / `#04040b`, raised `#1e2350` |
| Material | `#221f4e` / `#414780` | selection, muted lines, inactive borders |
| Text | `#d9cfe8` | foreground, from cool `#6b74a8` dim to warm `#fbf0fb` bright |

The full ANSI set lives in [`colors.toml`](colors.toml). The rules this
instance was cut from — role definitions, the 90/10 chroma budget, hue
separation, cross-pollination ratios — are in [`PALETTE.md`](PALETTE.md),
together with how to derive a sibling palette.

## Backgrounds

Five 4K wallpapers — different scenes, one colour physics. The accents behave
like light something in the world is producing, never like paint. The Omarchy
wordmark is drawn by [`wallpapers/render.sh`](https://github.com/parker-brown-family/omarchy-bright-future-tools/blob/main/wallpapers/render.sh)
(bash emits SVG and librsvg rasterises it). Four source renders are brought
onto the palette — one re-lit from grayscale, three conformed by
[`wallpapers/conform-sourced.sh`](https://github.com/parker-brown-family/omarchy-bright-future-tools/blob/main/wallpapers/conform-sourced.sh)
(fill-crop, chroma trim, floor crushed to the void). All four were generated
for this theme with GPT and processed locally; their retained source renders
live in [`backgrounds/src/`](backgrounds/src/).

- **Night shift** — GPT-rendered pixel art
  ([generation conversation](https://chatgpt.com/share/6a9e7cfa-38b4-83e8-91dc-2bb4e7c9d8b3),
  [`backgrounds/src/night-shift-src.png`](backgrounds/src/night-shift-src.png)),
  flattened to grayscale and regraded through a palette ramp by
  [`wallpapers/grade-night-shift.sh`](https://github.com/parker-brown-family/omarchy-bright-future-tools/blob/main/wallpapers/grade-night-shift.sh):
  indigo mass, cyan reticle, magenta doorway.
- **Low orbit** — the planet at night: a blue city-light network far below,
  magenta aurora walking the limb, one eclipsed sun. The rotation's loudest
  frame, deliberately.
- **Mountain portal** — signal mountain under a dark orb: magenta dawn on one
  horizon, cyan on the other, the galaxy split between them.
- **Prospector** — a mining rig chewing an asteroid open under a ringed
  planet. The only orange in the theme is the heat of the work.
- **Omarchy** — virtually black; the wordmark catches magenta light from the
  lower left and cyan from the upper right.

The rendered wallpapers are committed — rerun the scripts only to change the
art (needs librsvg and ImageMagick).

![Night shift](backgrounds/4-night-shift.png)

![Omarchy](backgrounds/omarchy.png)

## Tools

The scripts that render the wallpapers and shoot the preview live in their own
repository, [omarchy-bright-future-tools](https://github.com/parker-brown-family/omarchy-bright-future-tools), because a theme
carries no code. Clone it beside this one and the scripts find this checkout
themselves.

## License

MIT
