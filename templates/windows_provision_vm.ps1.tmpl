## Format and Mount Data Disks
$disks = Get-Disk | Where partitionstyle -eq 'raw' | sort number

$letters = 70..89 | ForEach-Object { [char]$_ }
$count = 0
$label = "Data "

foreach ($disk in $disks) {
    $driveLetter = $letters[$count].ToString()
    $disk |
    Initialize-Disk -PartitionStyle GPT -PassThru |
    New-Partition -UseMaximumSize -DriveLetter $driveLetter |
    Format-Volume -FileSystem NTFS -NewFileSystemLabel $label$driveLetter -Confirm:$false -Force
$count++
}

## Add Softcatadmin user
New-LocalUser -AccountNeverExpires:$true -Password ( ConvertTo-SecureString -AsPlainText -Force ${password}) -Name 'softcatadmin' -Description "Softcat Administrator" 
Add-LocalGroupMember -Group "Administrators" -Member 'softcatadmin'
Add-LocalGroupMember -Group "Remote Desktop Users" -Member 'softcatadmin'
