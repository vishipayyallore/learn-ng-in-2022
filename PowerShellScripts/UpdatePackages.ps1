# Description: Script to install/update the Packages inside all folders.
# Syntax (Particular Folder): .\UpdatePackages.ps1 -FolderName a11-ng-scroll-to-directive
# Syntax (All Folders): .\UpdatePackages.ps1 


param(
    [string]
    $FolderName
)


function Update-Packages {
    param ( $CurrentFolderName )

    Write-Host "***** Working on $($CurrentFolderName) *****"

    Set-Location -Path $($CurrentFolderName)
    npm install
    ng update @angular/cli @angular/core
    npm update
}

# Come back to PowerShellScripts folder
function Set-Home {
    Set-Location -Path ..\PowerShellScripts
}

if ( $FolderName ) {

    Update-Packages -CurrentFolderName ..\$($FolderName)

    Set-Home

    return
}

[string[]]$folderNames = Get-ChildItem -Directory -Path .. | Where-Object { $_.Name -ne "PowerShellScripts" }

Foreach ($currentFolder in $folderNames) {
    Update-Packages -CurrentFolderName ..\$($CurrentFolder)
}

Set-Home


