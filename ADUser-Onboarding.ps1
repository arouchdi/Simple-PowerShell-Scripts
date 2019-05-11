#active directory user onboarding
#change < ... > info

#variables
$firstName=Read-Host "Enter first name"
$lastName=Read-Host "Enter last name"
$department=Read-Host "Enter department (<enter options here>)"
$ADOU='CN=Users,DC=<domain controller>,DC=local'
$username=$firstName.substring(0,1).ToLower()+$lastName.ToLower()
$fullName=($firstName + " " + $lastName)

#department shared folder access
if($department="<department>"){
    $membership = "<shared folder>"
    }
if($department="<department>"){
    $membership = "<shared folder>"
    }
if($department="<department>"){
    $membership = "<shared folder>"
    }

#imports AD module
Import-Module ActiveDirectory

#adds new user
New-ADUser -GivenName $firstName -Surname $lastName -Name $fullName -SamAccountName $username -Path $ADOU -AccountPassword(Read-Host -AsSecureString "Input Password") -Department $department -Enabled $true -ChangePasswordAtLogon $true

#adds new user to relevant groups
#Add-ADGroupMember -Identity $membership -Member $username
foreach ($group in $membership) {
    Add-ADGroupMember -Identity $group -Members $username
    }
