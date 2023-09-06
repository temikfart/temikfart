#!/bin/sh

# Options:
filename="<filename>"
lang="<en|ru>=en"
bibflag="<0|1>=0"

# Usage
usage() {
    printf "Usage: $0 %s [%s] [%s]\n" $filename $lang $bibflag
    printf "where\n"
    printf "%15s  filename of main Tex file without extension.\n" $filename
    printf "%15s  choose language for words wrap support.\n" $lang
    printf "%15s  disable or enable bibliography compilation.\n" $bibflag
    exit 1;
}

# Check, that filename is present.
if [[ $1 == "" ]] ; then
    usage;
    exit 1;
fi

# Check, that Tex file exists.
if [[ ! -f "$1.tex" ]] ; then
    echo "ERROR: File $1.tex does not exist.";
    exit 1;
fi

# Check, that language is supported.
if [[ $2 != "" && $2 != "ru" && $2 != "en" ]] ; then
    echo "ERROR: Language '$2' is unsupported."
    exit 1;
fi

### Compilation ###
# 1. Remove old build directory.
rm -rf build

# 2. CMake the project.
INTFILES_DIR="intfiles"
cmake -S . -B build \
    -DMAIN_TEX_BASE_FILENAME="$1" \
    -DRUSSIAN_SUPPORT="$2" \
    -DWITH_BIBLIOGRAPHY=$3 \
    -DLATEX_OUTPUT_PATH=$INTFILES_DIR

# 3. Make the project.
cd build && make && cd ..

# 4. Move PDF to the special directory
RESULT_DIR="pdf"
if [[ ! -d $RESULT_DIR ]] ; then
    mkdir $RESULT_DIR
fi
cp "$INTFILES_DIR/$1.pdf" "$RESULT_DIR/$1.pdf"

# 5. Remove build directories
rm -rf build && rm -rf $INTFILES_DIR

