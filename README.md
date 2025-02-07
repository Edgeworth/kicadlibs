### Notes

kicad-footprints, kicad-packages3D, and kicad-symbols contain the libraries for KiCad. These are
named this way to match the default library names in KiCad.

snapeda.com often has symbols and footprints for components that are not in the default KiCad.

### How to add the library to kicad

Add to symbol and footprint libraries project libraries.

### How to import a symbol or footprint to the library

Open the symbol editor in kicad, right click on the library and import the *.kicad_sym file.

### Credits

Keyboard files: https://github.com/foostan/kbd/

### Individual file descriptions
*.step / *.wrl:
Files for 3D models of components.

*.pretty:
Group of footprints - contains .kicad_mod files.

*.kicad_mod:
Individual footprint definition.

*.kicad_sym:
Schematic symbol + metadata definition.

*.lib / *.dcm:
Legacy format for schematic symbols. The .lib file contains multiple symbols, while the .dcm file
contains metadata for the symbols.
