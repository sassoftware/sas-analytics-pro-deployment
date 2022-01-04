# Copyright © 2021, SAS Institute Inc., Cary, NC, USA.  All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Accept", "application/json, text/plain, */*")
$headers.Add("Content-Type", "application/x-www-form-urlencoded")
$headers.Add("Authorization", "Basic <your token base-encoded goes here>")

$body = "grant_type=client_credentials&scope=getCertificates%2BgetDepAssets%2BgetDepAssetsShort%2BgetLicense"

$response = Invoke-RestMethod 'https://api.sas.com/mysas/token' -Method 'POST' -Headers $headers -Body $body
$response | ConvertTo-Json
