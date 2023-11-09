# Check that the AD Module is installed
Get-Module -Name ActiveDirectory -ListAvailable

# Check out all commands inside the module
Get-Command -Module ActiveDirectory

# Check the Module is loaded into the current session
Get-Module ActiveDirectory

# Run a test to enusre you can read various objects

## Read a user account
Get-ADUser -Filter "samaccountname -eq 'batman'"

# Get a computer account
Get-ADComputer -Filter "Name -eq 'computer-name'"

# Read a group
Get-ADGroup -Filter "Name -eq 'Domain Admins'"

# How the AD Module displays attributes
Get-ADUser -Filter "samaccountname -eq 'batman'" | Select-Object *

# Must use the -Property parameter. This is unique to the AD Module
Get-ADUser -Filter "samaccountname -eq 'batman'" -Property *

# Region AD attributes do not match up 1:1 with AD module output
$adModuleUser = Get-AdUser -Filter "samaccountname -eq 'batman'" -Property *

# Last Logon as an example
$adModuleUser.lastLogonDate
$adModuleUser.PasswordLastSet
$adModuleUser.MemberOf

# Check that the AD Module is installed
Get-Module -Name ActiveDirectory -ListAvailable

# Check out all commandins inside the module
Get-Command -Module ActiveDirectory

# Check the Module is loaded into the current session
Get-Module ActiveDirectory

# AD Provider allows you to see the file structer of AD and browse through the files AD Health Checks
Get-PSProvider
Get-PSProvider -Provider ActiveDirectory

Get-PSDrive
Get-ChiledItem -Path C:\

# If you don't see the //RootDSE/ under the Root column then run rmo ActiveDirectory, then run Import Module -Name ActiveDirectory

Import-Module -Name ActiveDirctory
Get-PSProvider ActiveDirectory
Get-ChildItem -Path AD:\
Get-ChildItem -Path 'AD:\DC=lorem,DC=lorem,DC=com'