# Lists methods of a class or instance

function mesh-list
{
    [CmdletBinding()]
    param
    (
         [String] $sessionId,
         [String] $workingdirectory,
         [String] $typename,
         [String] $objectid = $null
    )
    PROCESS
    {
        if ( $objectid -eq $null -or $objectid -eq '')
        {
            $classData = [System.Type]::GetType($typename) | get-member -static
            return $classData
        }

        $session = get-pssession -instanceid $sessionid
        
        if ($session.State -eq 'disconnected')
        {
            $session = connect-pssession -instanceid $sessionId
        }
        $typearg = "[{0}]" -f $typename         
        $staticarg = ''
        if ( $objectid -eq $null ) { $staticarg = '-static' }
        Invoke-Command -Session $session -ScriptBlock {param($workingdirectoryparameter,$typeparam) cd $workingdirectoryparameter; [System.Type]::GetType($typeparam) | get-member -static} -ArgumentList $workingdirectory,$typename
        if ($session -ne $null )
        {
            disconnect-pssession -session $session | out-null
        }
    }
} 


$objectarg=$null
if ( $args.length -ge 3 ) { $objectarg = $args[3]}
mesh-list $args[0] . $args[1] $objectarg
