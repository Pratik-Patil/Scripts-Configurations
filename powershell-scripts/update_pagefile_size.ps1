#!/bin/bash
# Program: PowerShell Script to update the size of pagefile.sys
# Developer: Pratik Patil
# Date: 29-June-2016
# Last Updated: 29-June-2016

$computersys = Get-WmiObject Win32_ComputerSystem -EnableAllPrivileges;
$computersys.AutomaticManagedPagefile = $False;
$computersys.Put();
$pagefile = Get-WmiObject -Query "Select * From Win32_PageFileSetting Where Name like '%pagefile.sys'";


$pagefile.InitialSize = <New_Value_For_Size_In_MB>;
$pagefile.MaximumSize = <New_Value_For_Size_In_MB>;

$pagefile.Put();
