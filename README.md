# NBlood Web

Браузерный порт **Blood** на движке [NBlood](https://github.com/NBlood/NBlood) (Emscripten).

**Живая демо:** https://retrogamescenter.ru/ports/nbloodweb/run.html

## Возможности

- Игра в браузере по HTTP (WebGL)
- Стартовый экран + **PLAY**, полоска загрузки `nblood.data`
- Сохранения в **IndexedDB** (`web/saves.js`)
- Параметр `?speed=0.22` — замедление таймеров (меню/интро)

## Сборка

1. Положите файлы Blood в [`gamefiles/`](gamefiles/README.md) (не коммитятся в Git).
2. Установите [Emscripten](https://emscripten.org/) (`emsdk` рядом с репо).
3. Запустите:

```powershell
.\scripts\build-web.ps1
```

Подробно: **[BUILD.md](BUILD.md)**

## Запуск локально

```powershell
cd web
python serve.py
```

→ http://127.0.0.1:8765/run.html

## Деплой

После сборки залейте на сервер **содержимое `web/`**:

`run.html`, `saves.js`, `indeximg.png`, `nblood.js`, `nblood.wasm`, `nblood.data`

## Репозиторий

| Путь | Описание |
|------|----------|
| `web/` | HTML/JS оболочка (`run.html`, `saves.js`) |
| `NBlood-r14353/` | NBlood с патчами под WASM |
| `gamefiles/` | Ваши ресурсы Blood (только локально) |
| `scripts/` | `build-web.ps1`, `build-web.sh` |
| `BUILD.md` | Полная инструкция по сборке |

**Не в репозитории:** `emsdk/`, готовые `nblood.data`, папка `release/`, автозапуск DZ.

## Лицензия

Код NBlood / EDuke32 — см. upstream. Контент игры Blood (RFF, ART, …) — собственность правообладателя; в репозиторий **не включается**, только инструкция, откуда взять файлы для **личной** сборки.

## Автор веб-сборки

[Carter54](https://t.me/gamebase54) · [GitHub](https://github.com/Carter54git)
