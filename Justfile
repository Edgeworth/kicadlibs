alias c := check
alias u := upgrade-files

default:
  @just --list

# Ensure kicad-library-utils is up-to-date
tools:
  [ -d kicad-library-utils ] || git clone --depth 1 https://gitlab.com/kicad/libraries/kicad-library-utils.git
  cd kicad-library-utils && git pull

# Update all files to latest format version.
upgrade-files:
  find kicad-symbols -name '*.kicad_sym' -exec kicad-cli sym upgrade {} \;

# Check symbols
check-symbols: tools
  python kicad-library-utils/klc-check/check_symbol.py -v kicad-symbols/*.kicad_sym

# Check symbol library table
check-symbols-lib-table: tools
  python kicad-library-utils/klc-check/check_lib_table.py -v kicad-symbols/*.kicad_sym \
    --table kicad-symbols/sym-lib-table

# Check footprints
check-footprints: tools
  python kicad-library-utils/klc-check/check_footprint.py -v kicad-footprints/*.pretty/*.kicad_mod

# Check footprint library table
check-footprints-lib-table: tools
  python kicad-library-utils/klc-check/check_lib_table.py -v kicad-footprints/*.pretty \
    --table kicad-footprints/fp-lib-table

# Check all 3D models
check-3d-models: tools
  python kicad-library-utils/packages3d/check_3dmodels.py -v --pretty kicad-footprints/*.pretty \
    --models kicad-packages3D/*

# Check for footprints with missing 3D models
check-3d-coverage: tools
  python kicad-library-utils/klc-check/check_3d_coverage.py -v --models kicad-packages3D \
    --footprints kicad-footprints --root .

check: \
  check-symbols \
  check-symbols-lib-table \
  check-footprints \
  check-footprints-lib-table \
  check-3d-models \
  check-3d-coverage
