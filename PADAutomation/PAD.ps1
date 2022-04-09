#   管理者権限で実行
# if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators")) { Start-Process powershell.exe "-File `"$PSCommandPath`" $Args" -Verb RunAs; exit }

# $flowName = $Args[0]

# Write-Host $flowName'を開始します。'

# if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole("Administrators"))
# {
# Start-Process powershell.exe "-File `"$PSCommandPath`"" -Verb RunAs
# exit
# }

# Start-Sleep 5

# Set-ExecutionPolicy RemoteSigned
# tscon (((Query Session |  Where {$_ -match "$env:UserName"}) -split '\s+')[2]) /dest:console

# Import-Module C:\UIAutomation.0.8.7B3.NET40\UIAutomation.dll

# $PADConsoleHostExePath = "C:\Program Files (x86)\Power Automate Desktop\PAD.Console.Host.exe"
# $PADConsoleHostExePath = "D:\workspace\power automate desktop\PAD.Console.Host.exe"

# Start-Process $PADConsoleHostExePath

# [UIAutomation.Preferences]::Highlight = $true

# Get-UiaWindow -AutomationId 'ConsoleMainWindow' -Class 'WinAutomationWindow' -Name 'Power Automate' | `
#     Get-UiaCustom -Class 'ModalManager' | `
#     Get-UiaCustom -Class 'ProcessesToolBarView' | `
#     Get-UiaEdit -AutomationId 'SearchFlowTextField' -Class 'TextBox' -Name 'フローの検索' | Set-UiaEditText -Text $flowName

# Get-UiaWindow -AutomationId 'ConsoleMainWindow' -Class 'WinAutomationWindow' -Name 'Power Automate' | `
#     Get-UiaCustom -Class 'ModalManager' | `
#     Get-UiaCustom -AutomationId '' -Class 'ProcessesView' -Name '' | `
#     Get-UiaDataGrid -AutomationId 'MyFlowsListGrid' -Class 'DataGrid' | `
#     Get-UiaDataItem -Name $flowName -Class 'DataGridRow' | `
#     Get-UiaCustom -Name $flowName -Class 'DataGridCell' | `
#     Get-UiaButton -Name '実行' -Class 'Button' | Invoke-UiaButtonClick

# Get-UiaWindow -AutomationId 'ConsoleMainWindow' -Class 'WinAutomationWindow' -Name 'Power Automate' | `
#     Get-UiaCustom -Class 'ModalManager' | `
#     Get-UiaCustom -Class 'ProcessesToolBarView' | `
#     Get-UiaEdit -AutomationId 'SearchFlowTextField' -Class 'TextBox' -Name 'フローの検索' | Set-UiaEditText -Text ''

# Start-Process Setup.Microsoft.PowerAutomate.exe
# Start-Process .\uiautomation\Manager.bat

# $path = (Convert-Path .)
# Write-Host $path

.\PADInstall.bat
.\SetMinSizeCmd.bat | Out-Null
.\StartSetupPAD.bat

.\downloader.bat | Out-Null