﻿<#
.SYNOPSIS
Find Azure Directory Authentication Librairy DLL

.DESCRIPTION
Find Azure Directory Authentication Librairy DLL from the installed module to prevent conflict
Install AzureAD PS Module if not installed

.PARAMETER InstallPreview
Switch to force the installation of AzureADPreview Module if no module are found.

.EXAMPLE
Return the Azure DLL Location
Get-AzureADDLL

.NOTES
TODO - Add dll in the bin folder and leverage this one if none are found
#>

Function Get-AzureADDLL
{
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [Switch]
        $InstallPreview
    )
    [array]$AzureADModules = Get-Module -ListAvailable | where-object {$_.name -eq "AzureAD" -or $_.name -eq "AzureADPreview"}
    Try
    {
        if($AzureADModules.count -eq 0 -and $InstallPreview -eq $True)
        {
            Install-Module AzureADPreview -Confirm:$False -Force
        }
        elseif($AzureADModules.count -eq 0)
        {
            Install-Module AzureAD -Confirm:$False -Force
        }
    }
    Catch
    {
        Throw "Can't find Azure AD DLL. Install the module manually 'Install-Module AzureAD'"
    }

    $AzureDLL = join-path (($AzureADModules | sort-object version -Descending | Select-object -first 1).Path | split-Path) Microsoft.IdentityModel.Clients.ActiveDirectory.dll
    Return $AzureDLL
}
