#active directory employee offboarding
#change < ... > info

#variables
$username=Read-Host "Enter username"
$path='OU=Disabled Users,DC=<domain controller name>,DC=local'

#imports AD module
Import-Module ActiveDirectory

#disables user
Disable-ADAccount -Identity $username

#moves user to Disabled Users folder
Get-ADUser $username | Move-ADObject -TargetPath $path
