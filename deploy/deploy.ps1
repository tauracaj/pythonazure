$resourceGroupName='taulant-simple-paas'
$appServiceName='tr-webapp-py'

az webapp deploy `
    --name $appServiceName `
    --resource-group $resourceGroupName `
    --src-path "C:\Projects\pythonazure\pythonappazure.zip"