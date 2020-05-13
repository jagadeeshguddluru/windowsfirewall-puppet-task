[CmdletBinding()]
param (
    #Displayname for rule
    [Parameter(Mandatory=$true)]
    [string[]]
    $displayname,
    #Direction for rule
    [Parameter(Mandatory=$true)]
    [string[]]
    $direction,
    #port for the rule
    [Parameter(Mandatory=$true)]
    [string[]]
    $port,
    # protocol for rule
    [Parameter(Mandatory=$true)]
    [string]
    $protocol,
    # Action to do
    [Parameter(Mandatory=$true)]
    [string[]]
    $action,
    # Remote address(scope)
    [Parameter(Mandatory=$false)]
    [string[]]
    $scope
)

New-NetFirewallRule -DisplayName "$displayname" -Direction $direction -LocalPort $port -Protocol $protocol -Action $action -RemoteAddress $scope

Restart-Service -Name MpsSvc
