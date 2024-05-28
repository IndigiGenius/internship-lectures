$TEX=$args[0]

# ls *.aux -Recurse | foreach {rm $_}

write-host $TEX

# On certain machines, code will run again before the LaTeX file
# is rendered
Start-Sleep -Seconds 3

pdflatex $TEX
bibtex $TEX
pdflatex $TEX
pdflatex $TEX

# Information for shell output.
$TIME = Get-Date -Format "yyyy/MM/dd HH:mm K"
$SEP=""
for ($i=0; $i -le $TEX.length; $i++) {
    $SEP = $SEP + "-"
}

# Writing successful rendering of LaTex file.
write-host ""
write-host $SEP"----------------"
write-host "$TEX converted to pdf"
write-host "On $TIME."
write-host $SEP"----------------"
write-host ""
write-host ""

# Delete all auxiliary files and notify user.
ls *.aux -Recurse | foreach {rm $_}
write-host "aux files deleted."
write-host ""
