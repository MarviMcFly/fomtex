timestamp="$(date +%Y%m%d%H%M%S)"
buildpath="./.build/$timestamp"

# Check if build path exists
if ! [[ -d "./.build" ]]; 
then
  echo "Creating parent folder 'build'"
  mkdir ./.build
fi

# Creating current build folder
echo "Creating folder '$buildpath'"
mkdir $buildpath

# First compile of the document
pdflatex -synctex=1 -interaction=nonstopmode -output-directory=$buildpath main.tex

# Compile library / make bibliography
# This command also seems to create the indices
biber $buildpath/main.bcf 

# Create the glossarie especially for the accronym glossarie
makeglossaries -d $buildpath main

# Last time to compile document with all component (ducktaping all together)
pdflatex -synctex=1 -interaction=nonstopmode -output-directory=$buildpath main.tex

# copy and cleanup documents
cp $buildpath/main.pdf $buildpath/"$timestamp"_main.pdf
mv -f $buildpath/main.pdf ./main.pdf

xdg-open ./main.pdf
