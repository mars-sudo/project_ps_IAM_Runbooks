# What version of PowerShell are you running?
$PSVersionTable

##########################################

# Check your execution policy, then set an execution policy to run scripts
Get-ExecutionPolicy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

##########################################

# PowerShell follows a Verb-Noun for commands

# Ex. Verbs - New, Add, Set, Find, Search, Get, Read, Invoke, Start, Test
https://learn.microsoft.com/en-us/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands?view=powershell-7.3

# Ex. Nouns - Certificate, Bitlocker, DnsClient, Disk, Host, AzResourceGroup, 
https://learn.microsoft.com/en-us/powershell/utility-modules/psscriptanalyzer/rules/usesingularnouns?view=ps-modules

##########################################

# Core Commands
Get-Command # Designed to help locate commands
Get-Help # Designed to help with commands
Get-Member # Helps discover what objects, properties and methods are available for commands.

##########################################

# Example Get-Commands
Get-Command -Noun Process
Get-Command -Name *service*

##########################################

# Example Get-Help Commands
Get-Help -Name Get-Command -Full
Get-Help -Name Get-Command -Detailed
Get-Help -Name Get-Command -Examples
Get-Help -Name Get-Command -Online
Get-Help -Name Get-Command -Parameter Noun
Get-Help -Name Get-Command -ShowWindow
# To print Help on a separate window
help Get-Command -Full | Out-GridView

##########################################

# Example Get-Member 101 
# With Get-Memeber we can see all the Properties and Methods associated with an Object
# Objects - Objects have Properties and Methods.

# Example
# Object = car
# Properties = color, size, transmission.
# Methods = drive forward, driver reverse.  

# Let's create a Variable Object named $string, then see the Properties and Methods associated with Object
$string = Write-Output 'Hello World'
$string
$string | Get-Member # This will show you the 'Type' of object is 

# To reference any of the Get-Member Properties, use dot notation
$string.Length

# To reference any of the Get-Memeber Methods, use dot notation with parenthees
$string.ToUpper() # Empty parentheses means that thte method has no arguments
$string.ToLower()
$string.Replace('Hello','Goodbye')

# Building a powershell Hast Table - a group of key value pairs
$hashtable = @{Color = 'Red';Transmission ='Automatic'; Convertable =$false}

$hashtable | Get-Member # Here we will see the 'Type' of object is a System.Collections.Hashtable

[pscustomobject]$hashtable # This creates custom properties for the object. 

$car = [PSCustomObejct]$hashtable
$car | Get-Memeber # Here we will see the 'TypeName' of this object is now a PSCustomObject with the 3 properties created in the Hash Table


Get-Content -Path 'C:\Users\~' | ForEach-Object {[pscustomobject]@{ComputerName =$PSItem}} | Test-Connection

###############################
