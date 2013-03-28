# PowerShell Profile for Mesh

if ( $args.length -ne 1 ) { throw "No home directory specified" }

$profilepath = $args[0]

$scripts = get-childitem "$profilepath" -filter "*.ps1"

foreach ( $script in $scripts )
{
    $scriptpath = $script.fullname
    . "$scriptpath"
}

