# NBlood Web

Browser port of **Blood** using [NBlood](https://github.com/NBlood/NBlood) (Emscripten).

**Live demo:** https://retrogamescenter.ru/ports/nbloodweb/run.html

## Features

- Play in the browser over HTTP (WebGL)
- Splash screen + **PLAY**, resource loading bar for `nblood.data`
- Saves in **IndexedDB** (`web/saves.js`)
- `?speed=0.22` — slows timers (menus / intro)

## Build

1. Put your Blood files in [`gamefiles/`](gamefiles/README.md) (not committed to Git).
2. Install [Emscripten](https://emscripten.org/) (`emsdk` next to the repo).
3. Run:

```powershell
.\scripts\build-web.ps1
```

Details: **[BUILD.md](BUILD.md)**

## Run locally

```powershell
cd web
python serve.py
```

→ http://127.0.0.1:8765/run.html

## Deploy

After building, upload **the contents of `web/`** to your server:

`run.html`, `saves.js`, `indeximg.png`, `nblood.js`, `nblood.wasm`, `nblood.data`

## Repository layout

| Path | Description |
|------|-------------|
| `web/` | HTML/JS shell (`run.html`, `saves.js`) |
| `NBlood-r14353/` | NBlood with WASM patches |
| `gamefiles/` | Your Blood assets (local only) |
| `scripts/` | `build-web.ps1`, `build-web.sh` |
| `BUILD.md` | Full build instructions |

**Not in the repo:** `emsdk/`, built `nblood.data`, `release/`, instant-start DZ variant.

## License

NBlood / EDuke32 code — see upstream. Blood game content (RFF, ART, …) belongs to the rights holder; it is **not** included here, only instructions for obtaining files for **your own** build.

## Web port author

[Carter54](https://t.me/gamebase54) · [GitHub](https://github.com/Carter54git)
