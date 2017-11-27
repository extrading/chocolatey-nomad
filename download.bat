if "%NOMAD_VERSION%"=="" exit /b 1
if exist binaries rmdir /s /q binaries
mkdir binaries
pushd binaries
curl -k -fsSL https://releases.hashicorp.com/nomad//nomad_%NOMAD_VERSION%/nomad_%NOMAD_VERSION%_windows_amd64.zip > %NOMAD_VERSION%_windows_amd64.zip
curl -k -fsSL https://releases.hashicorp.com/nomad//nomad_%NOMAD_VERSION%/nomad_%NOMAD_VERSION%_windows_386.zip > %NOMAD_VERSION%_windows_386.zip
curl -k -fsSL https://releases.hashicorp.com/nomad//nomad_%NOMAD_VERSION%/nomad_%NOMAD_VERSION%_SHA256SUMS > %NOMAD_VERSION%_SHA256SUMS
popd
