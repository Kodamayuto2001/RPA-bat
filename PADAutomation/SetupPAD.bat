@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" %*&goto:eof

cd 'uiautomation\UIAutomation.0.8.7B3.NET40'

Import-Module .\UIAutomation.dll

[UIAutomation.Preferences]::Highlight = $true

Get-UiaWindow -AutomationId 'MainWindow' -Class 'Window' -Name 'Power Automate �p�b�P�[�W���C���X�g�[��' | `
Get-UiaButton -AutomationId 'PrimaryButton' -Class 'Button' -Name '����' | Invoke-UiaButtonClick