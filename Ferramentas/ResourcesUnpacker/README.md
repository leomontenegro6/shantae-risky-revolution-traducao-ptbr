# ResourcesUnpacker

This is a tool used to unpack all graphic assets from the game, to facilitate editing. It was created by TheExentist, to help translating this game to russian and other languages.

## Usage

In order to work in the GBA version, firstly we need to extract all data from the GBA ROM between the offsets 0x337674 and 0xE5166B and put it in a file. Then, assuming the file is named as "Resources.txt" for example, You simply run the tool passing the path of this file as a parameter:

`.\ResourcesUnpacker.exe Resources.txt`

That will generate a folder called "Resources", and all individual graphic files will be extracted to it, named as sequential numbers from 0 to 744. The graphics can be edited either with the [ashantae](../ashantae/README.md) tool, or with any tile editor out there, like [Tile Molester](https://github.com/toruzz/TileMolester) for example. To help finding which graphics contain texts to edit for translation purposes, see the [Offsets Assets.csv](<Offsets Assets.csv>) file in this folder.

To repack it back, you simply run the tool passing the path of the "Resources" folder as a parameter:

`.\ResourcesUnpacker.exe Resources`

That will repack all its contents back to a "Resources.txt" file, that you'll need to insert back to the GBA ROM in the offset 0x337674. There are multiple ways this can be done, but an easy one is using [armips](https://github.com/Kingcom/armips):

```arm
.gba
.open "sarr.gba", 0x08000000

.org 0x08337674
    .incbin "Resources.txt"

.close
```