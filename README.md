# IMPORTANT NOTE
Microsoft have announced the end of support for ADAL in June 2022 and I have stop updating this module, you should use MSAL or MSAL.PS instead! Sorry for the inconveniance. 

# Description

Powershell Module to connect to ADAL and to group API Authentication and connectivity cmdlet (AzureAD, Graph, EWS, etc.)

EWS is not yet implemented and will have it own module

# Project Setup Instructions
## Working with the layout

 - Don't touch the psm1 file
 - Place functions you export in `functions/` (can have subfolders)
 - Place private/internal functions invisible to the user in `internal/functions` (can have subfolders)
 - Don't add code directly to the `postimport.ps1` or `preimport.ps1`.
   Those files are designed to import other files only.
 - When adding files you load during `preimport.ps1`, be sure to add corresponding entries to `filesBefore.txt`.
   The text files are used as reference when compiling the module during the build script.
 - When adding files you load during `postimport.ps1`, be sure to add corresponding entries to `filesAfter.txt`.
   The text files are used as reference when compiling the module during the build script.

## Setting up CI/CD

> To create a PR validation pipeline, set up tasks like this:

 - Install Prerequisites (PowerShell Task; VSTS-Prerequisites.ps1)
 - Validate (PowerShell Task; VSTS-Validate.ps1)
 - Publish Test Results (Publish Test Results; NUnit format; Run no matter what)

> To create a build/publish pipeline, set up tasks like this:

 - Install Prerequisites (PowerShell Task; VSTS-Prerequisites.ps1)
 - Validate (PowerShell Task; VSTS-Validate.ps1)
 - Build (PowerShell Task; VSTS-Build.ps1)
 - Publish Test Results (Publish Test Results; NUnit format; Run no matter what)
