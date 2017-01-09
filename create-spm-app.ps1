 foreach ($appname in $servers.Split("`n"))
 {
  $semaTextApi = "enteryourguidforapikey"
  $resourceAdd = "https://apps.sematext.com/spm-reports/api/v2/app/add"
  $resourceList = "https://apps.sematext.com/users-web/api/v2/app/list"
  $appname = "appname"
  #type of application solrcloud zk etc
  $type = "solrcloud"
  $bodyList = @{
    apiKey="$semaTextApi"
  }
  $allApps = Invoke-RestMethod -Method Post -Uri $resourceList -Body (ConvertTo-Json $bodyList) -ContentType application/json -UseBasicParsing

  $allApps.data.apps.spm | ForEach-Object { 
       if ($_.name -eq $appname)
          {
              Write-Host "App with Name $appname already exists in SPM"
              break
          } 
          else
          {
               $body = @{
              apiKey="$semaTextApi";name="$appname";type="$type"
              }

              Invoke-RestMethod -Method Post -Uri $resourceAdd -Body (ConvertTo-Json $body) -ContentType application/json -UseBasicParsing 
              } 
      } 
}
