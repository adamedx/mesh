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
        $session = connect-pssession -computername . -instanceid $sessionid
        remove-pssession -session $session
    }
} 

mesh-close $args[0]