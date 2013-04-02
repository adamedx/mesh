# Starts a Mesh session

function mesh-start
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
        $sessionOption = new-pssessionoption -nomachineprofile
        $session = New-PSSession -Name "$sessionName" -sessionoption $sessionOption
        Invoke-Command -Session $session -ScriptBlock {param($workingdirectoryparameter) cd $workingdirectoryparameter} -ArgumentList $workingdirectory
        disconnect-pssession -instanceid $session.instanceid | out-null
        $session.instanceid.tostring()
    }
} 

mesh-start $args[0] $args[1]