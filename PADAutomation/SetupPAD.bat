@powershell -NoProfile -ExecutionPolicy Unrestricted "$s=[scriptblock]::create((gc \"%~f0\"|?{$_.readcount -gt 1})-join\"`n\");&$s" %*&goto:eof

cd 'uiautomation\UIAutomation.0.8.7B3.NET40'

Import-Module .\UIAutomation.dll

[UIAutomation.Preferences]::Highlight = $true

$start = Get-Date -format "yyyy/MM/dd HH:mm:ss"
$syncTime = 3
$old = 0
while ($true) {
    Start-Sleep -Milliseconds 500
    $total = [int](New-TimeSpan $start(Get-Date)).TotalSeconds

    if ($old -ne $total) {
        if ($total % $syncTime -eq 0) {
            try {
                Get-UiaWindow -AutomationId 'MainWindow' -Class 'Window' -Name 'Power Automate パッケージをインストール' | `
                Get-UiaButton -Class 'Button' -Name '次へ' | Invoke-UiaButtonClick
                Write-Host "「次へ」ボタンのクリックに成功"
                break
            }
            catch {
                Write-Host "「次へ」ボタンのクリックに失敗"
            }
        }

        #   20秒後に終了
        if ($total -eq 20) {
            break   
        }
    }
    $old = $total
}
