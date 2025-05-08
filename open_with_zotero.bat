@echo off
setlocal enabledelayedexpansion

:: Get the full path of the selected file from the first argument
set "filepath=%~1"

:: Get the parent folder
for %%F in ("%filepath%") do (
    for %%D in ("%%~dpF\.") do set "foldername=%%~nD"
)

:: Construct Zotero URI
set "zotero_uri=zotero://open-pdf/library/items/!foldername!"

:: Open the link
start "" "%zotero_uri%"