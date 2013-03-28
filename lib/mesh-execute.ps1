# Executes a method

function mesh-execute
{
    [CmdletBinding()]
    param
    (
         [String] $workingdirectory,
         [String] $sessionName
#        [String] $username = $null,
#        [String] $location = "~"
    )
    PROCESS
    {
#    & net use z: \"\\\\vmware-host\\shared folders\"'
#        $session = New-PSSession -Name "$sessionName" -ComputerName .
#        Invoke-Command -Session $session -ScriptBlock {param($workingdirectoryparameter) cd $workingdirectoryparameter} -ArgumentList $workingdirectory
#        $session.instanceid.tostring()
    }
} 
