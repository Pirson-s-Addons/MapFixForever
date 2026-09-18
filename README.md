<h1 align="center">Map Fix Forever</h1>

<p align="center">
  <b>No more green world map in non-English World of Warcraft: Forever clients</b>
</p>

<p align="center">
<a href="https://github.com/Pirson-s-Addons/MapFixForever/releases/latest">
<img src="https://img.shields.io/github/v/release/Pirson-s-Addons/MapFixForever?style=for-the-badge&color=A78BFA">
</a>
<img src="https://img.shields.io/badge/WoW_Forever-1.60.1-C4B5FD?style=for-the-badge">
<a href="LICENSE">
<img src="https://img.shields.io/badge/License-MIT-E9D5FF?style=for-the-badge">
</a>
</p>

<p align="center">
<a href="#-español">🇪🇸 Español</a>
</p>

---

## The problem

In the WoW Forever beta (1.60.1), the new world maps (the world map, Kalimdor, Durotar, Zephras Isle, Hyjal and the other redrawn zones) only shipped for **English** clients. In any other language the client can't find them (`Logs/AsyncFile.log`: *"Can't find file in build manifest"*) and draws them **solid green**, both the zone map and the explored areas.

## What it does

**Map Fix Forever** ships the **original map textures** of the English client (build 1.60.1.69913, 1554 textures in 55 map folders) and swaps them in whenever the game draws one of those maps. Your map looks exactly like it does in English, explored areas included.

- Nothing to set up: install it and open the map.
- On English clients it does nothing.
- Only post-hooks: Blizzard's map code is never replaced.

## Installation

1. Download the zip from the [latest release](https://github.com/Pirson-s-Addons/MapFixForever/releases/latest).
2. Extract the `MapFixForever` folder into `World of Warcraft/_classic_beta_/Interface/AddOns/`.
3. Restart WoW and enable the addon.

It only loads on WoW Forever: the only TOC is `MapFixForever_Camelot.toc` (`Camelot` is Forever's game type).

## Commands

- `/mapfix` — status: how many original textures are being shown.
- `/mapfix on` / `/mapfix off` — turn the fix on or off.

## Notes

- The addon is large (~52 MB zipped) because it carries the map art.
- The map textures belong to Blizzard Entertainment. They are included only to show non-English clients the same map English clients already have. If Blizzard ships the maps for every language, this addon is no longer needed.

---

## 🇪🇸 Español

### El problema

En la beta de WoW Forever (1.60.1), los mapas nuevos (mapa del mundo, Kalimdor, Durotar, Isla de Zephras, Hyjal y el resto de zonas redibujadas) solo se publicaron para el cliente en **inglés**. En cualquier otro idioma el cliente no los encuentra (`Logs/AsyncFile.log`: *"Can't find file in build manifest"*) y los pinta en **verde**, tanto el mapa de la zona como las zonas exploradas.

### Qué hace

**Map Fix Forever** lleva las **texturas originales del mapa** del cliente en inglés (build 1.60.1.69913, 1554 texturas en 55 carpetas de mapas) y las pone cada vez que el juego dibuja uno de esos mapas. El mapa se ve exactamente igual que en inglés, zonas exploradas incluidas.

- Sin configurar nada: instálalo y abre el mapa.
- En el cliente en inglés no hace nada.
- Solo post-hooks: no reemplaza el código del mapa de Blizzard.

### Instalación

1. Descarga el zip de la [última release](https://github.com/Pirson-s-Addons/MapFixForever/releases/latest).
2. Extrae la carpeta `MapFixForever` en `World of Warcraft/_classic_beta_/Interface/AddOns/`.
3. Reinicia el juego y activa el addon.

Solo se carga en WoW Forever: su único `.toc` es `MapFixForever_Camelot.toc` (`Camelot` es el game type de Forever).

### Comandos

- `/mapfix` — estado: cuántas texturas originales se están mostrando.
- `/mapfix on` / `/mapfix off` — activa o desactiva el arreglo.

### Notas

- El addon pesa bastante (~52 MB en zip) porque lleva el arte del mapa.
- Las texturas del mapa son de Blizzard Entertainment. Se incluyen solo para que los clientes no ingleses vean el mismo mapa que ya tiene el cliente en inglés. Si Blizzard publica los mapas en todos los idiomas, este addon deja de hacer falta.

---

**Author**: Pirson · [GitHub](https://github.com/Pirson-s-Addons) · [CurseForge](https://www.curseforge.com/members/pirson/projects) · MIT License
