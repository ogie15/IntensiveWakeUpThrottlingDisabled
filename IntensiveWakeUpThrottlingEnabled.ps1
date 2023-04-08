if (!(Get-ChildItem -Path HKLM:\SOFTWARE\Policies | Where-Object { $_.Name -match "Google" })) {

    New-Item â€“Path HKLM:\SOFTWARE\Policies â€“Name "Google"

    New-Item â€“Path HKLM:\SOFTWARE\Policies\Google â€“Name "Chrome"

    New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Google\Chrome -Name "IntensiveWakeUpThrottlingEnabled" -Value â€0â€ -PropertyType DWord

}
else {

    if (!(Get-ChildItem -Path HKLM:\SOFTWARE\Policies\Google | Where-Object { $_.Name -match "Chrome" })) {

        New-Item â€“Path HKLM:\SOFTWARE\Policies\Google â€“Name "Chrome"

        New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Google\Chrome -Name "IntensiveWakeUpThrottlingEnabled" -Value â€0â€ -PropertyType DWord

    }
    else {

        if (!(Get-ItemProperty -Path HKLM:\SOFTWARE\Policies\Google\Chrome -Name "IntensiveWakeUpThrottlingEnabled" -ErrorAction SilentlyContinue)) {

            New-ItemProperty -Path HKLM:\SOFTWARE\Policies\Google\Chrome -Name "IntensiveWakeUpThrottlingEnabled" -Value â€0â€ -PropertyType DWord
        }
        else {

            Set-ItemProperty -Path HKLM:\SOFTWARE\Policies\Google\Chrome -Name "IntensiveWakeUpThrottlingEnabled" -Type DWord -Value 0
        }
    }
}
