<p align="center"><a href="https://www.curseforge.com/wow/addons/map-fix-forever"><img src="https://raw.githubusercontent.com/Pirson-s-Addons/.github/main/profile/assets/readme-mf-en.svg" width="100%" alt="Map Fix Forever"/></a></p>

<p align="center"><b>English</b> · <a href="README.es.md">Español</a></p>

<p align="center">
<a href="https://www.curseforge.com/wow/addons/map-fix-forever"><b>CurseForge</b></a> ·
<a href="https://github.com/Pirson-s-Addons/MapFixForever/releases/latest"><b>Download</b></a>
</p>

## Screenshots

<table>
<tr>
<td align="center" width="50%"><img src="https://media.forgecdn.net/attachments/1957/882/mapnofixed-png.png" alt="Before: green map"><br><sub>Before: green map</sub></td>
<td align="center" width="50%"><img src="https://media.forgecdn.net/attachments/1957/883/mapfixed-png.png" alt="After: original map art"><br><sub>After: original map art</sub></td>
</tr>
</table>

## The problem

In the WoW Forever beta (1.60.1), the new world maps (the world map, Kalimdor, Durotar, Zephras Isle, Hyjal and the other redrawn zones) only shipped for **English** clients. In any other language the client can't find them (`Logs/AsyncFile.log`: *"Can't find file in build manifest"*) and draws them **solid green**, both the zone map and the explored areas.

## What it does

**Map Fix Forever** ships the **original map textures** of the English client (build 1.60.1.69913, 1554 textures in 55 map folders) and swaps them in whenever the game draws one of those maps. Your map looks exactly like it does in English, explored areas included.

- Nothing to set up: install it and open the map.
- On English clients the world map is left alone (only the minimap fix below runs).
- Only post-hooks: Blizzard's map code is never replaced.

**Grey minimap in Orgrimmar and Stormwind** (build 1.60.1.70291, every language): inside those two cities the minimap turns light grey and black. The addon hides the broken city minimap and draws the ground minimap tiles the game already has underneath, following your position, zoom and minimap rotation. Icons stay on top. Outside those cities nothing changes.

## Commands

- `/mapfix` — status: how many original textures are being shown.
- `/mapfix on` / `/mapfix off` — turn the fix on or off.
- `/mapfix minimap` — turn the grey minimap fix on or off.

## Installation

1. Download the zip from the [latest release](https://github.com/Pirson-s-Addons/MapFixForever/releases/latest).
2. Extract the `MapFixForever` folder into `World of Warcraft/_classic_beta_/Interface/AddOns/`.
3. Restart WoW and enable the addon.

It only loads on WoW Forever: its TOCs are `MapFixForever_Camelot.toc` (`Camelot` is Forever's game type) and `MapFixForever.toc`, an identical copy the CurseForge app needs to detect it.

## Notes

- The addon is large (~52 MB zipped) because it carries the map art.
- The map textures belong to Blizzard Entertainment. They are included only to show non-English clients the same map English clients already have. If Blizzard ships the maps for every language, this addon is no longer needed.

<br/>

<p align="center"><a href="https://github.com/Pirson-s-Addons"><img src="https://raw.githubusercontent.com/Pirson-s-Addons/.github/main/profile/assets/readme-footer-en.svg" width="100%" alt="Part of Pirson's Addons. See all addons."/></a></p>
