Windows Folder Size Batch Script

This repository contains a single Windows batch file that calculates the size of the current directory and automatically renames itself to include the used storage capacity in gigabytes (GB).

The script is designed to be double-clicked and relies only on standard Windows components that are available by default.

Purpose

The goal of this script is to provide a quick and visual way to see how much disk space a folder occupies — simply by looking at the batch file’s name after execution.

This is especially useful for:

Manual disk cleanup

Comparing folder sizes

Archiving or backup preparation

NAS or external drive organization

What the script does

Determines the total size of the current folder

Calculates the size in gigabytes (GB)

Applies a small correction factor for unit conversion

Removes formatting artifacts (spaces, locale issues)

Renames the batch file itself to include the calculated size

Example result
12.347GB_of_storage_capacity_used.bat


After execution, the filename itself reflects the folder’s size.

How it works (technical overview)

Uses VBScript (cscript.exe) and Scripting.FileSystemObject to read folder size

Performs numeric calculations and formatting using temporary .vbs files

Cleans up all temporary files automatically

Uses standard Windows batch features only (no external dependencies)

Temporary files are created in %TEMP% and deleted once execution is complete.

Usage

Copy the .bat file into the folder you want to analyze

Double-click the batch file

Wait a few seconds

The batch file renames itself to show the folder size in GB

No parameters or command-line usage are required.

Network drives and NAS (UNC paths)

When running batch files from network drives or NAS locations, Windows may display security warnings or block execution.

Recommended (safe) solution

Mark the network location as Local Intranet:

Internet Options → Security → Local Intranet → Sites → Advanced


Add your network share manually.
This enables execution without disabling Windows security features.

Alternative workaround (registry)

If you encounter errors such as:

UNC paths are not supported


You can add the following registry value:

HKEY_CURRENT_USER
  \Software
    \Microsoft
      \Command Processor
        DisableUNCCheck (REG_DWORD) = 1


⚠️ Use registry changes with care.

Limitations

Execution time depends on folder size and disk speed

Very large directories may take noticeable time to process

Precision is approximate (suitable for human-readable display, not accounting)

Requirements

Windows operating system

cscript.exe (included with Windows)

NTFS or FAT-compatible file system
