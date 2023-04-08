if (!(Get-ChildItem -Path HKLM:\SOFTWARE\Policies | Where-Object { $_.Name -match "Google" })) {

    New-Item –Path HKLM:\SOFTWARE\Policies –Name "Google"

    New-Item –Path HKLM:\SOFTWARE\Policies\Google –Name "Chrome"

    New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Google\Chrome -Name "IntensiveWakeUpThrottlingEnabled" -Value ”0” -PropertyType DWord

}
else {

    if (!(Get-ChildItem -Path HKLM:\SOFTWARE\Policies\Google | Where-Object { $_.Name -match "Chrome" })) {

        New-Item –Path HKLM:\SOFTWARE\Policies\Google –Name "Chrome"

        New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Google\Chrome -Name "IntensiveWakeUpThrottlingEnabled" -Value ”0” -PropertyType DWord

    }
    else {

        if (!(Get-ItemProperty -Path HKLM:\SOFTWARE\Policies\Google\Chrome -Name "IntensiveWakeUpThrottlingEnabled" -ErrorAction SilentlyContinue)) {

            New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Google\Chrome -Name "IntensiveWakeUpThrottlingEnabled" -Value ”0” -PropertyType DWord
        }
        else {

            Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Google\Chrome -Name "IntensiveWakeUpThrottlingEnabled" -Type DWord -Value 0
        }
    }
}
