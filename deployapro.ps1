# Copyright © 2021, SAS Institute Inc., Cary, NC, USA.  All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

 param (
    [string]$deploydir=$(pwd),
    [string]$ordernumber = $( Read-Host "Order Number, please" ),
    [string]$cadencename = $( Read-Host "Cadence name, please" ),
    [string]$cadenceversion = $( Read-Host "Cadence version, please" )
 )

echo "Your deployment directory is $deploydir"

$toks = & "$PSScriptRoot\getToken.ps1"

$token = $toks|ConvertFrom-Json
$tok =  $token.access_token

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Accept", "application/json, text/plain, */*")
$headers.Add("Authorization", "Bearer $tok")

$response = Invoke-RestMethod "https://api.sas.com/mysas/orders/$ordernumber/certificates" -ContentType "application/zip" -Method 'GET' -Headers $headers -OutFile certificates.zip

Expand-Archive -Path "$PSScriptRoot\certificates.zip"

$licence = Invoke-RestMethod "https://api.sas.com/mysas/orders/$ordernumber/cadenceNames/$cadencename/cadenceVersions/$cadenceversion/license" -ContentType "application/txt" -Method 'GET' -Headers $headers -OutFile licence.jwt

container-manager start --cadence-version $cadenceversion --cacert .\certificates\ca-certificates\SAS_CA_Certificate.pem  --cert .\certificates\entitlement-certificates\entitlement_certificate.pem  sas-analytics-pro --license-path .\licence.jwt --data-dir .\data 
