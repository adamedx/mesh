# Executes a method

# Lists methods of a class or instance

function mesh-execute
{
    [CmdletBinding()]
    param
    (
         [String] $sessionId,
         [String] $typename,
         [String] $methodName
    )
    PROCESS
    {
        $classtype = [System.Type]::GetType($typename);
        return $classtype::$methodname.Invoke();

        $session = get-pssession -instanceid $sessionid
        
        if ($session.State -eq 'disconnected')
        {
            $session = connect-pssession -instanceid $sessionId
        }
        $staticarg = ''
        if ( $objectid -eq $null ) { $staticarg = '-static' }
        Invoke-Command -Session $session -ScriptBlock {param($workingdirectoryparameter, $typeparam,$methodparam) cd $workingdirectoryparameter; $classtype = [System.Type]::GetType($typeparam);$classtype::$methodparam.Invoke()} -ArgumentList $pwd,$typename,$methodname
        if ($session -ne $null )
        {
            disconnect-pssession -session $session | out-null
        }
    }
} 


mesh-execute $args[0] $args[1] $args[2]


