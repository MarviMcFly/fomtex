$timestamp = "$(Get-Date -Format yyyyMMddHHmmss)"
$builddir = "_build"
$buildpath = ".\_build\$timestamp"

# Check if build path exists
if(!(Test-Path $builddir -PathType Leaf))
{
	Write-Host "Creating parent folder 'build'"
	New-Item -Path ".\" -Name "$builddir" -ItemType "Directory"
}

# Creating current build folder
Write-Host "Creating folder '$buildpath'"
New-Item -Path "$builddir" -Name "$timestamp" -ItemType "Directory"

# First compile of the document
pdflatex -synctex=1 -interaction=nonstopmode -output-directory="$buildpath" main.tex

# Compile library / make bibliography
# This command also seems to create the indices
biber "$buildpath\main.bcf"

# Create the glossarie especially for the accronym glossarie
makeglossaries -d "$buildpath" main

# Last time to compile document with all component (ducktaping all together)
pdflatex -synctex=1 -interaction=nonstopmode -output-directory="$buildpath" main.tex

# copy and cleanup dosacuments
Copy-Item -Force "$buildpath\main.pdf" ".\main.pdf"
Rename-Item -Path "$buildpath\main.pdf" -NewName "$($timestamp)_main.pdf"

