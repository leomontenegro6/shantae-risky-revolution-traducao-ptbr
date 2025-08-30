# WayForward format tool for DSi

This is a tool used to extract and reconstruct different graphic formats used in Shantae games, like ANM, TS4 and TS8 for example. Works in conjunction with [ResourcesUnpacker](../ResourcesUnpacker/README.md), since we need to first unpack graphic assets, and only then use this tool to convert them to editable PNG files.

It was created by nikvoid, to help translating this game to russian and other languages.

## Usage

Usage: ashantae.exe <COMMAND>

Commands:
  anm-extract      Extract ANM file
  anm-reconstruct  Reconstruct ANM file
  tsx-extract      Extract TS4/8 + LYR file
  tsx-reconstruct  Reconstruct TS4/8 + LYR files from extracted folder
  help             Print this message or the help of the given subcommand(s)

Options:
  -h, --help  Print help (see more with '--help')