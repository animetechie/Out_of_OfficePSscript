# Import the Exchange Online PowerShell module
Import-Module ExchangeOnlineManagement

# Connect to Exchange Online
$UserCredential = Get-Credential
Connect-ExchangeOnline -Credential $UserCredential

# Get a list of all users with OOF enabled
$OOFUsers = Get-Mailbox -Filter {AutoReplyState -eq "Scheduled"} | Select-Object Name, Alias

# Disconnect from Exchange Online
Disconnect-ExchangeOnline

# Export the list of OOF users to a CSV file
$OOFUsers | Export-Csv -Path C:\OOFUsers.csv -NoTypeInformation
