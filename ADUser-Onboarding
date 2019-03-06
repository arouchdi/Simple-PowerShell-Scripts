#active directory user onboarding

#variables
$firstName=Read-Host "Enter first name"
$lastName=Read-Host "Enter last name"
$department=Read-Host "Enter department (General, Closing, IT or Accounting)"
$ADOU='CN=Users,DC=geheren,DC=local'
$username=$firstName.substring(0,1).ToLower()+$lastName.ToLower()
$fullName=($firstName + " " + $lastName)

#department memberships
if($department="General"){
    $membership = "E Drive Access"
    }
if($department="Closing"){
    $membership = "E Drive Access", "Accounting Access"
    }
if($department="IT"){
    $membership = "E Drive Access", "E Drive Admin Access", "Accounting Access"
    }
if($department="Accounting"){
    $membership = "E Drive Access", "Accounting Access"
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
