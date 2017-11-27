$service = Get-Service "nomad" -ErrorAction SilentlyContinue

if ($service) {
	if ($service.Status -eq "Running") {
		Write-Host "Stopping nomad process ..."
		net stop nomad | Out-Null
	}

	$service = Get-WmiObject -Class Win32_Service -Filter "Name='nomad'"
	$service.delete() | Out-Null
}

SchTasks.exe /Delete /F /TN "NomadLogrotate" 2>&1 | Out-Null

Write-Host "Removing C:\ProgramData\nomad\ ..."
takeown /f "C:\ProgramData\nomad\" /a /r /d Y | Out-Null
icacls "C:\ProgramData\nomad" /grant administrators:F /t | Out-Null
Remove-Item -Path "C:\ProgramData\nomad\" -Force -Recurse -ErrorAction SilentlyContinue | Out-Null
