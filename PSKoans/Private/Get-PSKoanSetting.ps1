function Get-PSKoanSetting {
    <#
    .SYNOPSIS
    Retrieves the configuration settings for PSKoans.

    .DESCRIPTION
    Retrieves configuration data via the PoshCode Configuration module. Module settings
    for PSKoans are stored in the user location / scope.

    .PARAMETER Name
    Specifies which setting values to retrieve.

    .EXAMPLE
    Get-PSKoanSetting -Name LibraryFolder

    Retrieves the library folder location (exposed to the user via Get-PSKoanLocation).
    #>

    [CmdletBinding()]
    param(
        [Parameter()]
        [string]
        $Name
    )

    $Configuration = if (-not (Test-Path $script:ConfigPath)) {
        # No settings file present, create file with default settings
        Set-PSKoanSetting -Settings $script:DefaultSettings
        [PSCustomObject]$script:DefaultSettings
    }
    else {
        Get-Content -Path $script:ConfigPath | ConvertFrom-Json
    }

    if ($Name) {
        $Configuration.$Name
    }
    else {
        $Configuration
    }
}
