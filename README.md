# Super Mario World: Super Mario Advance 2 (U) disassembly

For assembling with [Armips](https://github.com/Kingcom/armips).

Produces an exact match for the entire ROM. All ROM pointers have been replaced by labels, to allow freely adding/removing code, though this hasn't yet been thoroughly tested.

Remaining regions:
- 0809FE4C-080D4020: Currently labeled as "single-cart pseudo-ROM", a ROM region copied into RAM (for all players) when playing Mario Bros. multiplayer from a single cartridge. This needs further research to determine the correct RAM pointers for labels, particularly for the single-cart data sectors (080A3978-080A8AD0, 080CB66C-080D4020).

## About data files
This repository does not include in-game data files (graphics, sound, etc), which must be extracted from the vanilla game before assembling. A script is provided to do so:
- Place the vanilla ROM in the directory containing the `sma2-disasm` directory
    - Optionally: name the vanilla ROM `sma2.gba`. If the vanilla ROM is the only .gba file in the directory, it will be auto-detected, but if there are multiple .gba files, this is required.
- Run `exportbin.py` (in `scripts`) to create the `data` folder.

## Vanilla ROM hashes
- SHA1: `5101DDF223D1D918928FE1F306B63A42ADA14A5E`
- SHA256: `63D9FFF04C635990A5C205A99EA64BFA698AA5CB9EC1333360063BBEE949A4F3`
- MD5: `2F660377581B7E48C06131F56C791B72`

## See also
- [Super Mario World (SMA2) (U) documentation](https://docs.google.com/spreadsheets/d/1kqZtiEGfrX4M4_u1m2l6BniEZsKL30p-jCrwGgrz6mw/) - Documentation spreadsheet, including ROM/RAM maps, various IDs, and other info
