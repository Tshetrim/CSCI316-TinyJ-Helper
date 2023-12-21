$javaPath = "TJasn.TJ"
$sourceFile = $args[0]
$outputFile = $args[1]

# Configure the process start information
$psi = New-Object System.Diagnostics.ProcessStartInfo
$psi.FileName = "java"
$psi.Arguments = "-cp . $javaPath $sourceFile $outputFile"
$psi.RedirectStandardInput = $true
$psi.RedirectStandardOutput = $true
$psi.RedirectStandardError = $true
$psi.UseShellExecute = $false

# Start the process
$process = New-Object System.Diagnostics.Process
$process.StartInfo = $psi
$process.Start() | Out-Null

# Send the input to the process, waiting a bit after each
$process.StandardInput.WriteLine("n")
$process.StandardInput.Close()

# Capture and display the output
$output = $process.StandardOutput.ReadToEnd()
Write-Host $output
$process.WaitForExit()
$process.Close()
