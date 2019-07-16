#params
param (
    [switch]$log = $false,
    [string]$comPort = 'COM5',
    [int32]$BAUD = 115200
)

Write-Output "Preparing COM connection"
Write-Output "Connection information"
Write-Output "    Port: $comPort"
Write-Output "    BAUD: $BAUD"
Write-Output "    Use-Log: $log"
$port = new-Object System.IO.Ports.SerialPort $comPort,$BAUD,None,8,one
$port.Open()
Write-Output "    Encoding: $($port.Encoding)"
Write-Output "Connected to port"
Write-Output "Press 'z' at any time to kill connection"
$continue = $true
$origpos = $host.UI.RawUI.CursorPosition
$counter = 0
while($continue){
    $counter ++
    if(!$log){ $host.UI.RawUI.CursorPosition = $origpos }
    $in = $port.ReadLine()
    Write-Output "$($counter) >>> $($in)"
    if($counter -ge 63){
        $counter = 0
        $toSend = Read-Host -Prompt "<<< "
        $port.WriteLine($toSend);
    }
    if([console]::KeyAvailable){
        $key = [System.Console]::ReadKey($false).key;
        switch($key){
            Z { $continue = $false }
        }
    }
}
Write-Output ""
Write-Output "Exiting"
$port.Close()
Write-Output "Port closed"
Write-Output "Remaining ports:"
[System.IO.Ports.SerialPort]::getportnames()