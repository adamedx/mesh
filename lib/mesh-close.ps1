# Starts a Mesh session

function mesh-start
{
    [CmdletBinding()]
    param
    (
         [String] $profilePath
#         [String] $sessionName = "",
#        [String] $username = $null,
#        [String] $location = "~"
    )
    PROCESS
    {
        $session = New-PSSession -ComputerName .
        Invoke-Command -Session $session -ScriptBlock {param($profilePathParameter) cd $remotelocation} -ArgumentList $location
        $session
    }
} 