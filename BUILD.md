# Building NBlood Web

Windows (PowerShell). On Linux/macOS use the same steps via [scripts/build-web.sh](scripts/build-web.sh).

**Demo without building yourself:**  
https://retrogamescenter.ru/ports/nbloodweb/run.html

## Requirements

1. **Git** — https://git-scm.com/
2. **Emscripten SDK** — in `emsdk/` next to the repo (not in Git):
   ```powershell
   cd C:\Users\user\Desktop\bloodweb
   git clone https://github.com/emscripten-core/emsdk.git
   cd emsdk
   .\emsdk install latest
   .\emsdk activate latest
   ```
3. **Python 3** — for `serve.py` and emsdk tools
4. **GNU Make** — MSYS2: `pacman -S make`, or [GnuWin32](http://gnuwin32.sourceforge.net/packages/make.htm), or Make from MSYS2 on `PATH`
5. **Game files** — in `gamefiles/` ([list](gamefiles/README.md))

## Quick build (one script)

```powershell
cd C:\Users\user\Desktop\bloodweb
.\scripts\build-web.ps1
```

Options:

```powershell
.\scripts\build-web.ps1 -EmsdkRoot C:\Users\user\Desktop\bloodweb\emsdk
```

## Manual build

### 1. Game assets

Copy Blood files into `gamefiles/` (see [gamefiles/README.md](gamefiles/README.md)).

### 2. Stage for preload

```powershell
cd web
.\stage-gamefiles.ps1
```

Creates `web/gamedata/` — temporary copy used at link time.

### 3. Activate Emscripten

```powershell
cd ..\emsdk
.\emsdk_env.ps1
```

### 4. Compile NBlood → WASM

```powershell
cd ..\NBlood-r14353
make EMSCRIPTEN=1 HTML=0 web EMPRELOAD=../web/gamedata@/
```

Output in `NBlood-r14353/`:

- `nblood.js`
- `nblood.wasm`
- `nblood.data` (~61–65 MB)

### 5. Copy into `web/`

```powershell
Copy-Item nblood.js, nblood.wasm, nblood.data -Destination ..\web\ -Force
```

## Run locally

**HTTP only** (not `file://`):

```powershell
cd web
python serve.py
```

Open: http://127.0.0.1:8765/run.html

Speed tweak: `run.html?speed=0.22`

## Server deploy

Upload **everything in `web/`** after a successful build:

- `run.html`
- `saves.js`
- `indeximg.png`
- `nblood.js`, `nblood.wasm`, `nblood.data`

Example on RGC: `/ports/nbloodweb/` → `run.html` as in the [demo](https://retrogamescenter.ru/ports/nbloodweb/run.html).

## Troubleshooting

| Symptom | Likely cause |
|---------|----------------|
| Black screen, log missing `blood.rff` | Built without `EMPRELOAD` or mixed `nblood.data` from another build |
| Log shows `nblood.pk3` | Preload from wrong folder, not `gamefiles/` |
| Save slots `<Empty>` after F5 | Old shell without `saves.js` or without prefetch |
| `file://` does nothing | Use an HTTP server |

## Repository layout

```
bloodweb/
  gamefiles/          ← your Blood files (not in Git)
  web/                ← shell + build artifacts
  NBlood-r14353/      ← engine with Emscripten patches
  scripts/            ← build-web.ps1 / .sh
  emsdk/              ← local only, not in Git
```

## Patches vs upstream NBlood

`NBlood-r14353` includes browser changes: `EMSCRIPTEN` in `Common.mak`, `MODULARIZE`, `Module.syncSavesToDB` on save, Asyncify / main-loop tweaks in `baselayer.cpp` / `sdlayer.cpp`, etc. See this fork’s commit history for details.
