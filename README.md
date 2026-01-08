# Windows Folder Size Batch Script

This repository contains a single Windows batch file that calculates the size of the current directory and automatically renames itself to include the used storage capacity in gigabytes (GB).

The script is intended to be double-clicked and uses only standard Windows components.

## Purpose

The purpose of this script is to provide a quick and visual way to determine how much disk space a folder occupies. After execution, the folder size is visible directly in the batch file name.

Typical use cases include manual disk cleanup, folder comparison, archive preparation, and storage analysis on local drives, external drives, or NAS systems.

## What the script does

- Calculates the total size of the current folder
- Converts the result to gigabytes (GB)
- Applies a small correction factor for unit conversion
- Cleans up formatting artifacts from numeric output
- Renames the batch file itself to include the calculated size

Example resulting filename:
12.347GB_of_storage_capacity_used.bat

## How it works

- Uses VBScript (cscript.exe) and Scripting.FileSystemObject to read the folder size
- Performs calculations and number formatting using temporary VBS files
- Automatically deletes all temporary files after execution
- Uses only built-in Windows tools, no external dependencies

Temporary files are created in the system %TEMP% directory.

## Usage

1. Place the batch file inside the folder you want to analyze
2. Double-click the batch file
3. Wait until execution finishes
4. The batch file renames itself to show the folder size in GB

No command-line arguments are required.

## Network drives and NAS (UNC paths)

When running batch files from network drives or NAS locations, Windows may display security warnings or block execution.

Recommended solution:
Add the network location to the Local Intranet zone using:
Internet Options → Security → Local Intranet → Sites → Advanced

Add the network share manually. This allows execution without disabling Windows security features.

Registry workaround:
If you encounter errors such as:
UNC paths are not supported

You can add the following registry value:
HKEY_CURRENT_USER\Software\Microsoft\Command Processor
DisableUNCCheck (REG_DWORD) = 1

Use registry changes with care.

## Limitations

- Execution time depends on folder size and disk performance
- Very large directories may take noticeable time to process
- Size calculation is approximate and intended for human-readable output

## Requirements

- Windows operating system
- cscript.exe (included with Windows)
- NTFS or FAT-compatible file system
