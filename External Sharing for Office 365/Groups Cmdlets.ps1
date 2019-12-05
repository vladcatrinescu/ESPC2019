$Setting = Get-AzureADDirectorySetting | where-object {$_.displayname -eq 'Group.Unified'}
$Setting.Values


$SettingTemplate = Get-AzureADDirectorySettingTemplate | where {$_.DisplayName -eq 'Group.Unified.Guest'} 
$NewSetting = $SettingTemplate.CreateDirectorySetting()
$NewSetting["AllowToAddGuests"]=$False

$Group = Get-AzureADGroup -SearchString "Office 365 Group Admins"
New-AzureADObjectSetting -TargetType Groups -TargetObjectId $Group.ObjectId -DirectorySetting $NewSetting
