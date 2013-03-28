# Closes a Mesh session

function mesh-close
{
    [CmdletBinding()]
    param
    (
         [String] $sessionId
#        [String] $username = $null,
#        [String] $location = "~"
    )
    PROCESS
    {
        remove-pssession -instanceid $sessionid
    }
} 

mesh-close $args[0]