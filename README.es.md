<p align="center"><a href="https://www.curseforge.com/wow/addons/map-fix-forever"><img src="https://raw.githubusercontent.com/Pirson-s-Addons/.github/main/profile/assets/readme-mf-es.svg" width="100%" alt="Map Fix Forever"/></a></p>

<p align="center"><a href="README.md">English</a> · <b>Español</b></p>

<p align="center">
<a href="https://www.curseforge.com/wow/addons/map-fix-forever"><b>CurseForge</b></a> ·
<a href="https://github.com/Pirson-s-Addons/MapFixForever/releases/latest"><b>Descargar</b></a>
</p>

## Capturas

<table>
<tr>
<td align="center" width="50%"><img src="https://media.forgecdn.net/attachments/1957/882/mapnofixed-png.png" alt="Before: green map"><br><sub>Antes: mapa verde</sub></td>
<td align="center" width="50%"><img src="https://media.forgecdn.net/attachments/1957/883/mapfixed-png.png" alt="After: original map art"><br><sub>Después: mapa original</sub></td>
</tr>
</table>

## El problema

En WoW Forever (1.60.1), los mapas nuevos (mapa del mundo, Kalimdor, Durotar, Isla de Zephras, Hyjal y el resto de zonas redibujadas) solo se publicaron para el cliente en **inglés**. En cualquier otro idioma el cliente no los encuentra (`Logs/AsyncFile.log`: *"Can't find file in build manifest"*) y los pinta en **verde**, tanto el mapa de la zona como las zonas exploradas.

## Qué hace

**Map Fix Forever** lleva las **texturas originales del mapa** del cliente en inglés (build 1.60.1.69913, 1554 texturas en 55 carpetas de mapas) y las pone cada vez que el juego dibuja uno de esos mapas. El mapa se ve exactamente igual que en inglés, zonas exploradas incluidas.

- Sin configurar nada: instálalo y abre el mapa.
- En el cliente en inglés no toca el mapa del mundo (solo corre el arreglo del minimapa de abajo).
- Solo post-hooks: no reemplaza el código del mapa de Blizzard.

**Minimapa gris en Orgrimmar y Ventormenta** (build 1.60.1.70291, todos los idiomas): dentro de esas dos ciudades el minimapa sale gris claro y negro. El addon oculta el minimapa roto de la ciudad y pinta debajo las teselas del suelo que ya tiene el juego, siguiendo tu posición, el zoom y el giro del minimapa. Los iconos quedan encima. Fuera de esas ciudades no cambia nada.

## Comandos

- `/mapfix` — estado: cuántas texturas originales se están mostrando.
- `/mapfix on` / `/mapfix off` — activa o desactiva el arreglo.
- `/mapfix minimap` — activa o desactiva el arreglo del minimapa gris.

## Instalación

1. Descarga el zip de la [última release](https://github.com/Pirson-s-Addons/MapFixForever/releases/latest).
2. Extrae la carpeta `MapFixForever` en `World of Warcraft/_classic_beta_/Interface/AddOns/`.
3. Reinicia el juego y activa el addon.

Solo se carga en WoW Forever: sus `.toc` son `MapFixForever_Camelot.toc` (`Camelot` es el game type de Forever) y `MapFixForever.toc`, copia idéntica que necesita la app de CurseForge para detectarlo.

## Notas

- El addon pesa bastante (~52 MB en zip) porque lleva el arte del mapa.
- Las texturas del mapa son de Blizzard Entertainment. Se incluyen solo para que los clientes no ingleses vean el mismo mapa que ya tiene el cliente en inglés. Si Blizzard publica los mapas en todos los idiomas, este addon deja de hacer falta.

**Autor**: Pirson · [GitHub](https://github.com/Pirson-s-Addons) · [CurseForge](https://www.curseforge.com/members/pirson/projects) · Licencia MIT

<br/>

<p align="center"><a href="https://github.com/Pirson-s-Addons"><img src="https://raw.githubusercontent.com/Pirson-s-Addons/.github/main/profile/assets/readme-footer-es.svg" width="100%" alt="Parte de Pirson's Addons. Ver todos los addons."/></a></p>
