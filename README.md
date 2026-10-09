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
<a href="README.es.md">🇪🇸 Español</a>
</p>

---

## 📸 Screenshots

<table>
<tr>
<td align="center" width="50%"><img src="https://media.forgecdn.net/attachments/1957/882/mapnofixed-png.png" alt="Before: green map"><br><sub>Before: green map</sub></td>
<td align="center" width="50%"><img src="https://media.forgecdn.net/attachments/1957/883/mapfixed-png.png" alt="After: original map art"><br><sub>After: original map art</sub></td>
</tr>
</table>

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

It only loads on WoW Forever: its TOCs are `MapFixForever_Camelot.toc` (`Camelot` is Forever's game type) and `MapFixForever.toc`, an identical copy the CurseForge app needs to detect it.

## Commands

- `/mapfix` — status: how many original textures are being shown.
- `/mapfix on` / `/mapfix off` — turn the fix on or off.

## Notes

- The addon is large (~52 MB zipped) because it carries the map art.
- The map textures belong to Blizzard Entertainment. They are included only to show non-English clients the same map English clients already have. If Blizzard ships the maps for every language, this addon is no longer needed.

---

**Author**: Pirson · [GitHub](https://github.com/Pirson-s-Addons) · [CurseForge](https://www.curseforge.com/members/pirson/projects) · MIT License
