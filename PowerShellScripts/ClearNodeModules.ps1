# TODO: Make it show the log messages on which folder it is working on

# Set the location
Set-Location -Path ..

# Delete node_modules folder
Get-ChildItem . -recurse -include node_modules | remove-item -recurse
