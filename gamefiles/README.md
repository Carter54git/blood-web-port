# Game assets for the build

Place your **legally owned** copy of Blood here (GOG, Steam, 1.21 CD).  
These files are packed into `nblood.data` at build time (Emscripten preload).  
**They are not committed to Git** — only this README is.

## Required files

Copy from your game install into `gamefiles/` (names as shipped; case-insensitive on Windows):

| File | Purpose |
|------|---------|
| `BLOOD.INI` | Config |
| `BLOOD.RFF` | Main game archive |
| `GUI.RFF` | UI |
| `SOUNDS.RFF` | Sound |
| `SURFACE.DAT` | Surfaces |
| `TABLES.DAT` | Tables |
| `VOXEL.DAT` | Voxels |
| `TILES000.ART` … `TILES017.ART` | Level graphics (all 18 files) |

## Recommended

| File | Purpose |
|------|---------|
| `BLOOD000.DEM` … `BLOOD003.DEM` | Demo recordings |
| `BLOOD.CFG` | Settings (if present) |
| `COMMIT.DAT` | COMMIT data (if present) |

## Optional

- `movie/` folder — cutscenes (GOG/CD)
- Cryptic Passage: `CRYPTIC.INI`, `CP*.MAP`, etc. (see [NBlood README](../NBlood-r14353/README.md))
- `bloodXX.ogg` / `bloodXX.flac` — Redbook music instead of MIDI

## Verify before building

From the repo root:

```powershell
Test-Path gamefiles\blood.rff
Test-Path gamefiles\blood.ini
```

Both should return `True`.

## Important

- Do **not** preload from third-party packs using `nblood.pk3` or other file sets — this web build expects the **classic Blood 1.21** layout (`blood.rff`, `tiles*.art`).
- Do **not** redistribute RFF/ART in a public repo; only deploy your own built `nblood.data` if you have the right to host it.
