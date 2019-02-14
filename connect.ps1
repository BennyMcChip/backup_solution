
function ZipFiles( $zipfilename, $sourcedir )
{
   Add-Type -Assembly System.IO.Compression.FileSystem
   $compressionLevel = [System.IO.Compression.CompressionLevel]::Optimal
   [System.IO.Compression.ZipFile]::CreateFromDirectory($sourcedir,
        $zipfilename, $compressionLevel, $false)
}

function start-backup
{
$sourceDirectory  = "C:\Source\*"
$destinationDirectory = "C:\Destination\"

Copy-item -Force -Recurse -Verbose $sourceDirectory -Destination $destinationDirectory
ZipFiles $backup.zip $destinationDirectory

}


Invoke-Command -HostName Ubuntu1 -UserName hackerman -ScriptBlock {start-backup}
