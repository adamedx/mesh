# Lists methods of a class or instance

function mesh-list
{
    [CmdletBinding()]
    param
    (
         [String] $workingdirectory,
         [String] $sessionId,
         [String] $typename,
         [String] $objectid
    )
    PROCESS
    {
        $session = get-pssession -instanceid $sessionId
        $typearg = "[{0}]" -f $typename         
        Invoke-Command -Session $session -ScriptBlock {param($workingdirectoryparameter,$typeparam) cd $workingdirectoryparameter; $typeparam | get-member} -ArgumentList $workingdirectory,$typearg
    }
} 
